/*
 *  作者：FrankWu
 *  建立日期：2013.06.17
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.1.319）
 *      4. 若要套用在 Server Control，請用 DropDownList，以確保 PostBack 之後值不會消失


    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1-fix.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>

    <%-- ↓↓KendoUI 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />
    <%-- ↑↑KendoUI 所需檔案↑↑ --%>


 *  描述：
 *      1. 自動套用 kendoComboBox，並初始化成專案的需求
 *          a. 可過濾資料（僅可過濾 text）
 *          b. 支援直接載入 WebService 的資料
 *          c. 支援資料群組化（<optgroup>）
 *          d. 支援寬度可在點選時動態縮放
 *
 *  使用方式：
 *      1. 全部套用：$.MyKendoComboBox([options]);
 *          a. 自動找尋 [MyKendoComboBox='MyKendoComboBox'] 的 select、input 標籤套用 kendoComboBox
 *      2. 個別套用：$(Selectors).MyKendoComboBox([options]);
 *      3. options
 *          a. 參考 http://docs.kendoui.com/api/web/combobox
 *      4. options 中另外提供一個自訂參數（非官方參數） url
 *          a. 可載入 WebService 的資料
 *          b. Server 實作請用 KendoDataSource.dll，回傳
 *              public KendoDataSource.DataSourceResult MethodName( IEnumerable<KendoDataSource.Sort> sort, KendoDataSource.Filter filter ){ ... };
 *      5. options 中另外提供一個自訂參數（非官方參數） groupChar
 *          a. 模擬 <optgroup> 群組的效果，不可被選取
 *          b. 準備工作：自行在 value 資料中，將要被識別為群組的資料，其 value 右邊串上 groupChar（預設為「*」）
 *          c. 預設：*
 *          d. 預設此功能啟用，給 null 或 "" 可以關閉此功能
 *      6. options 中另外提供一個自訂參數（非官方參數） autoWidth
 *          a. 預設值：false
 *          b. 是否在點選的時候，依照內容的寬度，暫時拉大寬度（讓內容盡量不斷行）
 *
 *  已知問題：
 *      #1. //x 不支援 optgroup
 *          2013.08.20：Add：增加自訂參數 groupChar，可模擬 <optgroup> 群組的效果，不可被選取
 *      #2. <select> 中，自行加入 <option value=""></option> 且又設定 placeholder
 *          ，清掉欄位值時會顯示 placeholder，而不會顯示 value="" 的選項
 *          ，也就是 .blur() 中的修正在此類會無作用
 *
 *  修改歷程：
 *      2013.06.17：Init
 *      2013.06.19：Add：增加自訂參數 url，可載入 WebService 的資料
 *      2013.06.26：Fix：拿掉 blur()，因為若兩個下拉連動，造成第二個下拉有空值時，畫面會一直亂跳，kendoComboBox 無法套上去
 *      2013.07.08：Fix：修正 kendoComboBox 在 blur 時會自動替空的 select 標籤加入一個空的 option 標籤
 *          造成 .NET 錯誤：「無效的回傳或回呼引數。已在組態中使用 <pages enableEventValidation="true"/> 或在網頁中使用 <%@ Page EnableEventValidation="true" %> 啟用事件驗證。基於安全性理由，這項功能驗證回傳或回呼引數是來自原本呈現它們的伺服器控制項。如果資料為有效並且是必需的，請使用 ClientScriptManager.RegisterForEventValidation 方法註冊回傳或回呼資料，以進行驗證。」
 *      2013.07.30：Add：當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
 *      2013.08.15：Add：自動調整資料的可見寬度
 *      2013.08.20：Add：增加自訂參數 groupChar，可模擬 <optgroup> 群組的效果，不可被選取
 *      2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
 *      2013.10.31：Add：增加自訂參數 autoWidth，是否在點選的時候，依照內容的寬度，暫時拉大寬度（讓內容盡量不斷行）
 *      2014.04.23：Fix：v2014.1.416 時，原 2013.07.08 的問題，在 kendoComboBox 初始化時也會產生空的 option 標籤
 *          原本放在 blur 時做清除的動作，改到 dataBound 處理
 *
*/
(function ($) {
    
    //全域設定
    $.MyKendoComboBox = function (options) {
        /// <summary>
        /// 設定 MyKendoComboBox
        /// <para>（標籤含 [MyKendoComboBox='MyKendoComboBox'] 的 select、input）</para>
        /// </summary>

        fnSetKendoComboBox($("[MyKendoComboBox='MyKendoComboBox']"), options);
    }

    //個別設定
    $.fn.MyKendoComboBox = function (options) {
        /// <summary>
        /// 設定 MyKendoComboBox
        /// </summary>

        fnSetKendoComboBox(this, options);

        return this;
    }


    function fnSetKendoComboBox(jqSelect, options) {
        
        jqSelect.filter("select, input").each(function () {

            var $this = $(this);
            options = options || {};
            //var groupChar = options.groupChar || "*";   //會被當作是群組的符號
            var groupChar = (options.groupChar === null || options.groupChar == ""
                                ? "" : options.groupChar || "*");   //會被當作是群組的符號
            var autoWidth = options.autoWidth || false;


            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoComboBox") || {})) {

            }
            else {
                return;
            }


            var defaults = {
                filter: "contains",
                minLength: 0,
                ignoreCase: true,
                delay: 200,
                height: 200,
                //! 對於 select 標籤，無法使用 placeholder
                //! 一開使載入時，會顯示第一個下拉，不會顯示 placeholder
                //! 等到清空值之後，才會顯示 placeholder
                //預設不使用 placeholder，以避免 <select> 使用所產生的問題（#2）
                //placeholder: "請選擇...",
                highlightFirst: true,
                //suggest: true,
                //index: -1,
                //value: null,
                template: "# var len = data.value.length - " + groupChar.length + "; #"
                        + "# if( " + groupChar.length + " > 0 && data.value.substr(len, " + groupChar.length + ")=='" + groupChar + "' ) { #"
                        + " <span class='NotSelect'> ${data.text} </span> "
                        + "# } else { #"
                        + " ${data.text} "
                        + "# } #"
                ,
                dataBound: function () {
                    //2013.08.20：Add：被當作群組的 options 不能被選取
                    var groupOption = this.ul.find("li").filter(":has(.NotSelect)");

                    if (groupOption.length > 0) {
                        groupOption.each(function () {
                            $(this).css("font-weight", "bold")
                                .click(function () {
                                    return false;
                                });
                        });
                    }


                    //2014.04.23：Fix
                    //修正 kendoComboBox v2014.1.416 在初始化後會自動替空的 select 標籤加入一個空的 option 標籤
                    //    造成 .NET 錯誤：「無效的回傳或回呼引數。已在組態中使用 <pages enableEventValidation="true"/> 或在網頁中使用 <%@ Page EnableEventValidation="true" %> 啟用事件驗證。基於安全性理由，這項功能驗證回傳或回呼引數是來自原本呈現它們的伺服器控制項。如果資料為有效並且是必需的，請使用 ClientScriptManager.RegisterForEventValidation 方法註冊回傳或回呼資料，以進行驗證。」
                    //2014.04.23：原本放在 blur 時做清除的動作，改到 dataBound 處理
                    var options = this.element.children().find("option");
                    if (options.length > 0) {
                        options.each(function () {
                            if ($(this).text() == "") $(this).remove();
                        });
                    }
                }
            };
            var settings = $.extend(defaults, options);


            //自訂參數 url，可載入 WebService 的資料
            if (settings.url != "undefined" && settings.url != undefined
                && settings.url != "") {
                settings = $.extend(settings, fnGetDataSourceSettings(settings.url));
            }


            $this.kendoComboBox(settings)
                .closest(".k-widget")
                .css("font-size", "85%")
                //.width("95%")
            //.attr("title", "選取資料請按 Enter！");


            var kendoObj = $this.data("kendoComboBox");
            var $wrapper = kendoObj.wrapper;        //將原始 input 的包起來的容器
            var $element = kendoObj.element;        //原始的 input（被隱藏）
            var $input = kendoObj.input;            //kendo 產生，用於顯示在畫面上的 input


            //#region input
            $input
                .click(function () {
                    kendoObj.open();
                })
                .focus(function () {
                    $(this).select();

                    ////2013.08.15：Add：自動調整資料的可見寬度
                    //$element.width("");                    
                    //var elementWidth = $element.width();
                    //if (elementWidth > wrapperWidth) {
                    //    if (elementWidth >= 500) {
                    //        $wrapper.width(500);
                    //    } else {
                    //        $wrapper.width(elementWidth + 30);
                    //    }
                    //}
                })
                .blur(function (e) {
                    if (kendoObj._isSelect) {
                        //修正 select 標籤，找不到下拉中的值時，選取第一筆資料
                        //    清空資料時，不顯示 placeholder
                        var index = kendoObj.select();
                        if (index === -1) {
                            var datas = kendoObj.dataSource.data();
                            if (datas.length > 0) {
                                kendoObj.text(datas[0].text);
                            } else {
                                kendoObj.text(null);
                            }
                        }


                        ////2013.07.08：Fix
                        ////修正 kendoComboBox 在 blur 時會自動替空的 select 標籤加入一個空的 option 標籤
                        ////    造成 .NET 錯誤：「無效的回傳或回呼引數。已在組態中使用 <pages enableEventValidation="true"/> 或在網頁中使用 <%@ Page EnableEventValidation="true" %> 啟用事件驗證。基於安全性理由，這項功能驗證回傳或回呼引數是來自原本呈現它們的伺服器控制項。如果資料為有效並且是必需的，請使用 ClientScriptManager.RegisterForEventValidation 方法註冊回傳或回呼資料，以進行驗證。」
                        //var options = $element.find("option");
                        //if (options.length > 0) {
                        //    options.each(function () {
                        //        if ($(this).text() == "") $(this).remove();
                        //    });
                        //}
                    }
                    

                    //$wrapper.width(wrapperWidth);
                });
            //2013.06.26：Fix：拿掉 blur()，因為若兩個下拉連動，造成第二個下拉有空值時，畫面會一直亂跳，kendoComboBox 無法套上去
            //.blur();
            //#endregion


            var wrapperWidthSetting = $wrapper.get(0).style.width || "";     //原始設定的寬度
            var wrapperWidth = $wrapper.width() || 0;                        //實際的寬度
            //#region wrapper

            //當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
            if ($wrapper.parent().children().length == 1
                && wrapperWidthSetting == "") {
                $wrapper.width("95%");
                //wrapperWidth = $wrapper.width() || 0;
                //2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
                $wrapper.ready(function () {
                    wrapperWidth = $wrapper.width() || 0;
                });
            }


            if ($input.is("[disabled]")) {
                $wrapper.attr("title", kendoObj.text());
            } else {
                //$wrapper.attr("title", "選取資料請按 Enter！");
            }


            //var $containedTable = $wrapper.parents("table");
            //var tableLayout = "";

            $wrapper
                .focusin(function () {
                    if (!$input.is("[disabled]")) {
                        if (autoWidth) {
                            ////2013.10.31：Add：自動變大前，先把 table 上的 table-layout=fixed 拿掉，變回原樣時，恢復原設定值
                            //tableLayout = $containedTable.css("table-layout");
                            //$containedTable.css("tableLayout", "auto");


                            //2013.08.15：Add：自動調整資料的可見寬度
                            $element.width("");
                            var elementWidth = $element.width();
                            if (elementWidth > wrapperWidth) {
                                //if (elementWidth >= 500) {
                                //    $wrapper.width(500);
                                //} else {
                                //    $wrapper.width(elementWidth + 30);
                                //}

                                //2013.10.24：Edit：調整自動調整寬度的條件
                                var lenLimit = 500;
                                if (wrapperWidth >= lenLimit) {
                                    //不調整
                                    //} else if (elementWidth >= lenLimit && wrapperWidth >= lenLimit) {
                                    //    $wrapper.width(lenLimit);
                                } else if (elementWidth >= lenLimit && wrapperWidth < lenLimit) {
                                    //$wrapper.width(wrapperWidth);
                                    $wrapper.width(lenLimit);
                                } else {
                                    $wrapper.width(elementWidth + 30);
                                }
                            }
                        }
                    }
                })
                .focusout(function () {
                    if (!$input.is("[disabled]")) {
                        if (autoWidth) {
                            //$containedTable.css("table-layout", tableLayout);

                            $wrapper.width(wrapperWidth);
                        }
                    }
                });
            //#endregion

        });

    }


    /// 取得 WebService 的 kendoDatasource 設定
    function fnGetDataSourceSettings(webServiceUrl) {
    	/// <summary>
    	/// 取得 WebService 的 kendoDatasource 設定
    	/// </summary>
    	/// <param name="webServiceUrl"></param>
        /// <returns type=""></returns>
        
        return {
            autoBind: false,
            dataTextField: "text",
            dataValueField: "value",
            dataSource: {
                //serverPaging: true,
                serverSorting: true,
                serverFiltering: true,
                //pageSize: 10,
                transport: {
                    read: {
                        type: "POST",
                        url: webServiceUrl,
                        contentType: "application/json; charset=utf-8"/*,
                            dataType: "json",
                            data: {
                                ////額外傳至後方的參數
                                //keywd: function () {
                                //    return $("#tKeyword").val();
                                //}
                            }*/
                    },
                    parameterMap: function (data, type) {
                        // web services need default values for every parameter
                        data = $.extend({ sort: null, filter: null }, data);
                        //{"sort":null,"filter":null,"take":10,"skip":0,"page":1,"pageSize":10}
                        //take=10&skip=0&page=1&pageSize=10

                        //return JSON.stringify(data);
                        return kendo.stringify(data);
                    }
                },
                schema: {
                    //如何解析從 server 收到的資料
                    parse: function (response) {
                        //return JSON.parse(response.d);
                        return response.d;
                    },
                    //取出資料陣列
                    data: function (response) {
                        if (response != null)
                            return response.Data;
                    }//,
                    //model: {
                    //    fields: {
                    //        atmDepCode: { type: "string" },
                    //        atmDepName: { type: "string" }
                    //    }
                    //}
                },
                error: function (e) {
                    var errMsg = "jqXHR：" + e.xhr.responseText + "<p>"
                        + "textStatus：" + e.status + "<p>"
                        + "errorThrown：" + e.errorThrown + "<p>" +
                        +"sender：" + e.sender + "<p>";

                    if ("kendoConsole" in window) {
                        kendoConsole.error(errMsg);
                    } else {
                        alert(errMsg);
                    }
                }
            }
        };
    }

})(jQuery);