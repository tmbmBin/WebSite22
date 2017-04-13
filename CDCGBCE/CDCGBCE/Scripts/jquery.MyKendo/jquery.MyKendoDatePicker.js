/*
 *  作者：FrankWu
 *  建立日期：2013.06.24
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.1.319）
 *      4. 若要套用在 Server Control，請用 TextBox，以確保 PostBack 之後值不會消失
  

    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1-fix.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>

    <%-- ↓↓KendoUI(民國) 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web-chinese.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/cultures/kendo.culture.zh-TW-chinese.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />
    <%-- ↑↑KendoUI(民國) 所需檔案↑↑ --%>
    <%-- ↓↓KendoUI(西元) 所需檔案↓↓ --%>
    <%--<script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/cultures/kendo.culture.zh-TW.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />
    --%><%-- ↑↑KendoUI(西元) 所需檔案↑↑ --%>


 *  描述：
 *      1. 自動套用 kendoDatePicker，並初始化成專案的需求
 *      2. 具起始、結束日期的 kendoDatePicker，其最大值、最小值會互相牽制
 *
 *  使用方式：
 *      1. 全部套用：$.MyKendoDatePicker([options]);
 *          a. 自動找尋 [MyKendoDatePicker='MyKendoDatePicker'] 的 input 標籤套用 kendoDatePicker
 *      2. 個別套用：$(Selectors).MyKendoDatePicker([options]);
 *      3. 設定具起始、結束日期的 kendoDatePicker：$.MyKendoDatePicker(jqStart, jqEnd, [options]);
 *          a. jqStart：起始日期控制項，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *          b. jqEnd：起始日期控制項，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *      4. options
 *          a. 參考 http://docs.kendoui.com/api/web/datepicker
 *
 *  已知問題：
 *      #1. 
 *
 *  修改歷程：
 *      2013.06.24：Init
 *      2013.07.04：Fix：設定具起始、結束日期的 kendoDatePicker 的參數個數移到最前面先判斷
 *      2013.07.04：Fix：抓錯物件來判斷
 *          因為若被初始化過之後，此 input 的 css 也會被套用到 wrapper，若又使用 $$("##..") 的方式抓取，就會抓到兩個控制項，造成判斷有問題
 *      2013.07.30：
 *                  Add：關閉瀏覽器的自動完成功能
 *                  Add：當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
 *      2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
 *
*/
(function ($) {
    
    //全域設定
    $.MyKendoDatePicker = function (opt1, opt2, opt3) {
        /// <summary>
        /// 設定 MyKendoDatePicker
        /// <para>（標籤含 [MyKendoDatePicker='MyKendoDatePicker'] 的 input）</para>
        /// </summary>

        var options = {};
        var jqStart = {};
        var jqEnd = {};

        //2013.07.04：Fix：設定具起始、結束日期的 kendoDatePicker 的參數個數移到最前面先判斷
        if ((typeof opt1 === "string" || typeof opt1 === "object")
            && (typeof opt2 === "string" || typeof opt2 === "object")) {
            //$.MyKendoDatePicker(jqStart, jqEnd, [options]);
            jqStart = (opt1.jquery ? opt1 : $(opt1));
            jqEnd = (opt2.jquery ? opt2 : $(opt2));
            options = opt3;
            fnSetStartEndKendoDatePicker(jqStart, jqEnd, options);
        } else if (typeof opt1 === "object") {
            //$.MyKendoDatePicker();
            options = opt1;
            fnSetKendoDatePicker($("[MyKendoDatePicker='MyKendoDatePicker']"), options);
        } else {
            //$.MyKendoDatePicker(options);
            fnSetKendoDatePicker($("[MyKendoDatePicker='MyKendoDatePicker']"));
        }
    }

    //個別設定
    $.fn.MyKendoDatePicker = function (options) {
        /// <summary>
        /// 設定 MyKendoDatePicker
        /// </summary>

        fnSetKendoDatePicker(this, options);

        return this;
    }


    var minDate = new Date(1911, 0, 1);
    var maxDate = new Date(2099, 11, 31);

    function fnSetKendoDatePicker(jqControl, options) {

        jqControl.filter("input").each(function () {

            var $this = $(this);
            var format = "";
            var parseFormats = [];
            

            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoDatePicker") || {})) {

            }
            else {
                return;
            }


            /* 設定語系，自動判斷民國年或西元年 */
            kendo.culture("zh-TW");
            var pattern = kendo.culture().calendars.standard.patterns["d"];
            if (pattern.split("/")[0] == "yyy") {
                format = "yyy/MM/dd";
                parseFormats = ["yyy/MM/dd"];
            } else {
                format = "yyyy/MM/dd";
                parseFormats = ["yyyy/MM/dd"];
            }


            var defaults = {
                //culture: "zh-TW",
                //format: "yyy/MM/dd",
                format: format,
                //parseFormats: ["yyy/MM/dd"],
                parseFormats: parseFormats,
                value: null,
                min: minDate,
                max: maxDate,
                //start: MONTH,
                //depth: MONTH,
                //dates: [],
                //month: {},
                footer: "今天：#=kendo.toString(data, 'D', 'zh-TW')#"
            };
            var settings = $.extend(defaults, options);


            $this.kendoDatePicker(settings)
                .closest(".k-widget")
                .css("font-size", "85%")
                //.css("width", "110px")
                //.width("95%")
            //.attr("title", "滑鼠點兩下可開啟日曆選擇器！");


            var kendoObj = $this.data("kendoDatePicker");
            var $wrapper = kendoObj.wrapper;        //將原始 input 的包起來的容器
            var $element = kendoObj.element;        //原始的 input


            $element
                .attr("autocomplete", "off")
                //.css("font-size", "100%")
                //.css("padding", "0px")
                .dblclick(function () {
                    if ($(this).is("[readonly='readonly']")) {

                    } else {
                        kendoObj.open();
                    }
                });


            var wrapperWidthSetting = $wrapper.get(0).style.width || "";     //原始設定的寬度
            var wrapperWidth = $wrapper.width() || 0;                        //實際的寬度
            //#region wrapper

            //當所在容器內只有自己一個元素時，自動調整寬度
            if ($wrapper.parent().children().length == 1
                && wrapperWidthSetting == "") {
                $wrapper.width("95%");
                //wrapperWidth = $wrapper.width() || 0;
                //2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
                $wrapper.ready(function () {
                    wrapperWidth = $wrapper.width() || 0;
                });
            }


            if ($element.is("[disabled]")) {

            } else {
                $wrapper.attr("title", "滑鼠點兩下可開啟日曆選擇器！");
            }

            //#endregion

        });
    }


    /// 設定具起始、結束日期的 kendoDatePicker
    function fnSetStartEndKendoDatePicker(jqStart, jqEnd, options) {
    	/// <summary>
        /// 設定具起始、結束日期的 kendoDatePicker
        /// <para>（其最大值、最小值會互相牽制）</para>
    	/// </summary>
    	/// <param name="jqStart">起始日期</param>
    	/// <param name="jqEnd">結束日期</param>
        /// <param name="options">組態設定</param>

        //2013.07.04：Fix：抓錯物件來判斷
        //  因為若被初始化過之後，此 input 的 css 也會被套用到 wrapper，若又使用 $$("##..") 的方式抓取，就會抓到兩個控制項，造成判斷有問題
        jqStart = jqStart.filter("input");
        jqEnd = jqEnd.filter("input");

        var dpStart = null;
        var dpEnd = null;


        /* 初始化控制項 */
        if ($.isEmptyObject(jqStart.data("kendoDatePicker") || {})) {
            jqStart.MyKendoDatePicker(options);
            dpStart = jqStart.data("kendoDatePicker");
        } else {
            dpStart = jqStart.data("kendoDatePicker");
            dpStart.setOptions(options);
        }

        if ($.isEmptyObject(jqEnd.data("kendoDatePicker") || {})) {
            jqEnd.MyKendoDatePicker(options);
            dpEnd = jqEnd.data("kendoDatePicker");
        } else {
            dpEnd = jqEnd.data("kendoDatePicker");
            dpEnd.setOptions(options);
        }


        //var dpStart = jqStart.data("kendoDatePicker");
        //var dpEnd = jqEnd.data("kendoDatePicker");

        var onChange = function () {
            var startValue = dpStart.value();
            var endValue = dpEnd.value();

            if (startValue) {
                dpEnd.min(startValue);
            } else {
                dpEnd.min(minDate);

                //模擬畫面重整的動作
                //解決當 maxDate 跟 minDate 在同個月份時，又清掉其中一個日期，其畫面不會重整
                dpEnd.dateView.calendar.navigateToFuture();
                dpEnd.dateView.calendar.navigateToPast();
            }

            if (endValue) {
                dpStart.max(endValue);
            } else {
                dpStart.max(maxDate);
               
                //模擬畫面重整的動作
                //解決當 maxDate 跟 minDate 在同個月份時，又清掉其中一個日期，其畫面不會重整
                dpStart.dateView.calendar.navigateToFuture();
                dpStart.dateView.calendar.navigateToPast();
            }
            

            /* 日期合法性檢查 */
            var startValueSrc = dpStart.element.val();
            var endValueSrc = dpEnd.element.val();

            if (!startValue && startValueSrc) {
                alert("起始日期必須在結束日期之前！");
                dpStart.value(null);
            }

            if (!endValue && endValueSrc) {
                alert("結束日期必須在起始日期之後！");
                dpEnd.value(null);
            }
            //kendoConsole.log("dpStart=" + dpStart.element.val());
            //kendoConsole.log("dpEnd=" + dpEnd.element.val());
        };


        dpStart.bind("change", onChange);
        dpEnd.bind("change", onChange);

        dpStart.max(dpEnd.value());
        dpEnd.min(dpStart.value());
    }

})(jQuery);