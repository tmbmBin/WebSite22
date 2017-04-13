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