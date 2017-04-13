/*
 *  作者：FrankWu
 *  建立日期：2013.07.30
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.2.716）
 *      4. 若要套用在 Server Control，請用 TextBox，以確保 PostBack 之後值不會消失
  

    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>

    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/cultures/kendo.culture.zh-TW.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />


 *  描述：
 *      1. 自動套用 kendoTimePicker，並初始化成專案的需求
 *      2. 具起始、結束時間的 kendoTimePicker，其最大值、最小值會互相牽制
 *
 *  使用方式：
 *      1. 全部套用：$.MyKendoTimePicker([options]);
 *          a. 自動找尋 [MyKendoTimePicker='MyKendoTimePicker'] 的 input 標籤套用 kendoTimePicker
 *      2. 個別套用：$(Selectors).MyKendoTimePicker([options]);
 *      3. 設定具起始、結束時間的 kendoTimePicker：$.MyKendoTimePicker(jqStart, jqEnd, [options]);
 *          a. jqStart：起始時間控制項，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *          b. jqEnd：起始時間控制項，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *      4. options
 *          a. 參考 http://docs.kendoui.com/api/web/timepicker
 *
 *  已知問題：
 *      #1. 
 *
 *  修改歷程：
 *      2013.07.30：Init，從 MyKendoDatePicker.js 複製而來
 *      2013.07.30：
 *                  Add：關閉瀏覽器的自動完成功能
 *                  Add：當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
 *      2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
 *
*/
(function ($) {
    
    //全域設定
    $.MyKendoTimePicker = function (opt1, opt2, opt3) {
        /// <summary>
        /// 設定 MyKendoTimePicker
        /// <para>（標籤含 [MyKendoTimePicker='MyKendoTimePicker'] 的 input）</para>
        /// </summary>

        var options = {};
        var jqStart = {};
        var jqEnd = {};

        //2013.07.04：Fix：設定具起始、結束時間的 kendoTimePicker 的參數個數移到最前面先判斷
        if ((typeof opt1 === "string" || typeof opt1 === "object")
            && (typeof opt2 === "string" || typeof opt2 === "object")) {
            //$.MyKendoTimePicker(jqStart, jqEnd, [options]);
            jqStart = (opt1.jquery ? opt1 : $(opt1));
            jqEnd = (opt2.jquery ? opt2 : $(opt2));
            options = opt3;
            fnSetStartEndKendoTimePicker(jqStart, jqEnd, options);
        } else if (typeof opt1 === "object") {
            //$.MyKendoTimePicker();
            options = opt1;
            fnSetKendoTimePicker($("[MyKendoTimePicker='MyKendoTimePicker']"), options);
        } else {
            //$.MyKendoTimePicker(options);
            fnSetKendoTimePicker($("[MyKendoTimePicker='MyKendoTimePicker']"));
        }
    }

    //個別設定
    $.fn.MyKendoTimePicker = function (options) {
        /// <summary>
        /// 設定 MyKendoTimePicker
        /// </summary>

        fnSetKendoTimePicker(this, options);

        return this;
    }


    var minDate = new Date(1911, 0, 1);
    var maxDate = new Date(2099, 11, 31);

    function fnSetKendoTimePicker(jqControl, options) {

        jqControl.filter("input").each(function () {

            var $this = $(this);
            var format = "";
            var parseFormats = [];


            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoTimePicker") || {})) {

            }
            else {
                return;
            }


            /* 設定語系，自動判斷民國年或西元年 */
            kendo.culture("zh-TW");


            var defaults = {
                //culture: "zh-TW",
                format: "HH:mm",    //24時制
                parseFormats: [],
                value: null,
                min: minDate,
                max: maxDate,
                interval: 30,
                height: 200
            };
            var settings = $.extend(defaults, options);


            $this.kendoTimePicker(settings)
                .closest(".k-widget")
                .css("font-size", "85%")
                //.width("95%")
            //.attr("title", "滑鼠點兩下可開啟時間選擇器！");


            var kendoObj = $this.data("kendoTimePicker");
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
                $wrapper.attr("title", "滑鼠點兩下可開啟時間選擇器！");
            }

            //#endregion

        });
    }


    /// 設定具起始、結束時間的 kendoTimePicker
    function fnSetStartEndKendoTimePicker(jqStart, jqEnd, options) {
    	/// <summary>
        /// 設定具起始、結束時間的 kendoTimePicker
        /// <para>（其最大值、最小值會互相牽制）</para>
    	/// </summary>
        /// <param name="jqStart">起始時間</param>
        /// <param name="jqEnd">結束時間</param>
        /// <param name="options">組態設定</param>

        //2013.07.04：Fix：抓錯物件來判斷
        //  因為若被初始化過之後，此 input 的 css 也會被套用到 wrapper，若又使用 $$("##..") 的方式抓取，就會抓到兩個控制項，造成判斷有問題
        jqStart = jqStart.filter("input");
        jqEnd = jqEnd.filter("input");

        var dpStart = null;
        var dpEnd = null;


        /* 初始化控制項 */
        if ($.isEmptyObject(jqStart.data("kendoTimePicker") || {})) {
            jqStart.MyKendoTimePicker(options);
            dpStart = jqStart.data("kendoTimePicker");
        } else {
            dpStart = jqStart.data("kendoTimePicker");
            dpStart.setOptions(options);
        }

        if ($.isEmptyObject(jqEnd.data("kendoTimePicker") || {})) {
            jqEnd.MyKendoTimePicker(options);
            dpEnd = jqEnd.data("kendoTimePicker");
        } else {
            dpEnd = jqEnd.data("kendoTimePicker");
            dpEnd.setOptions(options);
        }


        //var dpStart = jqStart.data("kendoTimePicker");
        //var dpEnd = jqEnd.data("kendoTimePicker");

        var onChange = function () {
            var startValue = dpStart.value();
            var endValue = dpEnd.value();

            if (startValue) {
                dpEnd.min(startValue);
            } else {
                dpEnd.min(minDate);
            }

            if (endValue) {
                dpStart.max(endValue);
            } else {
                dpStart.max(maxDate);
            }
            

            /* 時間合法性檢查 */
            var startValueSrc = dpStart.element.val();
            var endValueSrc = dpEnd.element.val();

            if (!startValue && startValueSrc) {
                alert("起始時間必須在結束時間之前！");
                dpStart.value(null);
            }

            if (!endValue && endValueSrc) {
                alert("結束時間必須在起始時間之後！");
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