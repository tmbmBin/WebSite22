///#source 1 1 /Scripts/jquery.MyKendo/jquery.MyKendoAutoComplete.js
/*
 *  作者：FrankWu
 *  建立日期：2013.06.19
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.1.319）
 *      4. 需要引用 jquery.caret（測試版本：1.02）
 *      5. 若要套用在 Server Control，請用 TextBox，以確保 PostBack 之後值不會消失


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
 *      1. 自動套用 kendoAutoComplete，並初始化成專案的需求
 *          a. 出現提示內容，用來快速輸入
 *          b. 支援直接載入 WebService 的資料
 *          c. 支援資料群組化（<optgroup>）
 *          d. 支援單選、多選
 *          e. 支援直接載入資料表某欄位的資料
 *
 *  使用方式：
 *      1. 個別套用：$(Selectors).MyKendoAutoComplete(url, [options]);
 *          url
 *              a. 可載入 WebService 的資料
 *              b. Server 實作請用 KendoDataSource.dll，回傳
 *                  public KendoDataSource.DataSourceResult MethodName( IEnumerable<KendoDataSource.Sort> sort, KendoDataSource.Filter filter ){ ... };
 *      2. 取得 tableName.columnName 裡面的資料：$.fn.MyKendoAutoComplete(tableName, columnName, [options])
 *      3. options
 *          a. 參考 http://docs.kendoui.com/api/web/autocomplete
 *      4. options 中另外提供一個自訂參數（非官方參數） isMulti
 *          a. 是否選多個值
 *          b. 預設：false
 *          c. 預設分隔號是「,」，若要修改請用 separator 參數
 *          d. 優先權大於 separator，若 isMulti=false，就算有設 separator 也不會有作用
 *      5. options 中另外提供一個自訂參數（非官方參數） groupChar
 *          a. 模擬 <optgroup> 群組的效果，不可被選取
 *          b. 準備工作：自行在 value 資料中，將要被識別為群組的資料，其 value 右邊串上 groupChar（預設為「*」）
 *          c. 預設：*
 *          d. 預設此功能啟用，給 null 或 "" 可以關閉此功能
 *
 *  已知問題：
 *      #1. 
 *
 *  修改歷程：
 *      2013.06.19：Init
 *      2013.06.25：Add：增加 取得 tableName.columnName 裡面的資料
 *      2013.07.30：
 *                  Add：關閉瀏覽器的自動完成功能
 *                  Add：當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
 *      2013.08.20：Add：增加自訂參數 groupChar，可模擬 <optgroup> 群組的效果，不可被選取
 *      2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
 *
*/
(function ($) {

    //個別設定
    $.fn.MyKendoAutoComplete = function (opt1, opt2, opt3) {
    //$.fn.MyKendoAutoComplete = function (url, options) {
        /// <summary>
        /// 設定 MyKendoAutoComplete
        /// </summary>

        //fnSetKendoAutoComplete(this, url, options);

        var options = {};
        var url = "";
        var tableName = "";
        var columnName = "";

        if (typeof opt1 === "string" && typeof opt2 === "object") {
            //$.fn.MyKendoAutoComplete(url, options)
            url = opt1 || "";
            options = opt2 || {};

            fnSetKendoAutoComplete(this, url, null, null, options);
        } else if (typeof opt1 === "string" && typeof opt2 === "string") {
            //$.fn.MyKendoAutoComplete(tableName, columnName, [options])
            tableName = opt1 || "";
            columnName = opt2 || "";
            options = opt3 || {};

            fnSetHistory(this, opt1, opt2, options);
        } else {
            //$.fn.MyKendoAutoComplete(url)
            url = opt1 || "";

            fnSetKendoAutoComplete(this, url);
        }

        return this;
    }


    //function fnSetKendoAutoComplete(jqSelect, url, options) {
    function fnSetKendoAutoComplete(jqSelect, url, tableName, columnName, options) {

        url = url || "";
        if (url == "")
            throw "需要參數 url（提供 WebService 資料的網址）！";


        jqSelect.filter("input").each(function () {

            var $this = $(this);
            options = options || {};
            //var groupChar = options.groupChar || "*";   //會被當作是群組的符號
            var groupChar = (options.groupChar === null || options.groupChar == ""
                                ? "" : options.groupChar || "*");   //會被當作是群組的符號


            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoAutoComplete") || {})) {

            }
            else {
                return;
            }


            var defaults = {
                filter: "contains",
                minLength: 1,
                ignoreCase: true,
                delay: 200,
                height: 200,
                //placeholder: "請選擇...",
                highlightFirst: true,
                //suggest: true,
                //separator: ","
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
                }
            };
            var settings = $.extend(defaults, options);


            //自訂參數 url，可載入 WebService 的資料
            if (url != "") {
                settings = $.extend(settings, fnGetDataSourceSettings(url, tableName, columnName));
            }


            //自訂參數 isMulti，是否選多個值
            settings.isMulti = settings.isMulti || false;
            settings.separator = settings.separator || ",";
            if (settings.isMulti) {
                //不動作，直接用預設參數
            } else {
                settings = $.extend(settings, {separator: null});
            }


            $this.kendoAutoComplete(settings)
                .closest(".k-widget")
                .css("font-size", "85%")
                //.width("95%")
            //.attr("title", "選取資料請按 Enter！");


            var kendoObj = $this.data("kendoAutoComplete");
            var $wrapper = kendoObj.wrapper;        //將原始 input 的包起來的容器
            var $element = kendoObj.element;        //原始的 input


            //#region element
            $element
                .attr("autocomplete", "off")
                //.css("font-size", "1.65em")
                .focus(function () {
                    //多值時，自動補齊分隔字元
                    if (settings.isMulti) {
                        var ValueSrc = kendoObj.value();
                        var separator = kendoObj.options.separator;
                        var ValueOut = "";

                        if (ValueSrc != ""
                            && ValueSrc.slice(ValueSrc.length - separator.length) != separator) {

                            ValueOut = ValueSrc + separator;

                            kendoObj.value(ValueOut);
                            $(this).caret(ValueOut.length, ValueOut.length);
                        }
                    }
                })
                .blur(function (e) {
                    //多值時，自動刪除分隔字元
                    if (settings.isMulti) {
                        var ValueSrc = kendoObj.value();
                        var separator = kendoObj.options.separator;

                        //kendoConsole.log(ValueSrc.slice(ValueSrc.length - separator.length));
                        //kendoConsole.log(separator);
                        if (ValueSrc.slice(ValueSrc.length - separator.length) == separator) {
                            kendoObj.value(ValueSrc.slice(0, (0 - separator.length)));
                        }
                    }
                });
            //#endregion

            
            var wrapperWidthSetting = $wrapper.get(0).style.width || "";     //原始設定的寬度
            var wrapperWidth = $wrapper.width() || 0;                        //實際的寬度
            //#region wrapper


            //kendoObj.wrapper
            //    .css("font-size", "65%");


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


            if ($element.is("[disabled]")) {

            } else {
                $wrapper.attr("title", "選取資料請按 Enter！");
            }

            //#endregion

        });

    }


    /// 取得 tableName.columnName 裡面的資料
    function fnSetHistory(jqControl, tableName, columnName, options) {
    	/// <summary>
        /// 取得 tableName.columnName 裡面的資料
    	/// </summary>
    	/// <param name="jqControl"></param>
    	/// <param name="tableName"></param>
    	/// <param name="columnName"></param>
        /// <param name="options"></param>
        
        if( tableName!="" && columnName!=""){

            var url = "../../BL.Payment.WS/WS/BigData.asmx/SelectHistory";


            fnSetKendoAutoComplete(jqControl, url, tableName, columnName, options);
        }
    }


    /// 取得 WebService 的 kendoDatasource 設定
    function fnGetDataSourceSettings(webServiceUrl, tableName, columnName) {
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
                        dataType: "json"*/,
                        data: {
                            pTableName: tableName, pColumnName: columnName
                        }
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
///#source 1 1 /Scripts/jquery.MyKendo/jquery.MyKendoComboBox.js
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
///#source 1 1 /Scripts/jquery.MyKendo/jquery.MyKendoDatePicker.js
/*
 *  作者：FrankWu
 *  建立日期：2013.06.24
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.1.319）
 *      4. 若要套用在 Server Control，請用 TextBox，以確保 PostBack 之後值不會消失
  

    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1-fix.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>

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
 *      1. 自動套用 kendoDatePicker，並初始化成專案的需求
 *      2. 具起始、結束日期的 kendoDatePicker，其最大值、最小值會互相牽制
 *
 *  使用方式：
 *      1. 全部套用：$.MyKendoDatePicker([options]);
 *          a. 自動找尋 [MyKendoDatePicker='MyKendoDatePicker'] 的 input 標籤套用 kendoDatePicker
 *      2. 個別套用：$(Selectors).MyKendoDatePicker([options]);
 *      3. 設定具起始、結束日期的 kendoDatePicker：$.MyKendoDatePicker(jqStart, jqEnd, [options]);
 *          a. jqStart：起始日期控制項，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *          b. jqEnd：起始日期控制項，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *      4. options
 *          a. 參考 http://docs.kendoui.com/api/web/datepicker
 *
 *  已知問題：
 *      #1. 
 *
 *  修改歷程：
 *      2013.06.24：Init
 *      2013.07.04：Fix：設定具起始、結束日期的 kendoDatePicker 的參數個數移到最前面先判斷
 *      2013.07.04：Fix：抓錯物件來判斷
 *          因為若被初始化過之後，此 input 的 css 也會被套用到 wrapper，若又使用 $$("##..") 的方式抓取，就會抓到兩個控制項，造成判斷有問題
 *      2013.07.30：
 *                  Add：關閉瀏覽器的自動完成功能
 *                  Add：當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
 *      2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
 *
*/
(function ($) {
    
    //全域設定
    $.MyKendoDatePicker = function (opt1, opt2, opt3) {
        /// <summary>
        /// 設定 MyKendoDatePicker
        /// <para>（標籤含 [MyKendoDatePicker='MyKendoDatePicker'] 的 input）</para>
        /// </summary>

        var options = {};
        var jqStart = {};
        var jqEnd = {};

        //2013.07.04：Fix：設定具起始、結束日期的 kendoDatePicker 的參數個數移到最前面先判斷
        if ((typeof opt1 === "string" || typeof opt1 === "object")
            && (typeof opt2 === "string" || typeof opt2 === "object")) {
            //$.MyKendoDatePicker(jqStart, jqEnd, [options]);
            jqStart = (opt1.jquery ? opt1 : $(opt1));
            jqEnd = (opt2.jquery ? opt2 : $(opt2));
            options = opt3;
            fnSetStartEndKendoDatePicker(jqStart, jqEnd, options);
        } else if (typeof opt1 === "object") {
            //$.MyKendoDatePicker();
            options = opt1;
            fnSetKendoDatePicker($("[MyKendoDatePicker='MyKendoDatePicker']"), options);
        } else {
            //$.MyKendoDatePicker(options);
            fnSetKendoDatePicker($("[MyKendoDatePicker='MyKendoDatePicker']"));
        }
    }

    //個別設定
    $.fn.MyKendoDatePicker = function (options) {
        /// <summary>
        /// 設定 MyKendoDatePicker
        /// </summary>

        fnSetKendoDatePicker(this, options);

        return this;
    }


    var minDate = new Date(1911, 0, 1);
    var maxDate = new Date(2099, 11, 31);

    function fnSetKendoDatePicker(jqControl, options) {

        jqControl.filter("input").each(function () {

            var $this = $(this);
            var format = "";
            var parseFormats = [];
            

            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoDatePicker") || {})) {

            }
            else {
                return;
            }


            /* 設定語系，自動判斷民國年或西元年 */
            kendo.culture("zh-TW");
            var pattern = kendo.culture().calendars.standard.patterns["d"];
            if (pattern.split("/")[0] == "yyy") {
                format = "yyy/MM/dd";
                parseFormats = ["yyy/MM/dd"];
            } else {
                format = "yyyy/MM/dd";
                parseFormats = ["yyyy/MM/dd"];
            }


            var defaults = {
                //culture: "zh-TW",
                //format: "yyy/MM/dd",
                format: format,
                //parseFormats: ["yyy/MM/dd"],
                parseFormats: parseFormats,
                value: null,
                min: minDate,
                max: maxDate,
                //start: MONTH,
                //depth: MONTH,
                //dates: [],
                //month: {},
                footer: "今天：#=kendo.toString(data, 'D', 'zh-TW')#"
            };
            var settings = $.extend(defaults, options);


            $this.kendoDatePicker(settings)
                .closest(".k-widget")
                .css("font-size", "85%")
                //.css("width", "110px")
                //.width("95%")
            //.attr("title", "滑鼠點兩下可開啟日曆選擇器！");


            var kendoObj = $this.data("kendoDatePicker");
            var $wrapper = kendoObj.wrapper;        //將原始 input 的包起來的容器
            var $element = kendoObj.element;        //原始的 input


            $element
                .attr("autocomplete", "off")
                //.css("font-size", "100%")
                //.css("padding", "0px")
                .dblclick(function () {
                    if ($(this).is("[readonly='readonly']")) {

                    } else {
                        kendoObj.open();
                    }
                });


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
                $wrapper.attr("title", "滑鼠點兩下可開啟日曆選擇器！");
            }

            //#endregion

        });
    }


    /// 設定具起始、結束日期的 kendoDatePicker
    function fnSetStartEndKendoDatePicker(jqStart, jqEnd, options) {
    	/// <summary>
        /// 設定具起始、結束日期的 kendoDatePicker
        /// <para>（其最大值、最小值會互相牽制）</para>
    	/// </summary>
    	/// <param name="jqStart">起始日期</param>
    	/// <param name="jqEnd">結束日期</param>
        /// <param name="options">組態設定</param>

        //2013.07.04：Fix：抓錯物件來判斷
        //  因為若被初始化過之後，此 input 的 css 也會被套用到 wrapper，若又使用 $$("##..") 的方式抓取，就會抓到兩個控制項，造成判斷有問題
        jqStart = jqStart.filter("input");
        jqEnd = jqEnd.filter("input");

        var dpStart = null;
        var dpEnd = null;


        /* 初始化控制項 */
        if ($.isEmptyObject(jqStart.data("kendoDatePicker") || {})) {
            jqStart.MyKendoDatePicker(options);
            dpStart = jqStart.data("kendoDatePicker");
        } else {
            dpStart = jqStart.data("kendoDatePicker");
            dpStart.setOptions(options);
        }

        if ($.isEmptyObject(jqEnd.data("kendoDatePicker") || {})) {
            jqEnd.MyKendoDatePicker(options);
            dpEnd = jqEnd.data("kendoDatePicker");
        } else {
            dpEnd = jqEnd.data("kendoDatePicker");
            dpEnd.setOptions(options);
        }


        //var dpStart = jqStart.data("kendoDatePicker");
        //var dpEnd = jqEnd.data("kendoDatePicker");

        var onChange = function () {
            var startValue = dpStart.value();
            var endValue = dpEnd.value();

            if (startValue) {
                dpEnd.min(startValue);
            } else {
                dpEnd.min(minDate);

                //模擬畫面重整的動作
                //解決當 maxDate 跟 minDate 在同個月份時，又清掉其中一個日期，其畫面不會重整
                dpEnd.dateView.calendar.navigateToFuture();
                dpEnd.dateView.calendar.navigateToPast();
            }

            if (endValue) {
                dpStart.max(endValue);
            } else {
                dpStart.max(maxDate);
               
                //模擬畫面重整的動作
                //解決當 maxDate 跟 minDate 在同個月份時，又清掉其中一個日期，其畫面不會重整
                dpStart.dateView.calendar.navigateToFuture();
                dpStart.dateView.calendar.navigateToPast();
            }
            

            /* 日期合法性檢查 */
            var startValueSrc = dpStart.element.val();
            var endValueSrc = dpEnd.element.val();

            if (!startValue && startValueSrc) {
                alert("起始日期必須在結束日期之前！");
                dpStart.value(null);
            }

            if (!endValue && endValueSrc) {
                alert("結束日期必須在起始日期之後！");
                dpEnd.value(null);
            }
            //kendoConsole.log("dpStart=" + dpStart.element.val());
            //kendoConsole.log("dpEnd=" + dpEnd.element.val());
        };


        dpStart.bind("change", onChange);
        dpEnd.bind("change", onChange);

        dpStart.max(dpEnd.value());
        dpEnd.min(dpStart.value());
    }

})(jQuery);
///#source 1 1 /Scripts/jquery.MyKendo/jquery.MyKendoDateTimePicker.js
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
///#source 1 1 /Scripts/jquery.MyKendo/jquery.MyKendoMultiSelect.js
/*
 *  作者：FrankWu
 *  建立日期：2013.06.14
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.1.319）
 *      4. 若要套用在 Server Control，請用 ListBox，且 SelectionMode="Multiple"，以確保 PostBack 之後值不會消失


    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>

    <%-- ↓↓KendoUI 所需檔案↓↓ --%>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />
    <%-- ↑↑KendoUI 所需檔案↑↑ --%>


 *  描述：
 *      1. 自動套用 kendoMultiSelect，並初始化成專案的需求
 *          a. 可多選
 *          b. 可過濾資料（僅可過濾 text）
 *          c. 支援直接載入 WebService 的資料
 *          d. 支援資料群組化（<optgroup>）
 *          e. 支援寬度可在點選時動態縮放
 *
 *  使用方式：
 *      1. 全部套用：$.MyKendoMultiSelect([options]);
 *          a. 自動找尋 [MyKendoMultiSelect='MyKendoMultiSelect'] 的 select、input 標籤套用 kendoMultiSelect
 *      2. 個別套用：$(Selectors).MyKendoMultiSelect([options]);
 *      3. options
 *          a. 參考 http://docs.kendoui.com/api/web/multiselect
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
 *      #2. 不可以加入 value="" 的 option，檢視時不會被選起來，因為該值被 placeholder 所用
 *
 *  修改歷程：
 *      2013.06.14：Init
 *      2013.06.19：Add：增加自訂參數 url，可載入 WebService 的資料
 *      2013.07.30：Add：當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
 *      2013.08.15：Add：自動調整資料的可見寬度
 *      2013.08.20：Add：增加自訂參數 groupChar，可模擬 <optgroup> 群組的效果，不可被選取
 *      2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
 *      2013.10.31：Add：增加自訂參數 autoWidth，是否在點選的時候，依照內容的寬度，暫時拉大寬度（讓內容盡量不斷行）
 *
*/
(function ($) {

    //全域設定
    $.MyKendoMultiSelect = function (options) {
        /// <summary>
        /// 設定 MyKendoMultiSelect
        /// <para>（標籤含 [MyKendoMultiSelect='MyKendoMultiSelect'] 的 select、input）</para>
        /// </summary>

        fnSetKendoMultiSelect($("[MyKendoMultiSelect='MyKendoMultiSelect']"), options);
    }

    //個別設定
    $.fn.MyKendoMultiSelect = function (options) {
        /// <summary>
        /// 設定 MyKendoMultiSelect
        /// </summary>

        fnSetKendoMultiSelect(this, options);

        return this;
    }


    function fnSetKendoMultiSelect(jqSelect, options) {

        jqSelect.filter("select, input").each(function () {

            var $this = $(this);
            options = options || {};
            //var groupChar = options.groupChar || "*";   //會被當作是群組的符號
            var groupChar = (options.groupChar === null || options.groupChar == ""
                                ? "" : options.groupChar || "*");   //會被當作是群組的符號
            var autoWidth = options.autoWidth || false;


            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoMultiSelect") || {})) {

            }
            else {
                return;
            }


            var defaults = {
                filter: "contains",
                minLength: 0,
                ignoreCase: true,
                delay: 100,
                height: 200,
                placeholder: "請選擇...",
                //maxSelectedItems: null,
                highlightFirst: true,
                itemTemplate: "# var len = data.value.length - " + groupChar.length + "; #"
                        + "# if( " + groupChar.length + " > 0 && data.value.substr(len, " + groupChar.length + ")=='" + groupChar + "' ) { #"
                        + " <span class='NotSelect'> ${data.text} </span> "
                        + "# } else { #"
                        + " ${data.text} "
                        + "# } #"
                //tagTemplate: ""
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
                }
            };
            var settings = $.extend(defaults, options);


            //自訂參數 url，可載入 WebService 的資料
            if (settings.url != "undefined" && settings.url != undefined
                && settings.url != "") {
                settings = $.extend(settings, fnGetDataSourceSettings(settings.url));
            }


            $this.attr("MyKendoMultiSelect", "MyKendoMultiSelect");
            $this.kendoMultiSelect(settings)
                .closest(".k-widget")
                .css("font-size", "85%")
                //.width("95%")
                //.attr("title", "先點一下，然後在輸入框輸入文字可以過濾資料！");


            var kendoObj = $this.data("kendoMultiSelect");
            var $wrapper = kendoObj.wrapper;        //將原始 input 的包起來的容器
            var $element = kendoObj.element;        //原始的 input（被隱藏）
            var $input = kendoObj.input;            //kendo 產生，用於顯示在畫面上的 input


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

            } else {
                $wrapper.attr("title", "先點一下，然後在輸入框輸入文字可以過濾資料！");
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
                            //if (elementWidth > wrapperWidth) {
                            //    if (elementWidth >= 500) {
                            //        $wrapper.width(500);
                            //    } else {
                            //        $wrapper.width(elementWidth + 30);
                            //    }
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
///#source 1 1 /Scripts/jquery.MyKendo/jquery.MyKendoNumericTextBox.js
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
///#source 1 1 /Scripts/jquery.MyKendo/jquery.MyKendoTimePicker.js
/*
 *  作者：FrankWu
 *  建立日期：2013.07.30
 *  先決條件：
 *      1. 需要引用 jquery.js（測試版本：1.9.1）
 *      2. 需要引用 jquery-migrate.js（測試版本：1.1.1）
 *      3. 需要引用 KendoUI（測試版本：v2013.2.716）
 *      4. 若要套用在 Server Control，請用 TextBox，以確保 PostBack 之後值不會消失
  

    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-1.9.1.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/jquery-migrate/jquery-migrate-1.1.1.min.js")%>" type="text/javascript"></script>

    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/kendo.web.min.js")%>" type="text/javascript"></script>
    <script src="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/js/cultures/kendo.culture.zh-TW.min.js")%>" type="text/javascript"></script>
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.common.min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%= MyLibrary.UrlExt.GetRelativeUrl("~/ScriptFiles/KendoUI/styles/kendo.silver.min.css")%>" rel="stylesheet" type="text/css" />


 *  描述：
 *      1. 自動套用 kendoTimePicker，並初始化成專案的需求
 *      2. 具起始、結束時間的 kendoTimePicker，其最大值、最小值會互相牽制
 *
 *  使用方式：
 *      1. 全部套用：$.MyKendoTimePicker([options]);
 *          a. 自動找尋 [MyKendoTimePicker='MyKendoTimePicker'] 的 input 標籤套用 kendoTimePicker
 *      2. 個別套用：$(Selectors).MyKendoTimePicker([options]);
 *      3. 設定具起始、結束時間的 kendoTimePicker：$.MyKendoTimePicker(jqStart, jqEnd, [options]);
 *          a. jqStart：起始時間控制項，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *          b. jqEnd：起始時間控制項，input=text，可以傳入 jquery 選擇器 或 jquery 物件
 *      4. options
 *          a. 參考 http://docs.kendoui.com/api/web/timepicker
 *
 *  已知問題：
 *      #1. 
 *
 *  修改歷程：
 *      2013.07.30：Init，從 MyKendoDatePicker.js 複製而來
 *      2013.07.30：
 *                  Add：關閉瀏覽器的自動完成功能
 *                  Add：當所在容器內只有自己一個元素，且沒有設寬度時，自動調整寬度
 *      2013.09.05：Fix：等到 render 到畫面後，再去抓寬度，因為有可能受當時版面影響，會不準
 *
*/
(function ($) {
    
    //全域設定
    $.MyKendoTimePicker = function (opt1, opt2, opt3) {
        /// <summary>
        /// 設定 MyKendoTimePicker
        /// <para>（標籤含 [MyKendoTimePicker='MyKendoTimePicker'] 的 input）</para>
        /// </summary>

        var options = {};
        var jqStart = {};
        var jqEnd = {};

        //2013.07.04：Fix：設定具起始、結束時間的 kendoTimePicker 的參數個數移到最前面先判斷
        if ((typeof opt1 === "string" || typeof opt1 === "object")
            && (typeof opt2 === "string" || typeof opt2 === "object")) {
            //$.MyKendoTimePicker(jqStart, jqEnd, [options]);
            jqStart = (opt1.jquery ? opt1 : $(opt1));
            jqEnd = (opt2.jquery ? opt2 : $(opt2));
            options = opt3;
            fnSetStartEndKendoTimePicker(jqStart, jqEnd, options);
        } else if (typeof opt1 === "object") {
            //$.MyKendoTimePicker();
            options = opt1;
            fnSetKendoTimePicker($("[MyKendoTimePicker='MyKendoTimePicker']"), options);
        } else {
            //$.MyKendoTimePicker(options);
            fnSetKendoTimePicker($("[MyKendoTimePicker='MyKendoTimePicker']"));
        }
    }

    //個別設定
    $.fn.MyKendoTimePicker = function (options) {
        /// <summary>
        /// 設定 MyKendoTimePicker
        /// </summary>

        fnSetKendoTimePicker(this, options);

        return this;
    }


    var minDate = new Date(1911, 0, 1);
    var maxDate = new Date(2099, 11, 31);

    function fnSetKendoTimePicker(jqControl, options) {

        jqControl.filter("input").each(function () {

            var $this = $(this);
            var format = "";
            var parseFormats = [];


            /* 已套用過的，不重複套用 */
            if ($.isEmptyObject($this.data("kendoTimePicker") || {})) {

            }
            else {
                return;
            }


            /* 設定語系，自動判斷民國年或西元年 */
            kendo.culture("zh-TW");


            var defaults = {
                //culture: "zh-TW",
                format: "HH:mm",    //24時制
                parseFormats: [],
                value: null,
                min: minDate,
                max: maxDate,
                interval: 30,
                height: 200
            };
            var settings = $.extend(defaults, options);


            $this.kendoTimePicker(settings)
                .closest(".k-widget")
                .css("font-size", "85%")
                //.width("95%")
            //.attr("title", "滑鼠點兩下可開啟時間選擇器！");


            var kendoObj = $this.data("kendoTimePicker");
            var $wrapper = kendoObj.wrapper;        //將原始 input 的包起來的容器
            var $element = kendoObj.element;        //原始的 input


            $element
                .attr("autocomplete", "off")
                //.css("font-size", "100%")
                //.css("padding", "0px")
                .dblclick(function () {
                    if ($(this).is("[readonly='readonly']")) {

                    } else {
                        kendoObj.open();
                    }
                });


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
                $wrapper.attr("title", "滑鼠點兩下可開啟時間選擇器！");
            }

            //#endregion

        });
    }


    /// 設定具起始、結束時間的 kendoTimePicker
    function fnSetStartEndKendoTimePicker(jqStart, jqEnd, options) {
    	/// <summary>
        /// 設定具起始、結束時間的 kendoTimePicker
        /// <para>（其最大值、最小值會互相牽制）</para>
    	/// </summary>
        /// <param name="jqStart">起始時間</param>
        /// <param name="jqEnd">結束時間</param>
        /// <param name="options">組態設定</param>

        //2013.07.04：Fix：抓錯物件來判斷
        //  因為若被初始化過之後，此 input 的 css 也會被套用到 wrapper，若又使用 $$("##..") 的方式抓取，就會抓到兩個控制項，造成判斷有問題
        jqStart = jqStart.filter("input");
        jqEnd = jqEnd.filter("input");

        var dpStart = null;
        var dpEnd = null;


        /* 初始化控制項 */
        if ($.isEmptyObject(jqStart.data("kendoTimePicker") || {})) {
            jqStart.MyKendoTimePicker(options);
            dpStart = jqStart.data("kendoTimePicker");
        } else {
            dpStart = jqStart.data("kendoTimePicker");
            dpStart.setOptions(options);
        }

        if ($.isEmptyObject(jqEnd.data("kendoTimePicker") || {})) {
            jqEnd.MyKendoTimePicker(options);
            dpEnd = jqEnd.data("kendoTimePicker");
        } else {
            dpEnd = jqEnd.data("kendoTimePicker");
            dpEnd.setOptions(options);
        }


        //var dpStart = jqStart.data("kendoTimePicker");
        //var dpEnd = jqEnd.data("kendoTimePicker");

        var onChange = function () {
            var startValue = dpStart.value();
            var endValue = dpEnd.value();

            if (startValue) {
                dpEnd.min(startValue);
            } else {
                dpEnd.min(minDate);
            }

            if (endValue) {
                dpStart.max(endValue);
            } else {
                dpStart.max(maxDate);
            }
            

            /* 時間合法性檢查 */
            var startValueSrc = dpStart.element.val();
            var endValueSrc = dpEnd.element.val();

            if (!startValue && startValueSrc) {
                alert("起始時間必須在結束時間之前！");
                dpStart.value(null);
            }

            if (!endValue && endValueSrc) {
                alert("結束時間必須在起始時間之後！");
                dpEnd.value(null);
            }
            //kendoConsole.log("dpStart=" + dpStart.element.val());
            //kendoConsole.log("dpEnd=" + dpEnd.element.val());
        };


        dpStart.bind("change", onChange);
        dpEnd.bind("change", onChange);

        dpStart.max(dpEnd.value());
        dpEnd.min(dpStart.value());
    }

})(jQuery);
///#source 1 1 /Scripts/jquery.MyKendo/jquery.MyKendoUpload.js
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
