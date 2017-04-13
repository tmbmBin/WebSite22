var ##ID##_PK;
var ##ID##_remove_clicked_callback;
$(function () {
    ##ID##_PK=$("#"+"##ID##_PK").val();
	##ID##_loadUploaded();
	##ID##_loadUploadify();
    $("###ID## .attach").bind("click",function(){
        ##ID##_loadUploaded();
    });
	$("###ID## .trash .title a.clear").bind("click",function(){
		##ID##_trashClear_click();return false;
	});
});
function ##ID##_loadUploadify() {
$('###ID##_FileData').uploadify({
	'uploader': '##ROOT##/uploadify.swf','script': '##ROOT##/upload.ashx','scriptData':{PK:##ID##_PK},
	'cancelImg': '##ROOT##/cancel.png',
	'buttonText': '',
	'buttonImg': '##ROOT##/button.png',
	'hideButton':false,
	'width': 64,
	'height': 14,
	'fileDataName': '##ID##_FileData',		
	'folder': '/temp',
	'multi': true,'auto': true,'wmode':'transparent',
	'fileExt': '##FILTER##',
	'fileDesc': '##FILTER_DESC##',
	'sizeLimit': ##FILE_LENGTH_LIMIT##,
	'queueID': '##ID##_queuelist',
	'queueSizeLimit': ##MAX_QUEUE_LIMIT##,
	'simUploadLimit': ##MAX_UPLOAD_LIMIT##,
	'removeCompleted': true,
	'onQueueFull':function(event,queueSizeLimit){return false;},
	'onError':function(event,ID,fileObj,errorObj){
		var err;
		if(errorObj.type=="File Size"){
			err="檔案大小超過限制的長度 "+ getFileSizeStr(errorObj.info)+"。";
		}else{
			err=errorObj.type + " 錯誤:" + errorObj.info;
		}
		alert(fileObj.name + " "+err+ " ");
	},
	'onAllComplete': function (event, data) {##ID##_loadUploaded();}
});
}
function ##ID##_loadUploaded() {
    var fums=$("###ID##");
	var uploaded = $("###ID##_uploaded");
    var trash=$("###ID##_Trash");
	var enaobj="##ID##_Enable";
	var ena=$("#"+enaobj).val();//啟用刪除功能
	var dl=$("#"+enaobj).attr("dl");//啟用下載連結
	var p = { mode: "listUploaded", PK: ##ID##_PK };
	$.ajax({type: "POST", url: "##ROOT##/manage.ashx", dataType: "json", data: p,
		success: function (data) {
			var d = data;
			//if (d != "0") {
			uploaded.empty();
			trash.find(".uploadedItem").remove();
			for (var i = 0; i < d.length; i++) {
				var fileName = d[i].name;
				var len = d[i].len;
				var id = d[i].id;
				var s = d[i].s;//R,T,trash
				var bs= getFileSizeStr(len);
				var uploadedItem = $("<div>").addClass("uploadedItem");
				//var c= ena=="1"? "<div class='cancel'><a id='" + id + "' s='" + s + "' href=''><img src='##ROOT##/cancel.png' border='0'></a></div>":"";
				var c= ena=="1"? "<div class='cancel'><a id='" + id + "' s='" + s + "' href=''><img src='##ROOT##/"+ (s=="trash"?"trash01.gif":"trash02.png").toString()+ "' border='0' title='"+(s=="trash"?"立即刪除":"移至資源回收桶")+"'></a></div>":"";
				var cancel = $(c+"<span class='fileName'>"
					+(dl=="1"? "<a href='##ROOT##/file/?v=" + id.substring(0, 12) + "&s=" + s + "&k=" + id.substring(12) + "' class='"+s+ "' target='_blank'>":"")
					+ decodeURIComponent(decodeURIComponent(fileName)) + ' (' + bs + ")"+(dl=="1"?"</a>":"")
					+(s=="trash"?"&nbsp;<a id='"+id+"' href='' class='restore'>(復原)</a>":"")
					+"</span><span class='percentage'></span>").appendTo(uploadedItem);
				if(s=="trash"){
					uploadedItem.appendTo(trash);
				}else{
					uploadedItem.appendTo(uploaded);
				}
			}
			//}
			//bind link
			$(uploaded).find(".uploadedItem .cancel a").bind("click",function(){return ##ID##_remove_click($(this));});
            $(trash).find(".uploadedItem .cancel a").bind("click", function(){return ##ID##_remove_click($(this));});
			$(trash).find(".uploadedItem a.restore").bind("click", function(){return ##ID##_restore_click($(this));});
		},
		error: function (xhr, ajaxOptions, thrownError) {alert(xhr.status + ":::" + xhr.responseText + ":::"+thrownError);}
	});
}
function ##ID##_remove_click(e,callback){
    var withfn=##ENABLE_WITHFILENAME_ONREMOVE##;
    var recycle=##ENABLE_TRASH_RECYCLE##;
    var ##ID##_removeConfirmText = "##REMOVE_CONFIRM_TEXT##";
    var ##ID##_enableBeforeRemove = ##ENABLE_REMOVE_CONFIRM##;
    var status=$(e).attr("s");
    var fnamecfm=$(e).parent().siblings("span").find("a:eq(0)").text()+"\n\n";
    if(status=="trash"){
        if(!confirm(fnamecfm+"警告:此動作會將檔案徹底刪除且無法復原，是否確定刪除?")){return false;}
    }else{
	    if (##ID##_enableBeforeRemove) {if (!confirm((withfn?fnamecfm:"") +##ID##_removeConfirmText)) {return false;}}
    }
    var a = $(e);
    var pp = { mode: "del" };
    pp.s = status;
    pp.name = $(a).attr("id");
    pp.PK = ##ID##_PK;
    pp.recycle=recycle?"1":"";
    $.ajax({
	    type: "POST", async: false, url: "##ROOT##/manage.ashx", data: pp,
	    success: function (data) {
//		    $(a).parent(".cancel").parent(".uploadedItem").remove();
            ##ID##_loadUploaded();
			if(##ID##_remove_clicked_callback) ##ID##_remove_clicked_callback.call();
	    },
	    error: function () {
		    alert("刪除檔案發生錯誤...");
	    }
    });
    return false;
}
function ##ID##_restore_click(e){
	var a = $(e);
    var pp = { mode: "restore" };
    pp.name = $(a).attr("id");
    pp.PK = ##ID##_PK;
    $.ajax({
	    type: "POST", async: false, url: "##ROOT##/manage.ashx", data: pp,
	    success: function (data) {
            ##ID##_loadUploaded();
	    },
	    error: function () {
		    alert("檔案復原發生錯誤...");
	    }
    });
    return false;
}
function ##ID##_trashClear_click(){
	var len=$("###ID## .trash .uploadedItem").length;
	if(len==0){return;}
	if(confirm("清空全部檔案?\n\n"+"警告:此動作會將檔案徹底刪除且無法復原，是否確定刪除?")){
		var p={mode:'clear',PK:##ID##_PK};
		$.ajax({
			type: "POST", async: true, url: "##ROOT##/manage.ashx", dataType: "json", data: p,
			success: function (d) {
				##ID##_loadUploaded();
			},
			error:function(d){alert("清空資源回收桶時發生錯誤。");}
		});
	}
}