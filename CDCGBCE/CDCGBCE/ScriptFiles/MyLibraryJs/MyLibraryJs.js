///#source 1 1 /_JS/MyLibraryJs.Root.js
var MyLibraryJs = MyLibraryJs || {};


(function (rootNs) {
    /// 建立命名空間
    rootNs.fnCreateNamespace = function () {
        /// <summary>
        /// 建立命名空間
        /// </summary>
        /// <returns type="Object">回傳建立的命名空間物件</returns>

        var a = arguments, o = null, i, j, d;
        for (i = 0; i < a.length; i = i + 1) {
            d = a[i].split(".");
            o = rootNs;
            for (j = (d[0] == "MyLibraryJs") ? 1 : 0; j < d.length; j = j + 1) {
                o[d[j]] = o[d[j]] || {};
                o = o[d[j]];
            }
        }
        return o;
    };
})(MyLibraryJs);
///#source 1 1 /_JS/MyLibraryJs.DateTimeExt.js
/// <reference path="MyLibraryJs.js" />


(function (rootNs) {

    var thisNs = rootNs.fnCreateNamespace("MyLibraryJs.DateTimeExt");


    /// 取得 時間區間的時數
    /// <para>（需要 moment.js）</para>
    //#region fnGetHours
    thisNs.fnGetHours = fnGetHours;
    function fnGetHours(sStartTime, sEndTime, bIsRound) {
        /// <signature>
        /// <summary>
        /// 取得 時間區間的時數
        /// <para>（需要 moment.js）</para>
        /// </summary>
        /// <param name="sStartTime">起始時間，ex：9:99</param>
        /// <param name="sEndTime">結束時間，ex：9:99</param>
        /// <param name="bIsRound">是否四捨五入</param>
        /// <returns type="float"></returns>
        /// </signature>
        /// <signature>
        /// <summary>
        /// 取得 時間區間的時數
        /// <para>（需要 moment.js）</para>
        /// <para>（預設不四捨五入）</para>
        /// </summary>
        /// <param name="sStartTime">起始時間，ex：9:99</param>
        /// <param name="sEndTime">結束時間，ex：9:99</param>
        /// <returns type="float"></returns>
        /// </signature>
        /// <remarks>
        /// 2013.01.10：Add
        /// </remarks>

        bIsRound = (bIsRound != undefined ? true : false);


        var iStartTimeH = 0;
        var iStartTimeM = 0;
        var iEndTimeH = 0;
        var iEndTimeM = 0;


        var pattern = /(\d+):(\d+)/g;   //ex：01:30、2:45、03:5
        var pattern2 = /(\d+):(\d+)/g;   //ex：01:30、2:45、03:5

        if (pattern.test(sStartTime)) {
            sStartTime.match(pattern);

            iStartTimeH = rootNs.StringExt.fnGetInt(RegExp.$1);
            iStartTimeM = rootNs.StringExt.fnGetInt(RegExp.$2);
        }

        if (pattern2.test(sEndTime)) {
            sEndTime.match(pattern2);

            iEndTimeH = rootNs.StringExt.fnGetInt(RegExp.$1);
            iEndTimeM = rootNs.StringExt.fnGetInt(RegExp.$2);
        }



        var mmtSTime = moment([0, 0, 0, iStartTimeH, iStartTimeM, 0]);
        var mmtETime = moment([0, 0, 0, iEndTimeH, iEndTimeM, 0]);

        //反向設定，因為 moment.js 的設法是反的
        return mmtETime.diff(mmtSTime, "hours", !bIsRound);
    }
    //#endregion


    /// 取得 目前日期時間的 Date 物件
    //#region fnGetNow
    thisNs.fnGetNow = function () {
    	/// <summary>
    	/// 取得 目前日期時間的 Date 物件
    	/// </summary>
        /// <returns type=""></returns>
        
        var now = new Date();

        return now;
    }
    //#endregion


    /// 取得 今天日期的 Date 物件
    //#region fnGetToday
    thisNs.fnGetToday = function () {
    	/// <summary>
    	/// 取得 今天日期的 Date 物件
    	/// </summary>
        /// <returns type=""></returns>
        
        var now = new Date();
        var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());

        return today;
    }
    //#endregion


})(MyLibraryJs);

///#source 1 1 /_JS/MyLibraryJs.EventExt.js
/// <reference path="MyLibraryJs.js" />


(function (rootNs) {

    var thisNs = rootNs.fnCreateNamespace("MyLibraryJs.EventExt");


    //回傳是否允許輸入數字（回傳 true、false）
    //僅允許 0 ~ 9、-、. 輸入
    thisNs.fnOnlyAllowNum = fnOnlyAllowNum;
    function fnOnlyAllowNum(event) {
        /// <summary>
        /// 回傳是否允許輸入數字（回傳 true、false）
        /// <para>僅允許 0 ~ 9、-、. 輸入</para>
        /// </summary>
        /// <remarks>允許 Backspace、Delete</remarks>

        //    alert(event.which);
        if (event.type == 'keypress') {
            if ((event.which >= 48 && event.which <= 57) || (event.which == 45) || (event.which == 46)) {
                return true;
            }
            else {
                event.which = 0;
                return false;
            }
        } else if (event.type == 'keypdown' || event.type == 'keyup') {
            if ((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105)   //允許 0~9
                 || (event.which == 109) || (event.which == 110)    //允許 -
                 || (event.which == 189) || (event.which == 190)    //允許 .
                 || (event.which == 8) || (event.which == 46)) {    //允許 Backspace、Delete
                return true;
            }
            else {
                event.which = 0;
                return false;
            }
        }
        //            if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45) || (event.keyCode == 46)) {
        //                return true;
        //            }
        //            else { event.keyCode = 0; false; }
    }


})(MyLibraryJs);

///#source 1 1 /_JS/MyLibraryJs.JqPluginExt.js
/// 需要引用 jQuery 檔案
/// <reference path="MyLibraryJs.js" />
/// <reference path="MyLibraryJs.StringExt.js" />


(function (rootNs) {

    var thisNs = rootNs.fnCreateNamespace("MyLibraryJs.JqPluginExt");


    /// 設定是否必填
    /// <para>（需要 jquery.validation）</para>
    thisNs.fnSetRequired = fnSetRequired;
    function fnSetRequired(pArySelectors, pIsRequired) {
        /// <summary>
        /// 設定是否必填
        /// <para>（需要 jquery.validation）</para>
        /// </summary>
        /// <param name="pArySelectors">要設必填的資料(selectors 字串陣列、jQuery 物件)</param>
        /// <param name="pIsRequired">是否必填</param>
        /// <remarks>
        /// <para>2013.07.08：Add：針對 MyKendoAutoComplete、MyKendoComboBox、MyKendoDatePicker、MyKendoMultiSelect 做特別處理</para>
        /// <para>2013.10.25：Add：針對 MyKendoTimePicker 做特別處理</para>
        /// </remarks>


        if (pIsRequired == undefined) pIsRequired = true;


        //2012.05.15：Add：參數可用 jQuery 物件
        var $jqObject = null;
        if (pArySelectors.jquery) {
            $jqObject = pArySelectors;
        } else if ($.inArray(pArySelectors)) {
            $jqObject = $$(pArySelectors.join(", "));
        }


        $jqObject.each(function () {
            var $this = $(this);

            if (pIsRequired) {
                //必填
                $this.rules("add", {
                    required: true
                });


                /* 加上底色和星號 */
                $this.addClass("require");


                var $obj = $this;

                //2013.07.08：Add：針對 MyKendoAutoComplete、MyKendoComboBox、MyKendoDatePicker、MyKendoMultiSelect 做特別處理
                //TM:DatePickerTextBox 特別處理
                if ($this.parent().hasClass("datepicker-wrap")) {
                    $obj = $this.parent();
                } else if ($this.is("[MyKendoAutoComplete]")) {
                    //kendoAutoComplete 特別處理
                    $this.data("kendoAutoComplete").element.addClass("require");
                    $obj = $this.data("kendoAutoComplete").wrapper;
                } else if ($this.is("[MyKendoComboBox]")) {
                    //kendoComboBox 特別處理
                    //$this.data("kendoComboBox").input.rules("add", {
                    //    required: true
                    //});
                    $this.data("kendoComboBox").input.addClass("require");
                    $obj = $this.data("kendoComboBox").wrapper;
                } else if ($this.is("[MyKendoDatePicker]")) {
                    //kendoDatePicker 特別處理
                    $this.data("kendoDatePicker").element.addClass("require");
                    $obj = $this.data("kendoDatePicker").wrapper;
                } else if ($this.is("[MyKendoMultiSelect]")) {
                    //kendoMultiSelect 特別處理
                    $this.data("kendoMultiSelect").wrapper.find(".k-multiselect-wrap").addClass("require");
                    $obj = $this.data("kendoMultiSelect").wrapper.find(".k-multiselect-wrap").children(":last-child");
                } else if ($this.is("[MyKendoTimePicker]")) {
                    //kendoTimePicker 特別處理
                    $this.data("kendoTimePicker").element.addClass("require");
                    $obj = $this.data("kendoTimePicker").wrapper;
                }

                //2012.02.06：Fix：不重複加星號
                if ($obj.nextAll(".error").length == 0) {
                    $("<span class='error' style='vertical-align:middle;'>*</span>").insertAfter($obj);
                }
            } else {
                //取消必填
                $this.rules("remove", "required");


                /* 取消加上底色和星號 */
                $this.removeClass("require");


                var $obj = $this;

                //2013.07.08：Add：針對 MyKendoAutoComplete、MyKendoComboBox、MyKendoDatePicker、MyKendoMultiSelect 做特別處理
                //TM:DatePickerTextBox 特別處理
                if ($this.parent().hasClass("datepicker-wrap")) {
                    $obj = $this.parent();
                } else if ($this.is("[MyKendoAutoComplete]")) {
                    //kendoAutoComplete 特別處理
                    $this.data("kendoAutoComplete").element.removeClass("require");
                    $obj = $this.data("kendoAutoComplete").wrapper;
                } else if ($this.is("[MyKendoComboBox]")) {
                    //kendoComboBox 特別處理
                    $this.data("kendoComboBox").input.removeClass("require");
                    $obj = $this.data("kendoComboBox").wrapper;
                } else if ($this.is("[MyKendoDatePicker]")) {
                    //kendoDatePicker 特別處理
                    $this.data("kendoDatePicker").element.removeClass("require");
                    $obj = $this.data("kendoDatePicker").wrapper;
                } else if ($this.is("[MyKendoMultiSelect]")) {
                    //kendoMultiSelect 特別處理
                    $this.data("kendoMultiSelect").wrapper.find(".k-multiselect-wrap").removeClass("require");
                    $obj = $this.data("kendoMultiSelect").wrapper.find(".k-multiselect-wrap").children(":last-child");
                } else if ($this.is("[MyKendoTimePicker]")) {
                    //kendoTimePicker 特別處理
                    $this.data("kendoTimePicker").element.removeClass("require");
                    $obj = $this.data("kendoTimePicker").wrapper;
                }

                $obj.nextAll(".error").remove();
                $('div.formError').remove();    //移掉 AspNetMvcInlineValidation 所產生的錯誤區塊
            }
        });
    }


    var fileDownloadCheckTimer;
    //下載開始，鎖定視窗
    /// <para>（需要 jquery.blockUI）</para>
    /// <para>（需要 jquery.cookie）</para>
    thisNs.fnBlockUIForDownload = fnBlockUIForDownload;
    function fnBlockUIForDownload($pSelector, pCookieName, pMessage) {
        /// <summary>
        /// 下載開始，鎖定視窗
        /// <para>（需要 jquery.blockUI）</para>
        /// <para>（需要 jquery.cookie）</para>
        /// </summary>
        /// <param name="$pSelector">hidden 欄位，存目前時間</param>
        /// <param name="pCookieName">Cookie 名稱</param>
        /// <param name="pMessage">顯示訊息</param>
        if (pMessage == undefined) pMessage = "檔案下載中...";

        var token = new Date().getTime();
        $pSelector.val(token);
        $.blockUI({ message: "<h1><b><img src='../Images/ajax-loader.gif' />" + pMessage + "</b></h1>" });

        fileDownloadCheckTimer = window.setInterval(function () {
            var cookieValue = $.cookie(pCookieName);
            if (cookieValue == token)
                fnFinishDownload(pCookieName);
        }, 500);
    }

    //下載完成，解除鎖定視窗
    /// <para>（需要 jquery.blockUI）</para>
    /// <para>（需要 jquery.cookie）</para>
    thisNs.fnFinishDownload = fnFinishDownload;
    function fnFinishDownload(pCookieName) {
        /// <summary>
        /// 下載完成，解除鎖定視窗
        /// <para>（需要 jquery.blockUI）</para>
        /// <para>（需要 jquery.cookie）</para>
        /// </summary>
        window.clearInterval(fileDownloadCheckTimer);
        $.cookie(pCookieName, null, { path: "/" });
        $.unblockUI();
    }


    //回傳 jQueryUI 的 Dialog 物件（內含一個 iFrame）
    /// <para>（需要 jquery.ui）</para>
    thisNs.fnDialogInit = fnDialogInit;
    function fnDialogInit(src, options) {
        /// <summary>
        /// 回傳 jQueryUI 的 Dialog 物件（內含一個 iFrame）
        /// <para>（需要 jquery.ui）</para>
        /// </summary>
        /// <param name="src">iFrame 的網址</param>
        /// <param name="options"></param>

        /* 初始值 */
        var defaults = {
            autoOpen: false,
            modal: true,
            title: null,
            width: 700,
            height: 400
        };
        var settings = $.extend(defaults, options);
        var $dialog = $("<div id='iFrameDialog'><div id='load' style='position: absolute; top: 40%; left: 50%'><img src='../Images/ajax-loader.gif' />&nbsp;loading...</div><iframe id='MyiFrame' frameborder='0' width='100%' height='100%'></iframe></div>");


        $dialog.dialog({
            autoOpen: settings.autoOpen,
            modal: settings.modal,
            title: settings.title,
            width: settings.width,
            height: settings.height,
            close: function (event, ui) {
                //2012.04.15：Fix：關閉後要移掉程式產生的 iframe（因為 Ajax 畫面部份更新，此物件還會遺留在畫面上，造成第二次開啟無法成功）
                //  在這裡執行，確保關閉時一定會移除
                $(this).remove();
            }
        });


        $dialog.find("#MyiFrame").load(function () {
            $dialog.find("#load").hide();
        }).attr("src", src);


        return $dialog;
    }

    //關閉 jQueryUI 的 Dialog 物件（內含一個 iFrame）
    /// <para>（需要 jquery.ui）</para>
    thisNs.fnDialogInit = fnDialogInit;
    function fnDialogClose() {
        /// <summary>
        /// 關閉 jQueryUI 的 Dialog 物件（內含一個 iFrame）
        /// <para>（需要 jquery.ui）</para>
        /// <para>（由子視窗來呼叫：parent.fnDialogClose();）</para>
        /// </summary>
        //2012.04.15：Fix：關閉後要移掉程式產生的 iframe（因為 Ajax 畫面部份更新，此物件還會遺留在畫面上，造成第二次開啟無法成功）
        //2012.04.15：Fix：改放到 close 事件中去移除，因為右上角的關閉按鈕並不會執行這段

        //todo：可以傳入要關閉的視窗
        $("#iFrameDialog").dialog("close");//.remove();
    }


    /// 初始化 Ajax 的 Tab（內含 iFrame）
    /// <para>（需要 jquerytools）</para>
    thisNs.fnTabs = fnTabs;
    function fnTabs(jqTabs, jqPanes, options) {
        /// <summary>
        /// 初始化 Ajax 的 Tab（內含 iFrame）
        /// <para>（需要 jquerytools）</para>
        /// </summary>
        /// <param name="jqTabs"></param>
        /// <param name="jqPanes"></param>
        /// <param name="options"></param>

        /* 初始值 */
        var defaults = {
            effect: "fade",
            history: true
        };
        var settings = $.extend(defaults, options);


        jqTabs.tabs(jqPanes, {
            effect: settings.effect,
            history: settings.history,
            onBeforeClick: function (event, index) {
                //iIndex：下一個要被點選的位置
                var jqTabs = this;
                var content = jqTabs.getPanes().eq(index).html();
                var FrameUrl = jqTabs.getTabs().eq(index).attr("href");
                var FrameID = 'Tabifm' + index;
                FrameUrl += (FrameUrl.indexOf("?") > -1 ? "&" : "?")
                    + "ifmid=Tabifm" + index;


                if (content.length == 0 && FrameUrl.length > 1) {
                    //2013.07.10：Add：先撐大版面大小
                    jqTabs.getPanes().eq(index).height($(window).height());


                    //jqTabs.getPanes().eq(index).html('<iframe id="' + FrameID + '" style="width:100%; height:100%;" scrolling="no" frameborder="0" src="' + FrameUrl + '"></iframe>');
                    jqTabs.getPanes().eq(index).html("<div id='load' style='display: block; border:0px; position: absolute; top: 40%; left: 40%'><img src='../Images/ajax-loader.gif' />&nbsp;loading...</div><iframe id='" + FrameID + "' width='100%' height='100%' scrolling='auto' frameborder='0' src='" + FrameUrl + "'></iframe>");


                    //2013.07.10：Fix：僅在沒資料的時候載入頁面，避免重複載入
                    //重新載入資料
                    //jqTabs.getPanes().eq(index).children("iframe")[0].contentWindow.location.reload();    //Firefox 會無法載入
                    jqTabs.getPanes().eq(index).children("iframe").load(function () {
                        //alert($(this).contents(window).height());
                        jqTabs.getPanes().eq(index).find("#load").hide();
                        jqTabs.getPanes().eq(index).height($(this).contents(document).height());
                    }).attr("src", FrameUrl);
                }


                //顯示要被點選的 pane
                jqTabs.getPanes().hide().eq(index).show();
            }
        });
    }


    //關閉視窗
    /// <para>（需要 jquery.ui 或 KendoUI）</para>
    thisNs.fnCloseWindow = fnCloseWindow;
    function fnCloseWindow(sjqWindow) {
        /// <summary>
        /// 關閉視窗
        /// <para>（需要 jquery.ui 或 KendoUI）</para>
        /// <para>（window.open()、showModalDialog()、iFrame 都可以關閉）</para>
        /// </summary>

        var window = this;

        if (window.opener != undefined) {
            //關閉 window.open()
            window.close();
        } else {
            if (window.dialogHeight != undefined) {
                //關閉 showModalDialog()
                window.close();
            } else {
                //關閉 iFrame（jQueryUI 的 Dialog）
                window.parent.fnDialogClose();

                //todo：可以傳入要關閉的視窗
                ////var jqWindow = (sjqWindow.jquery ? sjqWindow : $(sjqWindow));
                //var jqWindow
                //if ("kendo" in window.parent) {
                //    window.parent.fnKendoWindowClose(jqWindow);
                //}else{
                //    //window.parent.fnDialogClose(jqWindow);
                //    window.parent.fnDialogClose();
                //}
            }
        }
    }


    //初始化 dataTable 的預設值，並更改 GridView 的 Render 結構
    /// <para>（需要 DataTables）</para>
    thisNs.fnDataTableInit = fnDataTableInit;
    function fnDataTableInit($jq, options) {
        /// <summary>
        /// 初始化 dataTable 的預設值，並更改 GridView 的 Render 結構
        /// <para>（需要 DataTables）</para>
        /// </summary>
        /// <param name="$jq">GridView 的 jQuery 物件</param>
        /// <param name="options"></param>

        /* 初始值 */
        var defaults = {
            "bPaginate": false,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": false,
            "bInfo": false,
            "bAutoWidth": false,

            "oLanguage": {
                "sUrl": "../ScriptFiles/DataTables/language/zh_TW.txt"
            }
        };
        var settings = $.extend(defaults, options);


        /* 更改 GridView 預設的 Render 結構 */
        $jq.find("tr:first").wrap("<thead></thead>");
        //2012.12.28：Fix：參數傳錯，會造成所有 tbody 前面都被插入 thead
        //$jq.find("thead").insertBefore("tbody", $jq);
        $jq.find("thead").insertBefore($("tbody", $jq));


        $.extend($.fn.dataTable.defaults, settings);
    }


    //初始化 Pagination 的預設值
    /// <para>（需要 jquery.pagination）</para>
    thisNs.fnPaginationInit = fnPaginationInit;
    function fnPaginationInit($jq, options) {
        /// <summary>
        /// 初始化 Pagination 的預設值
        /// <para>（需要 jquery.pagination）</para>
        /// </summary>
        /// <param name="$jq">要放分頁的容器</param>
        /// <param name="options"></param>


        var PageIndex = rootNs.StringExt.fnGetInt($jq.attr("PageIndex"));
        var PageSize = rootNs.StringExt.fnGetInt($jq.attr("PageSize"));
        var TotlalItemsCount = rootNs.StringExt.fnGetInt($jq.attr("TotlalItemsCount"));


        /* 初始值 */
        var defaults = {
            callback: function (new_page_index, pagination_container) {

                return true;
            },
            current_page: PageIndex,
            items_per_page: PageSize,
            link_to: "javascript:__doPostBack('" + $jq[0].id + "','__id__')",
            //num_display_entries: 11,
            next_text: "下一頁",
            prev_text: "上一頁",
            //next_show_always: false,
            //prev_show_always: false,
            num_edge_entries: 1//,
            //ellipse_text: "---",
            //load_first_page: false
        };
        var settings = $.extend(defaults, options);


        $jq.pagination(TotlalItemsCount, settings);


        //依狀態啟用停用頁碼連結
        if ($jq.is("[disabled]")) {
            $jq.find("a").attr("disabled", "disabled")
                //.attr("href", "")
                .removeAttr("href")
                .css("cursor", "default")
                .click(function (e) {
                    e.stopPropagation();
                })
            ;
        }
    }


    /// 開啟 kendoWindow（內含一個 iFrame）
    /// <para>（需要 KendoUI）</para>
    //#region fnKendoWindowOpen
    thisNs.fnKendoWindowOpen = function (src, options) {
        /// <summary>
        /// 開啟 kendoWindow（內含一個 iFrame）
        /// <para>（需要 KendoUI）</para>
        /// </summary>
        /// <param name="src">iFrame 的網址</param>
        /// <param name="options"></param>
        /// <remarks>
        /// <para>2013.08.05：Add</para>
        /// </remarks>

        /* 初始值 */
        var defaults = {
            visible: false,
            modal: true,
            title: "",
            width: 700,
            height: 400,
            actions: ["Pin", "Minimize", "Maximize", "Close"],
            iframe: true,
            content: src
            ,
            close: function () {
                //2012.04.15：Fix：關閉後要移掉程式產生的 iframe（因為 Ajax 畫面部份更新，此物件還會遺留在畫面上，造成第二次開啟無法成功）
                //  在這裡執行，確保關閉時一定會移除
                //$(this).wrapper.remove();
                //2013.10.04：Fix：this 為 Kendo 物件，不用再用 $ 包起來
                this.wrapper.remove();
            }
        };
        var settings = $.extend(defaults, options);
        //var $dialog = $("<div id='iFrameDialog'><div id='load' style='position: absolute; top: 40%; left: 50%'><img src='../Images/ajax-loader.gif' />&nbsp;loading...</div></div>");
        var $dialog = $("<div id='iFrameDialog'></div>");
        var $load = $("<div id='load' style='position: absolute; top: 40%; left: 50%;'><img src='../Images/ajax-loader.gif' />&nbsp;loading...</div>");


        $dialog.kendoWindow(settings).data("kendoWindow")
            .open().center()
            .wrapper.find(".k-window-content").append($load);


        $dialog.find(".k-content-frame").load(function () {
            $dialog.find("#load").hide();
        });


        //return $dialog;
    }
    //#endregion


    /// 關閉 kendoWindow（內含一個 iFrame）
    /// <para>（需要 KendoUI）</para>
    /// <para>（由子視窗來呼叫：parent.MyLibraryJs.JqPluginExt.fnKendoWindowClose();）</para>
    //#region fnKendoWindowClose
    thisNs.fnKendoWindowClose = function (sjqWindow) {
        /// <summary>
        /// 關閉 kendoWindow（內含一個 iFrame）
        /// <para>（需要 KendoUI）</para>
        /// <para>（由子視窗來呼叫：parent.MyLibraryJs.JqPluginExt.fnKendoWindowClose();）</para>
        /// </summary>
        /// <param name="sjqWindow"></param>
        /// <remarks>
        /// <para>2013.08.05：Add</para>
        /// </remarks>

        //todo：可以傳入要關閉的視窗
        //var jqWindow = (sjqWindow.jquery ? sjqWindow : $(sjqWindow));
        var jqWindow = $("#iFrameDialog");
        jqWindow.data("kendoWindow").close();
    }
    //#endregion

})(MyLibraryJs);
///#source 1 1 /_JS/MyLibraryJs.MathExt.js
/// <reference path="MyLibraryJs.js" />


(function (rootNs) {

    var thisNs = rootNs.fnCreateNamespace("MyLibraryJs.MathExt");


    //#region 浮點數的四則運算
    //mrkt 的程式學習筆記: JavaScript - 浮點數運算	-	http://kevintsengtw.blogspot.tw/2011/09/javascript.html


    //浮點數相加
    thisNs.fnFloatAdd = function (arg1, arg2) {
        var r1, r2, m;
        try { r1 = arg1.toString().split(".")[1].length; } catch (e) { r1 = 0; }
        try { r2 = arg2.toString().split(".")[1].length; } catch (e) { r2 = 0; }
        m = Math.pow(10, Math.max(r1, r2));
        return (thisNs.fnFloatMul(arg1, m) + thisNs.fnFloatMul(arg2, m)) / m;
    };


    //浮點數相減
    thisNs.fnFloatSubtraction = function (arg1, arg2) {
        var r1, r2, m, n;
        try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
        try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
        m = Math.pow(10, Math.max(r1, r2));
        n = (r1 >= r2) ? r1 : r2;
        return ((arg1 * m - arg2 * m) / m).toFixed(n);
    };


    //浮點數相乘
    thisNs.fnFloatMul = function (arg1, arg2) {
        var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
        try { m += s1.split(".")[1].length; } catch (e) { }
        try { m += s2.split(".")[1].length; } catch (e) { }
        return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
    };


    //浮點數相除
    thisNs.fnFloatDiv = function (arg1, arg2) {
        var t1 = 0, t2 = 0, r1, r2;
        try { t1 = arg1.toString().split(".")[1].length } catch (e) { }
        try { t2 = arg2.toString().split(".")[1].length } catch (e) { }
        with (Math) {
            r1 = Number(arg1.toString().replace(".", ""))
            r2 = Number(arg2.toString().replace(".", ""))
            return (r1 / r2) * pow(10, t2 - t1);
        }
    };
    //#endregion


})(MyLibraryJs);

///#source 1 1 /_JS/MyLibraryJs.StringExt.js
/// <reference path="MyLibraryJs.js" />


(function (rootNs) {

    var thisNs = rootNs.fnCreateNamespace("MyLibraryJs.StringExt");


    //數字三位一撇
    thisNs.fnAddCommas = fnAddCommas;
    function fnAddCommas(pMoney) {
        /// <summary>
        /// 數字三位一撇
        /// <para>（自動處理：輸入 .4 → 0.4）</para>
        /// </summary>
        /// <param name="pMoney">金額</param>
        /// <remarks>
        /// 2013.03.07：Fix：負數會有問題，改成用正規表示式來處理
        /// </remarks>

        var sMoney = pMoney.toString().replace(/,/g, "");
        if (sMoney == "") return "";

        //var token = sMoney.split('.');
        //var token1 = token[0];      //整數部份
        //var token2 = token.length > 1 ? '.' + token[1] : '';    //小數部份

        //2013.03.07：Fix：負數會有問題，改成用正規表示式來處理
        var outValue = "";

        var pattern = /([+-]?)(\d*).?(\d*)/;   //ex：123.45、-12、+0.1234、.45
        if (pattern.test(sMoney)) {
            sMoney.match(pattern);

            var token0 = RegExp.$1;             //正負號
            var token1 = (RegExp.$2 != "" ? RegExp.$2 : "0");             //整數部份
            var token2 = (RegExp.$3 != "" ? "." + RegExp.$3 : "");        //小數部份


            var mod = token1.length % 3;
            var quo = token1.length / 3;


            //從後往前三碼三碼拆
            for (var i = 0; i < Math.floor(quo) ; i++) {
                if (i == 0) {
                    outValue = token1.slice(-3 * (i + 1));
                } else {
                    outValue = token1.slice(-3 * (i + 1), -3 * i) + "," + outValue;
                }
            }


            //串上不滿三碼的部份
            if (mod != 0) {
                if (token1.length < 3) {
                    outValue = token1;
                } else {
                    outValue = token1.slice(-1 * token1.length, -3 * i) + "," + outValue;
                }
            }


            //串上小數點的部份
            outValue = token0 + outValue + token2;
        }


        return outValue;
    }


    /// 將字串值重複指定的次數
    thisNs.fnReplicate = fnReplicate;
    function fnReplicate(sString, iCount) {
        /// <summary>
        /// 將字串值重複指定的次數
        /// </summary>
        /// <param name="sString">要重複的字串</param>
        /// <param name="iCount">重複的次數</param>
        /// <returns type="string"></returns>
        /// <remarks>
        /// 2012.12.14：MyLibrary.StringExt.Replicate() 「完全」移植過來
        /// </remarks>

        var sReturn = "";

        iCount = iCount >= 0 ? iCount : 0;


        for (var i = 0; i < iCount; i++) {
            sReturn += sString;
        }


        return sReturn;
    }


    /// 輸出固定長度的字串
    thisNs.fnFixLength = fnFixLength;
    function fnFixLength(sString, iLength, bIsPadLeft, cPaddingChar) {
        /// <summary>
        /// 輸出固定長度的字串
        /// <para>（長度不足的預設會以 ' ' 填補在右邊）</para>
        /// </summary>
        /// <param name="sString"></param>
        /// <param name="iLength">輸出的固定長度</param>
        /// <param name="bIsPadLeft">不足的是否填補在左邊</param>
        /// <param name="cPaddingChar">填補的字元</param>
        /// <returns type="string"></returns>
        /// <remarks>
        /// 2012.12.14：MyLibrary.StringExt.FixLengthBase() 「半」移植過來
        /// </remarks>

        bIsPadLeft = (bIsPadLeft == undefined ? false : bIsPadLeft);
        cPaddingChar = (cPaddingChar == undefined ? " " : cPaddingChar);

        var sReturn = "";
        var iStringLength = sString.length;

        /* 字串長度不足的填補，超過的擷取 */
        if (iStringLength <= iLength) {
            var iPaddingLength = iLength - iStringLength;

            if (bIsPadLeft) {
                sReturn = fnReplicate(cPaddingChar, iPaddingLength) + sString;
            }
            else {
                sReturn = sString + fnReplicate(cPaddingChar, iPaddingLength);
            }
        }
        else {
            //if( pIsCountByBytes )
            //{
            //    sReturn = System.Text.Encoding.GetEncoding("big5").GetString(bsString, 0, pLength);
            //}
            //else
            //{
            sReturn = sString.substr(0, iLength);
            //}
        }


        return sReturn;
    }


    /// 取得西元年的字串
    thisNs.fnGetDate = fnGetDate;
    function fnGetDate(sDate, sSeparator) {
        /// <summary>
        /// 取得西元年的字串
        /// </summary>
        /// <param name="sDate">民國年、西元年</param>
        /// <param name="sSeparator">分隔符號</param>
        /// <returns type="string">西元年</returns>
        /// <remarks>
        /// 2012.12.14：Add
        /// </remarks>

        var sReturn = "";
        sSeparator = (sSeparator == undefined ? "/" : sSeparator);
        var pattern = /(\d{1,4})[.-\/](\d{1,2})[.-\/](\d{1,2})/g;   //ex：101/1/1、2011.12.16、102-10-10

        if (pattern.test(sDate)) {
            sDate.match(pattern);

            //Year 3 碼以下的當作是民國年
            if (RegExp.$1.length < 4) {
                sReturn = fnFixLength((parseInt(RegExp.$1, 10) + 1911).toString(), 4, true, "0") + sSeparator
                    + fnFixLength(RegExp.$2, 2, true, "0") + sSeparator
                    + fnFixLength(RegExp.$3, 2, true, "0");
            } else {
                sReturn = fnFixLength(RegExp.$1, 4, true, "0") + sSeparator
                    + fnFixLength(RegExp.$2, 2, true, "0") + sSeparator
                    + fnFixLength(RegExp.$3, 2, true, "0");
            }
        }


        return sReturn;
    }


    /// 以新值取代舊值，若出現多次可持續取代（使用正規表示式）
    thisNs.fnReplaceAll = fnReplaceAll;
    function fnReplaceAll(sSource, sOldValue, sNewValueb, bIsIgnoreCase) {
        /// <summary>
        /// 以新值取代舊值，若出現多次可持續取代（使用正規表示式）
        /// <para>（改善原 Replace() 只會取代一次就停止取代）</para>
        /// </summary>
        /// <param name="sSource"></param>
        /// <param name="sOldValue">舊值</param>
        /// <param name="sNewValueb">新值</param>
        /// <param name="bIsIgnoreCase">是否忽略大小寫</param>
        /// <returns type="string"></returns>
        /// <remarks>
        /// 2013.01.01：MyLibrary.StringExt.ReplaceAll() 「完全」移植過來
        /// 2013.01.07：sSource、sOldValue、sNewValueb 給定預設值
        /// </remarks>

        sSource = (sSource == undefined ? "" : sSource.toString());
        sOldValue = (sOldValue == undefined ? "" : sOldValue.toString());
        sNewValueb = (sNewValueb == undefined ? "" : sNewValueb.toString());
        bIsIgnoreCase = (bIsIgnoreCase == undefined ? false : true);


        var sReturn = "";
        var oRegex = new RegExp(sOldValue, "g" + (bIsIgnoreCase ? "i" : ""));

        sReturn = sSource.replace(oRegex, sNewValueb);

        return sReturn;
    }


    /// 取得浮點數；字串轉換成浮點數
    thisNs.fnGetFloat = fnGetFloat;
    function fnGetFloat(sString, iDigits) {
        /// <signature>
        /// <summary>
        /// 取得浮點數；字串轉換成浮點數
        /// </summary>
        /// <param name="sString"></param>
        /// <param name="iDigits">小數點位數，四捨五入到此位數</param>
        /// <returns type="float"></returns>
        /// </signature>
        /// <signature>
        /// <summary>
        /// 取得浮點數；字串轉換成浮點數
        /// <para>（預設不四捨五入）</para>
        /// </summary>
        /// <param name="sString"></param>
        /// <returns type="float"></returns>
        /// </signature>
        /// <remarks>
        /// 2013.01.01：Add，雷同 MyLibrary.StringExt.GetDecimal()
        /// 2013.01.09：Edit：給 sString 預設值
        /// </remarks>

        //2013.01.09：Edit：給 sString 預設值
        sString = (sString == undefined || sString == "" ? "0" : sString);

        var fTemp = parseFloat(fnReplaceAll(sString, ",", ""));

        if (iDigits != undefined) {
            fTemp = Math.round(fTemp * Math.pow(10, iDigits)) / Math.pow(10, iDigits);
        }


        return fTemp;
    }


    /// 取得整數；字串轉換成整數
    thisNs.fnGetInt = fnGetInt;
    function fnGetInt(sString, bIsRound) {
        /// <signature>
        /// <summary>
        /// 取得整數；字串轉換成整數
        /// </summary>
        /// <param name="sString"></param>
        /// <param name="bIsRound">是否四捨五入到整數位</param>
        /// <returns type="int"></returns>
        /// </signature>
        /// <signature>
        /// <summary>
        /// 取得整數；字串轉換成整數
        /// <para>（預設不四捨五入）</para>
        /// </summary>
        /// <param name="sString"></param>
        /// <returns type="int"></returns>
        /// </signature>
        /// <remarks>
        /// 2013.01.10：Add，雷同 MyLibrary.StringExt.GetInt()
        /// </remarks>

        bIsRound = (bIsRound != undefined ? true : false);


        if (bIsRound) {
            return parseInt(fnGetFloat(sString, 0), 10);
        }
        else {
            var sValue = fnGetFloat(sString).toString();
            var iDotIndex = sValue.indexOf(".");
            sValue = (iDotIndex > -1 ? sValue.substr(0, iDotIndex) : sValue);

            return parseInt(sValue, 10);
        }
    }


})(MyLibraryJs);

///#source 1 1 /_JS/MyLibraryJs.WindowExt.js
/// <reference path="MyLibraryJs.js" />


(function (rootNs) {

    var thisNs = rootNs.fnCreateNamespace("MyLibraryJs.WindowExt");


    //開啟 showModalDialog 視窗
    thisNs.fnShowModalDialog = fnShowModalDialog;
    function fnShowModalDialog(sUrl, vArguments, sFeatures) {
        /// <summary>
        /// 開啟 showModalDialog 視窗
        /// </summary>

        //    /* 初始值 */
        //    var defaults = {
        //        dialogWidth: 640,
        //        dialogHeight: 480,
        //        dialogTop: 0,
        //        dialogLeft: 0
        //    };
        //    var settings = $.extend(defaults, options);

        try {
            vArguments = (vArguments == undefined ? { srcWindow: self } : vArguments);
            sFeatures = (sFeatures == undefined
                ? "dialogWidth:640px; dialogHeight:480px; dialogTop: px; dialogLeft: px; edge: Raised; center: Yes; help: No; resizable: Yes; status: Yes;"
                : sFeatures);

            if (sUrl == undefined || sUrl == "") {
                //throw new "sUrl 參數未指定！";
                throw new Error("sUrl 參數未指定！");
            }

            return vReturnValue = showModalDialog(sUrl, vArguments, sFeatures);
        } catch (e) {
            //alert(e);
            alert(e.name + "：" + e.message);
        }
    }


    /// 帶回資料，並打開的關閉視窗
    /// <para>（需要 json2.js）</para>
    //#region fnReturnValue
    thisNs.fnReturnValue = function (rValue) {
        /// <summary>
        /// 帶回資料，並打開的關閉視窗
        /// <para>（需要 json2.js）</para>
        /// </summary>
        /// <param name="rValue">陣列</param>
        /// <returns type=""></returns>
        /// <remarks>
        /// 2012.11.16：Add：增加 srcDomByJson，回傳 Json 格式的資料
        /// 2012.12.24：Add：jQuery 物件可以用 $$ 來 parse
        /// 2013.04.02：Add：父視窗設值，可以使用 $ 的方式，也可以使用 $$ 的方式
        ///   使用 $$ 的方式時，要引用 base.js
        /// </remarks>

        var vDialogArguments = window.dialogArguments;
        var srcDom = decodeURIComponent($.jqURL.get("srcDom"));     //todo:srcDom 可能會有多個，會有問題
        //2012.11.16：Add：增加 srcDomByJson，回傳 Json 格式的資料
        var srcDomByJson = decodeURIComponent($.jqURL.get("srcDomByJson"));     //todo:srcDom 可能會有多個，會有問題
        var sValue = "";
        //var rValue = new Array();


        sValue = rValue.join(", ");


        ////2012.07.23：Add：沒有資料時，不允許關閉視窗
        //if (rValue.length == 0) {
        //    alert("沒有資料可以帶回！");
        //    return false;
        //}


        /* showModalDialog */
        if (vDialogArguments != undefined) {
            //若有給來源欄位，將值設給來源欄位
            if (!$.isEmptyObject(vDialogArguments)) {
                if (vDialogArguments.srcWindow != undefined && $.isWindow(vDialogArguments.srcWindow)) {
                    //  && vDialogArguments.srcDom != undefined && vDialogArguments.srcDom != "") {
                    //若 querystring 和 dialogArguments 都有值，以 querystring 為主
                    if (vDialogArguments.srcDom != undefined && vDialogArguments.srcDom != "") {
                        srcDom = vDialogArguments.srcDom;
                    }


                    //2012.11.16：Add：增加 srcDomByJson，回傳 Json 格式的資料
                    //若 querystring 和 dialogArguments 都有值，以 querystring 為主
                    if (vDialogArguments.srcDomByJson != undefined && vDialogArguments.srcDomByJson != "") {
                        srcDomByJson = vDialogArguments.srcDomByJson;
                    }


                    //2013.04.02：Add：父視窗設值，可以使用 $ 的方式，也可以使用 $$ 的方式
                    //  使用 $$ 的方式時，要引用 base.js
                    var AssignMethod = (typeof (vDialogArguments.srcWindow.$$) != "undefined" ? "$$" : "$");

                    vDialogArguments.srcWindow[AssignMethod](srcDom).val(
                        vDialogArguments.srcWindow[AssignMethod](srcDom).val()
                        + sValue
                    );

                    vDialogArguments.srcWindow[AssignMethod](srcDomByJson).val(
                        JSON.stringify(rValue)
                    );
                }
            }

            returnValue = rValue;
            window.close();
        } else if (opener != undefined) {
            /* window.open */
            //2013.04.02：Add：父視窗設值，可以使用 $ 的方式，也可以使用 $$ 的方式
            //  使用 $$ 的方式時，要引用 base.js
            var AssignMethod = (typeof (opener.$$) != "undefined" ? "$$" : "$");

            if (srcDom != undefined && srcDom != "") {
                opener[AssignMethod](srcDom).val(
                        opener[AssignMethod](srcDom).val() + sValue
                    );
            }

            //2012.11.16：Add：增加 srcDomByJson，回傳 Json 格式的資料
            if (srcDomByJson != undefined && srcDomByJson != "") {
                opener[AssignMethod](srcDomByJson).val(
                        JSON.stringify(rValue)
                    );
            }

            window.close();
        } else if (parent != undefined) {
            /* jQueryUI 的 Dialog 物件（內含一個 iFrame） */
            //2012.08.15：Add：增加可以處理 jQueryUI 的 Dialog 物件（內含一個 iFrame）
            //2013.04.02：Add：父視窗設值，可以使用 $ 的方式，也可以使用 $$ 的方式
            //  使用 $$ 的方式時，要引用 base.js
            var AssignMethod = (typeof (parent.$$) != "undefined" ? "$$" : "$");

            if (srcDom != undefined && srcDom != "") {
                parent[AssignMethod](srcDom).val(
                        parent[AssignMethod](srcDom).val() + sValue
                    );
            }

            //2012.11.16：Add：增加 srcDomByJson，回傳 Json 格式的資料
            if (srcDomByJson != undefined && srcDomByJson != "") {
                parent[AssignMethod](srcDomByJson).val(
                        JSON.stringify(rValue)
                    );
            }
            parent.fnDialogClose();
        }

        return false;
    }
    //#endregion
    
})(MyLibraryJs);

