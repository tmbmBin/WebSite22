/*
 *  作者：FrankWu
 *  建立日期：2013.08.01
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.2.716）
 *      5. 若要套用在 Server Control，請用 TextBox，以確保 PostBack 之後值不會消失


    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>

    <%-- ↓↓KendoUI 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />
    <%-- ↑↑KendoUI 所需檔案↑↑ --%>


 *  描述：
 *      1. 自動套用 kendoNumericTextBox，並初始化成專案的需求
 *          a. 只能輸入數字
 *          b. 有增加、減少數值的按鈕可以按(預設不顯示)
 *          c. 依據 maxLength，自動調整可輸入的最大值  //x 、最小值
 *
 *  使用方式：
 *      1. 個別套用：$(Selectors).MyKendoNumericTextBox([options]);
 *      2. options
 *          a. 參考 http://docs.kendoui.com/api/web/numerictextbox
 *
 *  已知問題：
 *      #1. 
 *
 *  修改歷程：
 *      2013.08.01：Init
 *      2013.08.15：Add：當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
 *      2013.08.22：Add：依據 maxLength，自動調整可輸入的最大值、最小值
 *      2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
 *      2013.09.26：Fix：修正 IE 使用注音輸入法，無法用右側數字鍵輸入的情況
 *
*/
(function ($) {

    //全域設定
    $.MyKendoNumericTextBox = function (options) {
        /// <summary>
        /// 設定 MyKendoNumericTextBox
        /// <para>（標籤含 [MyKendoNumericTextBox='MyKendoNumericTextBox'] 的 input）</para>
        /// </summary>

        fnSetKendoNumericTextBox($("[MyKendoNumericTextBox='MyKendoNumericTextBox']"), options);
    }

    //個別設定
    $.fn.MyKendoNumericTextBox = function (options) {
        /// <summary>
        /// 設定 MyKendoNumericTextBox
        /// </summary>

        fnSetKendoNumericTextBox(this, options);

        return this;
    }


    function fnSetKendoNumericTextBox(jqSelect, options) {

        jqSelect.filter("input").each(function () {

            var $this = $(this);


            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoNumericTextBox") || {})) {

            }
            else {
                return;
            }


            var defaults = {
                decimals: 0,
                //min: NULL,
                //max: NULL,
                //value: NULL,
                step: 1,
                //culture: "",
                format: "#,#",
                spinners: false,
                //placeholder: "",
                upArrowText: "增加數值",
                downArrowText: "減少數值"
            };
            var settings = $.extend(defaults, options);


            $this.kendoNumericTextBox(settings)
                .closest(".k-widget")
                .css("font-size", "85%")
            //.width("95%")
            //.attr("title", "選取資料請按 Enter！");


            var kendoObj = $this.data("kendoNumericTextBox");
            var $wrapper = kendoObj.wrapper;        //將原始 input 的包起來的容器
            var $element = kendoObj.element;        //原始的 input


            $element
                .attr("autocomplete", "off")
                //2013.09.26：Fix：修正 IE 使用注音輸入法，無法用右側數字鍵輸入的情況
                .css({
                    "-ms-ime-mode": "disabled",
                    "ime-mode": "disabled"
                })
                .focus(function () {
                    $(this).select();
                });


            //2013.08.22：Add：依據 maxLength，自動調整可輸入的最大值 //x 、最小值
            var maxValue = kendoObj.max();
            if (maxValue === null) {
                var maxLength = $element.attr("maxLength") || 0;
                if (maxLength > 0) {
                    //2013.08.22：Edit：拿掉最小值限制
                    //kendoObj.min(Math.pow(10, maxLength - 1));
                    kendoObj.max(Math.pow(10, maxLength) - 1);
                }
            }


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
                $wrapper.attr("title", "用鍵盤的 ↑、↓，可以增減值！");
            }
            //#endregion

        });
    }

})(jQuery);