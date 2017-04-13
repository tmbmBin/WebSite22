/*
 *  作者：FrankWu
 *  建立日期：2013.07.22
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.2.716）


    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1-fix.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>

    <%-- ↓↓KendoUI 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />
    <%-- ↑↑KendoUI 所需檔案↑↑ --%>
    <%-- ↓↓其他 plugin↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery.caret/jquery.caret.1.02.min.js")%>" type="text/javascript"></script>
    <%-- ↑↑其他 plugin↑↑ --%>


 *  描述：
 *      1. 將畫面初始化為 KendoUI 樣式的模式
 *          a. 按鈕
 *          b. 
 *
 *  使用方式：
 *      1. 本檔案要放在 KendoUI 檔案的後面
 *      2. 不需要手動執行，畫面載入後會自動執行
 *
 *  已知問題：
 *      #1. 
 *
 *  修改歷程：
 *      2013.07.22：Init
 *
*/
(function ($) {

    $(function () {
        $.MyKendoInit();
    });

    
    //全域設定
    $.MyKendoInit = function () {
        if (!("kendo" in window)) {
            //throw "xxx";
            alert("請先載入 KendoUI 的檔案！");
        } else {
            /* 初始化 button 的樣式 */
            $("input[type='button'], input[type='submit']").addClass("k-button");
            $("input[type='button'][disabled], input[type='submit'][disabled]").addClass("k-state-disabled");

            //$("input[type='text']").addClass("k-textbox");
            //todo：要排除掉已被 kendoUI 化的 textbox
        }
    }

})(jQuery);