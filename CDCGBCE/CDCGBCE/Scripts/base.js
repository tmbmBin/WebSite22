/// 需要引用 jQuery 檔案
/// <reference path="http://localhost/FrankWu.WebSite/_JS/jquery.min.js" />


$(function () {
    fnSetClassId();
    fnSetToolTip();
});
//20160429 closeDlg
function closeDlgAndRefresh(msg, triggerBtnName) {
	MyLibraryJs.JqPluginExt.fnKendoWindowClose();
	if ("undefined" == typeof(msg) || null == msg)
		return false;
	alert(msg);
	$("#" + triggerBtnName).trigger("click");
}
//20160429 closeDlg
function closeDlg(msg) {
//	try{
		MyLibraryJs.JqPluginExt.fnKendoWindowClose();
//	}
//	catch(e) { }
	if ("undefined" == typeof(msg) || null == msg)
		return false;
	alert(msg);
	var s = location.href;
	if (-1 == s.indexOf("WIN"))
		s += "&WIN=0";
	location.href = s;
}



/* 取值方式增加 $$("##ID") 的方式 */
var pattern = /##(\w+)/g;
window.$$ = function (selector, context) {
    selector = selector.replace(pattern, '._$1');
    return jQuery(selector, context);
}


//將所有 DOM 的 class 加上 ASP.NET 的 ID（如果有 ID 值的話）
function fnSetClassId() {
    /// <summary>
    /// 將所有 DOM 的 class 加上 ASP.NET 的 ID（如果有 ID 值的話）
    /// <para>（jQuery 存取方式：$("._ID")）</para>
    /// </summary>

    /* 將 :input 的 class 加上 ASP.NET 的 ID */
    //2012.01.31：Edit：改成將所有 DOM 都加上 ASP.NET 的 ID
    $("*").each(function () {
        //2012.02.26：Fix：因為容器的前置字不一定是 ctl 開頭的，拿掉 ctl
        //有些會以 @Register 的 tagName 來命名
        var pattern = /(\w+_)?(\w+)/g;       //ex：id值、ctl..._id值
        //var pattern = /(ctl\w+_)?(\w+)/g;       //ex：id值、ctl..._id值

        //Fix：2012.01.18，先 test，避免 RegExp.$2 取到舊值
        if (pattern.test($(this)[0].id)) {
            $(this)[0].id.match(pattern);
            $(this).addClass('_' + RegExp.$2);
        }
    });
}


//將按鈕加上 ToolTip
function fnSetToolTip(isUsejQueryToolsTooltip) {
    /// <summary>
    /// 將按鈕加上 ToolTip
    /// </summary>
    /// <param name="isUsejQueryToolsTooltip">是否使用 jQueryTools.Tooltip 方式</param>

    isUsejQueryToolsTooltip = (isUsejQueryToolsTooltip != undefined ? isUsejQueryToolsTooltip : false);


    $(":submit, :button, input[type='text'], select").each(function () {
        //$(":submit, :button, select").each(function () {
        var $sender = $(this);
        var $trigger = $sender;
        var title;


        //2012.04.05：增加 SELECT DOM，也有 ToolTip
        //if ($(this).is("select")) {
        //    title = $(this).prop("title") != "" ? $(this).prop("title") : $(this).find(":selected").text();
        //} else {
        //    title = $(this).prop("title") != "" ? $(this).prop("title") : $(this).val();
        //}


        //$(this).prop("title", title);


        if ($sender.is(":checkbox")) {
            if ($sender.parent().is("span") && $sender.is(":only-child")) {
                $trigger = $sender.parent();
            }
        }


        title = $trigger.prop("title") != "" ? $trigger.prop("title") : $trigger.val();

        if ($sender.is("select")) {
            title = $sender.children().filter(":selected").text();
        } else if ($sender.is(":checkbox")) {
            title = $trigger.prop("title");
        }


        //2012.05.15：Add：disabled 時，才自動設定 Tooltip
        $trigger.not("[title='']").filter("[disabled]").prop("title", title);
    })
}