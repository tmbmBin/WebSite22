/*
 *  作者：FrankWu
 *  建立日期：2013.12.11
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.2.716）


    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1.min.js")%>" type="text/javascript"></script>
    <%--<script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>--%>

    <%-- ↓↓KendoUI 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />
    <%-- ↑↑KendoUI 所需檔案↑↑ --%>


 *  描述：
 *      1. 自動套用 kendoUpload，並初始化成專案的需求
 *          a. 僅可單一檔案上傳，其他功能在 IE 相容性模式下跑大都有問題
 *
 *  使用方式：
 *      1. 全部套用：$.MyKendoUpload([options]);
 *          a. 自動找尋 [MyKendoUpload='MyKendoUpload'] 的 select、input 標籤套用 kendoUpload
 *      2. 個別套用：$(Selectors).MyKendoUpload([options]);
 *      3. options
 *          a. 參考 http://docs.kendoui.com/api/web/upload
 *
 *  已知問題：
 *      #1. IE 相容性模式下不可以啟用非同步上傳、多檔案上傳，因為會有問題
 *
 *  修改歷程：
 *      2013.12.11：Init
 *
*/
(function ($) {

    //全域設定
    $.MyKendoUpload = function (options) {
        /// <summary>
        /// 設定 MyKendoUpload
        /// <para>（標籤含 [MyKendoUpload='MyKendoUpload'] 的 input）</para>
        /// </summary>

        fnSetKendoUpload($("[MyKendoUpload='MyKendoUpload']"), options);
    }

    //個別設定
    $.fn.MyKendoUpload = function (options) {
        /// <summary>
        /// 設定 MyKendoUpload
        /// </summary>

        fnSetKendoUpload(this, options);

        return this;
    }


    function fnSetKendoUpload(jqSelect, options) {

        jqSelect.filter("input[type='file']").each(function () {

            var $this = $(this);
            options = options || {};


            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoUpload") || {})) {

            }
            else {
                return;
            }


            var defaults = {
                enabled: true,
                multiple: false,
                showFileList: true,
                //template: "",
                //只對 async 有用
                //files: [],
                //async: {
                //    removeVerb: "POST",
                //    autoUpload: true
                //},
                localization: {
                    "select": "選取檔案...",
                    "cancel": "取消",
                    "retry": "重試",
                    "remove": "移除",
                    "uploadSelectedFiles": "上傳檔案",
                    "dropFilesHere": "拖拉檔案到這裡上傳",
                    "statusUploading": "正在上傳",
                    "statusUploaded": "已上傳",
                    "statusFailed": "失敗",
                    "headerStatusUploading": "上傳中...",
                    "headerStatusUploaded": "結束"
                }
            };
            var settings = $.extend(defaults, options);


            $this.kendoUpload(settings)
                .closest(".k-widget")
                .css("font-size", "85%");


            var kendoObj = $this.data("kendoUpload");
            var $wrapper = kendoObj.wrapper;        //將原始 input 的包起來的容器
            var $element = kendoObj.element;        //原始的 input（被隱藏）
            var $input = kendoObj.input;            //kendo 產生，用於顯示在畫面上的 input


            var wrapperWidthSetting = $wrapper.get(0).style.width || "";     //原始設定的寬度
            var wrapperWidth = $wrapper.width() || 0;                        //實際的寬度
            //#region wrapper

            $wrapper.width(350);

            //#endregion

        });

    }

})(jQuery);