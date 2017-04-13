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