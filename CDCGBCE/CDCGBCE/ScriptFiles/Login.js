$(function () {
    $.each($.browser, function (i) {
        if  (!$.browser.msie && !navigator.userAgent.match(/Trident\/7\./)){
		//if (!$.browser.msie) {
			location.href = "noauthority.htm";
		}
	});
});
