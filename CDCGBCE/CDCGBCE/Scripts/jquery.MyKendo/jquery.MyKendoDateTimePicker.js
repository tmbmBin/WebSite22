/*
 *  作者：FrankWu
 *  建立日期：2013.10.25
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.2.716）
 *      4. 需要引用 MyLibraryJs
 *      5. 需要引用 jquery.MyKendoDatePicker.js
 *      6. 需要引用 jquery.MyKendoDateTimePicker.js
 *      7. 若要套用在 Server Control，請用 TextBox，以確保 PostBack 之後值不會消失
  

    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1-fix.min.js")%>" type="text/javascript"></script>
    <%--<script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>--%>
    
    <%-- ↓↓MyLibraryJs 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/MyLibraryJs/MyLibraryJs.min.js")%>" type="text/javascript"></script>
    <%-- ↑↑MyLibraryJs 所需檔案↑↑ --%>
    <%-- ↓↓jquery.MyKendo 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.MyKendo/jquery.MyKendoAll.min.js")%>" type="text/javascript"></script>
    <%-- ↑↑jquery.MyKendo 所需檔案↑↑ --%>
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
 *      1. 將兩個 TextBox 套用成為日期、時間的選擇器，一個為 kendoDatePicker，另一個為 kendoTimePicker
 *      2. 具起始、結束日期時間的 kendoDatePicker、kendoTimePicker，其最大值、最小值會互相牽制
 *
 *  使用方式：
 *      1. 個別套用：$(Selectors).MyKendoDateTimePicker(jqDate, jqTime, [options]);
 *          a. jqDate：日期控制項，會變成 kendoDatePicker，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *          b. jqTime：時間控制項，會變成 kendoTimePicker，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *      2. 設定具起始、結束日期時間的 kendoDatePicker、kendoTimePicker：$.MyKendoDateTimePicker(jqDateS, jqTimeS, jqDateE, jqTimeE, [options]);
 *          a. jqDateS：起始日期控制項，會變成 kendoDatePicker，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *          b. jqTimeS：起始時間控制項，會變成 kendoTimePicker，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *          c. jqDateE：起始日期控制項，會變成 kendoDatePicker，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *          d. jqTimeE：起始時間控制項，會變成 kendoTimePicker，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *      3. options

                var options = {
                    RequireMode: 1,
                    DateOptions: {},
                    TimeOptions: {}
                };

 *          a. RequireMode：檢查必填的模式
 *              0、其他：不檢查
 *              1：檢查日期
 *              2：檢查時間
 *              3：檢查日期、時間
 *          b. DateOptions：參考 http://docs.kendoui.com/api/web/datepicker
 *          c. TimeOptions：參考 http://docs.kendoui.com/api/web/timepicker
 *
 *  已知問題：
 *      #1. 起始、結束的日期時間控制項，兩者之間最大值、最小值的牽制，可能還會有遺漏的 case
 *
 *  修改歷程：
 *      2013.10.25：Init
 *
*/
(function ($) {
    
    //全域設定
    $.MyKendoDateTimePicker = function (opt1, opt2, opt3, opt4, opt5) {
        /// <summary>
        /// 設定 MyKendoDateTimePicker
        /// </summary>

        var options = {};
        var jqStart = {};
        var jqEnd = {};

        if ((typeof opt1 === "string" || typeof opt1 === "object")
            && (typeof opt2 === "string" || typeof opt2 === "object")
            && (typeof opt3 === "string" || typeof opt3 === "object")
            && (typeof opt4 === "string" || typeof opt4 === "object")) {
            /* $.MyKendoDateTimePicker(jqDateS, jqTimeS, jqDateE, jqTimeE, [options]); */
            
            jqDateS = (opt1.jquery ? opt1 : $(opt1));
            jqTimeS = (opt2.jquery ? opt2 : $(opt2));
            jqDateE = (opt3.jquery ? opt3 : $(opt3));
            jqTimeE = (opt4.jquery ? opt4 : $(opt4));
            options = opt5;
            fnSetStartEndKendoDateTimePicker(jqDateS, jqTimeS, jqDateE, jqTimeE, options);
        } else if ((typeof opt1 === "string" || typeof opt1 === "object")
            && (typeof opt2 === "string" || typeof opt2 === "object")) {
            /* $.MyKendoDateTimePicker(jqDate, jqTime, [options]); */

            jqDate = (opt1.jquery ? opt1 : $(opt1));
            jqTime = (opt2.jquery ? opt2 : $(opt2));
            options = opt3;
            fnSetKendoDateTimePicker(jqDate, jqTime, options);
        }
    }


    var minDate = new Date(1911, 0, 1);
    var maxDate = new Date(2099, 11, 31);

    /// 將兩個 TextBox 套用成為日期、時間的選擇器
    /// <para>（第一個為 kendoDatePicker）</para>
    /// <para>（第二個為 kendoTimePicker）</para>
    //#region fnSetKendoDateTimePicker
    function fnSetKendoDateTimePicker(jqDate, jqTime, options) {
    	/// <summary>
        /// 將兩個 TextBox 套用成為日期、時間的選擇器
        /// <para>（第一個為 kendoDatePicker）</para>
        /// <para>（第二個為 kendoTimePicker）</para>
    	/// </summary>
    	/// <param name="jqDate">日期</param>
    	/// <param name="jqTime">時間</param>
        /// <param name="options">組態設定</param>
        
        var defaults = {
            //RequireMode: 1,
            DateOptions: {},
            TimeOptions: {}
        };
        var settings = $.extend(defaults, options);


        //2013.07.04：Fix：抓錯物件來判斷
        //  因為若被初始化過之後，此 input 的 css 也會被套用到 wrapper，若又使用 $$("##..") 的方式抓取，就會抓到兩個控制項，造成判斷有問題
        jqDate = jqDate.filter("input");
        jqTime = jqTime.filter("input");

        var kdStart = null;
        var kdEnd = null;
        

        /* 初始化控制項 */
        if ($.isEmptyObject(jqDate.data("kendoDatePicker") || {})) {
            jqDate.MyKendoDatePicker(settings.DateOptions);
        } else {
            kdStart = jqDate.data("kendoDatePicker");
            kdStart.setOptions(settings.DateOptions);
        }

        if ($.isEmptyObject(jqTime.data("kendoTimePicker") || {})) {
            jqTime.MyKendoTimePicker(settings.TimeOptions);
        } else {
            kdEnd = jqTime.data("kendoTimePicker");
            kdEnd.setOptions(settings.TimeOptions);
        }


        /* 必填性檢查 */
        //fnSetDateTimeRequired(jqDate, jqTime, settings.RequireMode);
    }
    //#endregion


    /// 設定具起始、結束日期時間的 kendoDatePicker、kendoTimePicker
    /// <para>（其最大值、最小值會互相牽制）</para>
    //#region fnSetStartEndKendoDateTimePicker
    function fnSetStartEndKendoDateTimePicker(jqDateS, jqTimeS, jqDateE, jqTimeE, options) {
        /// <summary>
        /// 設定具起始、結束日期時間的 kendoDatePicker、kendoTimePicker
        /// <para>（其最大值、最小值會互相牽制）</para>
        /// </summary>
        /// <param name="jqDateS">起始日期</param>
        /// <param name="jqTimeS">起始時間</param>
        /// <param name="jqDateE">結束日期</param>
        /// <param name="jqTimeE">結束時間</param>
        /// <param name="options">組態設定</param>

        var defaults = {
            //RequireMode: 1,
            DateOptions: {},
            TimeOptions: {}
        };
        var settings = $.extend(defaults, options);


        //2013.07.04：Fix：抓錯物件來判斷
        //  因為若被初始化過之後，此 input 的 css 也會被套用到 wrapper，若又使用 $$("##..") 的方式抓取，就會抓到兩個控制項，造成判斷有問題
        jqDateS = jqDateS.filter("input");
        jqTimeS = jqTimeS.filter("input");
        jqDateE = jqDateE.filter("input");
        jqTimeE = jqTimeE.filter("input");

        if (jqDateS.length == 0) throw "找不到 jqDateS!";
        if (jqTimeS.length == 0) throw "找不到 jqTimeS!";
        if (jqDateE.length == 0) throw "找不到 jqDateE!";
        if (jqTimeE.length == 0) throw "找不到 jqTimeE!";


        var kdDateS = null;
        var kdTimeS = null;
        var kdDateE = null;
        var kdTimeE = null;


        /* 初始化控制項 */
        if ($.isEmptyObject(jqDateS.data("kendoDatePicker") || {})
            || $.isEmptyObject(jqTimeS.data("kendoTimePicker") || {})) {
            fnSetKendoDateTimePicker(jqDateS, jqTimeS, settings);
            kdDateS = jqDateS.data("kendoDatePicker");
            kdTimeS = jqTimeS.data("kendoTimePicker");
        } else {
            kdDateS = jqDateS.data("kendoDatePicker");
            kdTimeS = jqTimeS.data("kendoTimePicker");

            /* 必填性檢查 */
            //fnSetDateTimeRequired(jqDateS, jqTimeS, settings.RequireMode);

            kdDateS.setOptions(settings.DateOptions);
            kdTimeS.setOptions(settings.TimeOptions);
        }

        if ($.isEmptyObject(jqDateE.data("kendoDatePicker") || {})
            || $.isEmptyObject(jqTimeE.data("kendoTimePicker") || {})) {
            fnSetKendoDateTimePicker(jqDateE, jqTimeE, settings);
            kdDateE = jqDateE.data("kendoDatePicker");
            kdTimeE = jqTimeE.data("kendoTimePicker");
        } else {
            kdDateE = jqDateE.data("kendoDatePicker");
            kdTimeE = jqTimeE.data("kendoTimePicker");

            /* 必填性檢查 */
            //fnSetDateTimeRequired(jqDateE, jqTimeE, settings.RequireMode);

            kdDateE.setOptions(settings.DateOptions);
            kdTimeE.setOptions(settings.TimeOptions);
        }


        var onChange = function () {
            var sender = this;

            var DateSValue = kdDateS.value();
            var TimeSValue = kdTimeS.value();
            var DateEValue = kdDateE.value();
            var TimeEValue = kdTimeE.value();
            
            //取得跟標準日之間差的毫秒
            var iTemp = 0;
            var iToday = (!isNaN(iTemp = Date.parse(MyLibraryJs.DateTimeExt.fnGetToday())) ? iTemp : 0);
            var iDateSValueMiS = (!isNaN(iTemp = Date.parse(DateSValue)) ? iTemp : 0);
            var iTimeSValueMiS = (!isNaN(iTemp = Date.parse(TimeSValue)) ? iTemp : iToday);
            var iDateEValueMiS = (!isNaN(iTemp = Date.parse(DateEValue)) ? iTemp : 0);
            var iTimeEValueMiS = (!isNaN(iTemp = Date.parse(TimeEValue)) ? iTemp : iToday);

            var iStartDTime = iDateSValueMiS + iTimeSValueMiS;
            var iEndDTime = iDateEValueMiS + iTimeEValueMiS;


            //console.log("iDateSValueMiS=" + iDateSValueMiS.toString());
            //console.log("iTimeSValueMiS=" + iTimeSValueMiS.toString());
            //console.log("iDateEValueMiS=" + iDateEValueMiS.toString());
            //console.log("iTimeEValueMiS=" + iTimeEValueMiS.toString());

            //console.log("iStartDTime=" + iStartDTime.toString());
            //console.log("iEndDTime=" + iEndDTime.toString());
            //console.log("============");

            
            if (iDateSValueMiS == iDateEValueMiS) {
                /* 若日期相同，限定時間大小值 */

                /* 日期 */
                kdDateS.min(minDate);
                kdDateS.max(DateEValue);

                kdDateE.min(DateSValue);
                kdDateE.max(maxDate);


                /* 時間 */
                if (TimeSValue) {
                    kdTimeE.min(TimeSValue);
                } else {
                    kdTimeE.min(minDate);
                }

                if (TimeEValue) {
                    kdTimeS.max(TimeEValue);
                } else {
                    kdTimeS.max(maxDate);
                }
            } else {
                /* 若日期不相同，限定日期大小值，但要解除限定時間的大小值 */

                /* 時間 */
                kdTimeS.max(maxDate);
                kdTimeS.min(minDate);

                kdTimeE.max(maxDate);
                kdTimeE.min(minDate);


                /* 日期 */
                if (DateSValue) {
                    kdDateE.min(DateSValue);
                } else {
                    kdDateE.min(minDate);

                    //模擬畫面重整的動作
                    //解決當 maxDate 跟 minDate 在同個月份時，又清掉其中一個日期，其畫面不會重整
                    kdDateE.dateView.calendar.navigateToFuture();
                    kdDateE.dateView.calendar.navigateToPast();
                }

                if (DateEValue) {
                    kdDateS.max(DateEValue);
                } else {
                    kdDateS.max(maxDate);

                    //模擬畫面重整的動作
                    //解決當 maxDate 跟 minDate 在同個月份時，又清掉其中一個日期，其畫面不會重整
                    kdDateS.dateView.calendar.navigateToFuture();
                    kdDateS.dateView.calendar.navigateToPast();
                }
            }


            ///* 日期合法性檢查 */
            //var startValueSrc = dpStart.element.val();
            //var endValueSrc = dpEnd.element.val();

            //if (!startValue && startValueSrc) {
            //    alert("起始日期必須在結束日期之前！");
            //    dpStart.value(null);
            //}

            //if (!endValue && endValueSrc) {
            //    alert("結束日期必須在起始日期之後！");
            //    dpEnd.value(null);
            //}
            ////kendoConsole.log("dpStart=" + dpStart.element.val());
            ////kendoConsole.log("dpEnd=" + dpEnd.element.val());
        };


        kdDateS.bind("change", onChange);
        kdTimeS.bind("change", onChange);
        kdDateE.bind("change", onChange);
        kdTimeE.bind("change", onChange);

        //dpStart.max(dpEnd.value());
        //dpEnd.min(dpStart.value());
    }
    //#endregion


    /// 設定必填性檢查
    //#region fnSetDateTimeRequired
    function fnSetDateTimeRequired(jqDate, jqTime, iRequireMode) {
    	/// <summary>
        /// 設定必填性檢查
    	/// </summary>
        /// <param name="jqDate"></param>
        /// <param name="jqTime"></param>
    	/// <param name="iRequireMode"></param>

        if (iRequireMode == 1) {
            //1：日期必填
            MyLibraryJs.JqPluginExt.fnSetRequired(jqDate, true);
            MyLibraryJs.JqPluginExt.fnSetRequired(jqTime, false);
        } else if (iRequireMode == 2) {
            //2：時間必填
            MyLibraryJs.JqPluginExt.fnSetRequired(jqDate, false);
            MyLibraryJs.JqPluginExt.fnSetRequired(jqTime, true);
        } else if (iRequireMode == 3) {
            //3：日期、時間必填
            MyLibraryJs.JqPluginExt.fnSetRequired(jqDate, true);
            MyLibraryJs.JqPluginExt.fnSetRequired(jqTime, true);
        } else {
            //0、其他：不檢查必填
            MyLibraryJs.JqPluginExt.fnSetRequired(jqDate, false);
            MyLibraryJs.JqPluginExt.fnSetRequired(jqTime, false);
        }
    }
    //#endregion


})(jQuery);