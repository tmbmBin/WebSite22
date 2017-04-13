/* Chinese initialisation for the jQuery UI date picker plugin. */
/* Written by Ressol (ressol@gmail.com). */
jQuery(function ($) {
    $.datepicker.regional['zh-TW'] = {
        clearText: '清除',
        closeText: '關閉',
        prevText: '&#x3c;上個月',
        nextText: '下個月&#x3e;',
        currentText: '今天',
        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
		'七月', '八月', '九月', '十月', '十一月', '十二月'],
        monthNamesShort: ['一', '二', '三', '四', '五', '六',
		'七', '八', '九', '十', '十一', '十二'],
        dayNames: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
        dayNamesShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
        dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
        weekHeader: '周',
        dateFormat: 'yy/mm/dd',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '年'
    };
    $.datepicker.setDefaults($.datepicker.regional['zh-TW']);


    $.extend($.datepicker, {
        formatDate: function (format, date, settings) {
            var d = date.getDate();
            var m = date.getMonth() + 1;
            var y = date.getFullYear();
            var fm = function (v) {
                return (v < 10 ? '0' : '') + v;
            };
            return (y - 1911) + '/' + fm(m) + '/' + fm(d);
        },
        parseDate: function (format, value, settings) {
            var v = new String(value);
            var Y, M, D;

            var $token = v.split('/');
            if ($token.length == 3) {
                Y = $token[0] - 0 + 1911;
                M = $token[1] - 0 - 1;
                D = $token[2] - 0;
                return (new Date(Y, M, D));
            }

//            if (v.length == 9) {/*100/12/15*/
//                Y = v.substring(0, 3) - 0 + 1911;
//                M = v.substring(4, 6) - 0 - 1;
//                D = v.substring(7, 9) - 0;
//                return (new Date(Y, M, D));
//            } else if (v.length == 8) {/*98/12/15*/
//                Y = v.substring(0, 2) - 0 + 1911;
//                M = v.substring(3, 5) - 0 - 1;
//                D = v.substring(6, 8) - 0;
//                return (new Date(Y, M, D));
//            }
            return (new Date());
        },
        formatYear: function (v) {
            return '民國 ' + (v - 1911) + ' 年';
        }
    });
});
