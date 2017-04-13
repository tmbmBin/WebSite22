/// 需要引用 jQuery 檔案
function AjaxPost(url, params) {
	var def = {
		type: 'POST',
		url: url,
		contentType: 'application/json; charset=utf-8',
		dataType: 'json',
		success: function (data) { },
		error: function (e) {
			alert("連線錯誤!");
		}
	};
	if ("undefined" != params && null != params)
		def = $.extend(def, params);
	$.ajax(def);
}
//hdfPageIndex這些變數請參考，名字一定要相同
function InitPagination(obj, options) {
	var PageIndex = parseInt($("#hdfPageIndex").val(), 10);
	var PageSize = parseInt($("#hdfPageSize").val(), 10);
	var ItemsCount = parseInt($("#hdfItemsCount").val(), 10);

	var link_to = "javascript:void(0)";
	var defaults = {
		callback: function (newPageIdx, pagination_container) {
			//預設值
			$("#hdfPageIndex").val(newPageIdx);
			$('#btnPage').trigger('click');
			return false;
		},
		current_page: PageIndex,
		items_per_page: PageSize,
		link_to: link_to,
		next_text: "下一頁",
		prev_text: "上一頁",
		num_edge_entries: 1
	};
	var settings = $.extend(defaults, options);
	obj.pagination(ItemsCount, settings);
}
