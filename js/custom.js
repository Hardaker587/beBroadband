// Pass the id of the initial select2 tag that is used
// to create the select2
function select2_has_error(el, color='#A94442'){
    var tag = $(el).select();
    if ( tag ) {
        var link_bound = tag[0].previousElementSibling.childNodes[0];
        $(link_bound).css('border-color', color);
    }
}

function select2_no_error(el){
    select2_has_error(el, '');
}

// Toggle password visibility input by id
//
function toggle_on(password){
    password.type = "text";
}
function toggle_off(password){
    //Add timer hide if copy is needed
    setTimeout(function(){
        password.type = "password";
    }, 2000);
}

Number.prototype.length_between = function(a, b, inclusive) {
    var min = Math.min(a, b),
    max = Math.max(a, b),
    len = this.toString().length;
    return inclusive ? len >= min && len <= max : len > min && len < max;
}

function urlEncode(s){
    return encodeURIComponent( s ).replace( /\%20/g, '+' ).replace( /!/g, '%21' ).replace( /'/g, '%27' ).replace( /\(/g, '%28' ).replace( /\)/g, '%29' ).replace( /\*/g, '%2A' ).replace( /\~/g, '%7E' );
}

function urlDecode(s){
    return decodeURIComponent( s.replace( /\+/g, '%20' ).replace( /\%21/g, '!' ).replace( /\%27/g, "'" ).replace( /\%28/g, '(' ).replace( /\%29/g, ')' ).replace( /\%2A/g, '*' ).replace( /\%7E/g, '~' ) );
}

function urlEncode2 (str) {
    return encodeURIComponent(str).
        // Note that although RFC3986 reserves "!", RFC5987 does not,
        // so we do not need to escape it
        replace(/['()]/g, escape). // i.e., %27 %28 %29
        replace(/\*/g, '%2A').
            // The following are not required for percent-encoding per RFC5987,
            // so we can allow for a little better readability over the wire: |`^
            replace(/%(?:7C|60|5E)/g, unescape);
}

// adds '!' to encodeURIComponent
~function () {
    var orig = window.encodeURIComponent;
    window.encodeURIComponent = function (str) {
        // calls the original function, and adds your
        // functionality to it
        return orig.call(window, str).replace(/!/g, '%21').replace(/\*/g,'%2A').replace(/\$/g,'%24');
    };
}();

function escapeHtml(text) {
  return text
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;")
      .replace(/'/g, "&#039;");
}

function IsAlphaNumeric(input) {
    var regex = /[^a-zA-Z0-9]/;
    return regex.test(input);
}

function IsEmail(emails)
{
    var res = emails.split(",");
    for(i = 0; i < res.length; i++)
        if(!validateEmail(res[i])) return false;
    return true;
}

function dt_sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds){
            break;
        }
    }
}

function validateEmail(email){
  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,10})+$/;
  return regex.test(email);
}
function IsPhoneNumber(num) {
    var regex = /^[0-9-+]+$/;
    if (num.length < 10){ return false; }
    return regex.test(num);
}
function isMacAddress(mac){
    var regex = /^([0-9A-Fa-f]{2}[:]){5}([0-9A-Fa-f]{2})$/;
    return regex.test(mac);
}
function isNumber(num){
    num = num.replace(",","");
    return !isNaN(num);
}
function IsPassword(input){
    var regex = /^.*[a-zA-Z0-9\@\^\~\+=\\\*\(\)\{<\}\$\!%\#\?&\|>\[\}\-\/\.\,\;\:_]{6,}$/;
    return regex.test(input);
}
function IsTime(input,format){
    var regex = /^([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/;
	if (format=="hh:mm"){
		regex = /^([0-1][0-9]|2[0-3]):([0-5][0-9])$/;
	}
    return regex.test(input);
}
function isDate(input,format){
    var regex= "";
    if (format===undefined || format=="yyyy-mm-dd"){
		regex = /^\d{4}[\-\/\s]?((((0[13578])|(1[02]))[\-\/\s]?(([0-2][0-9])|(3[01])))|(((0[469])|(11))[\-\/\s]?(([0-2][0-9])|(30)))|(02[\-\/\s]?[0-2][0-9]))$/;
	}
	return regex.test(input);
}
function IsValidIP(input){
	if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(input)){ 
		return true;
	} else {
		return false;
	}
}
function IsIDnumber(input){
    var regex = /(((\d{2}((0[13578]|1[02])(0[1-9]|[12]\d|3[01])|(0[13456789]|1[012])(0[1-9]|[12]\d|30)|02(0[1-9]|1\d|2[0-8])))|([02468][048]|[13579][26])0229))(( |-)(\d{4})( |-)(\d{3})|(\d{7}))$/;
    return regex.test(input);
}

function isValidGPS(input){
	var regex = /([+-]?\d+\.?\d+)\s*,\s*([+-]?\d+\.?\d+)/;
	return regex.test(input.trim());
}

function isValidURL(input) {
	var regex = /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/;
	return regex.test(input.trim());
}

function isValidDomain(input) {
	var regex = /^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9](?:\.[a-zA-Z]{2,})+$/;
	return regex.test(input.trim());
}

/*
function ValidateIPAddress($checkipaddress) {
	var IpAddReg = /^([1-9][0-9]{0,1}|1[0-9]{2}|2[0-4][0-9]|25[0-4])\.([1-9][0-9]{0,1}|1[0-9]{2}|2[0-4][0-9]|25[0-4])\.([1-9][0-9]{0,1}|1[0-9]{2}|2[0-4][0-9]|25[0-4])\.([1-9][0-9]{0,1}|1[0-9]{2}|2[0-4][0-9]|25[0-4])$/;
	return IpAddReg.test( $checkipaddress );
};
*/

function Ucfirst(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}

var ordinalize = function(n) {
   var s=["th","st","nd","rd"],
       v=n%100;
   return n+(s[(v-20)%10]||s[v]||s[0]);
}

function today(){
    var d = new Date();
    var month = d.getMonth()+1;
    var day = d.getDate();
    var output = d.getFullYear() + '-' +
        ((''+month).length<2 ? '0' : '') + month + '-' +
        ((''+day).length<2 ? '0' : '') + day;
    return(output);
}

function formatNum(nStr)
{
	return accounting.formatMoney(nStr, '', 2, ",", ".");
/*
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
	x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
*/
}

function removeNL(s) {
  r = "";
  for (i=0; i < s.length; i++) {
    if (s.charAt(i) != '\n' &&
        s.charAt(i) != '\r' &&
        s.charAt(i) != '\t') {
      r += s.charAt(i);
      } else {
      r += ' ';
      }
    }
  return r;
}

function amount(amt, label) {
    return amt.toFixed(2);
}

function formatMoney(n, c, d, t){
    var c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};

function bytes(bytes, label) {
    if (bytes == 0) return ;
    var s = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
    var e = Math.floor(Math.log(bytes)/Math.log(1024));
    var value = ((bytes/Math.pow(1024, Math.floor(e))).toFixed(1));
    e = (e<0) ? (-e) : e;
    if (label) value += ' ' + s[e];
    return value;
}
function speed(bytes, label) {
    if (bytes == 0) return ;
    var s = ['b/s', 'Kb/s', 'Mb/s', 'Gb/s', 'Tb/s', 'Pb/s'];
    var e = Math.floor(Math.log(bytes)/Math.log(1024));
    var value = ((bytes/Math.pow(1024, Math.floor(e))).toFixed(1));
    e = (e<0) ? (-e) : e;
    if (label) value += ' ' + s[e];
    return value;
}
function data_speed(bytes, label) {
    if (bytes == 0) return ;
    var s = ['b/s', 'Kb/s', 'Mb/s', 'Gb/s', 'Tb/s', 'Pb/s'];
    var e = Math.floor(Math.log(bytes)/Math.log(1024));
    var value = ((bytes/Math.pow(1024, Math.floor(e))).toFixed(1));
    e = (e<0) ? (-e) : e;
    if (label) value += ' ' + s[e];
    return value;
}

function speed_1000(bytes, label) {
    if (bytes == 0) return 0;
    if (bytes < 0){bytes = bytes * -1;}
    var s = ['b/s', 'Kb/s', 'Mb/s', 'Gb/s', 'Tb/s', 'Pb/s'];
    var e = Math.floor(Math.log(bytes)/Math.log(1000));
    var value = ((bytes/Math.pow(1000, Math.floor(e))).toFixed(1));
    e = (e<0) ? (-e) : e;
    if (label) value += ' ' + s[e];
    return value;
}

function sec_to_time(secs){
//  var ts = (new Date).clearTime().addSeconds(secs).toString('H:mm:ss');
//  return ts;

    var sec_num = parseInt(secs, 10); // don't forget the second param
    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    var seconds = sec_num - (hours * 3600) - (minutes * 60);

    if (hours   < 10) {hours   = "0"+hours;}
    if (minutes < 10) {minutes = "0"+minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    var time    = hours+':'+minutes+':'+seconds;
    return time;
}

function sec_to_time_days(secs){
//  var ts = (new Date).clearTime().addSeconds(secs).toString('H:mm:ss');
//  return ts;

    var sec_num = parseInt(secs, 10); // don't forget the second param
    var days    = Math.floor(sec_num / 86400);
    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    var seconds = sec_num - (hours * 3600) - (minutes * 60);

    if (hours   > 23) {hours   = hours - (Math.floor(hours / 24)*24);}
    if (hours   < 10) {hours   = "0"+hours;}
    if (minutes < 10) {minutes = "0"+minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    var time    = days+' days '+hours+':'+minutes+':'+seconds;
    return time;
}

function nl2br (str, is_xhtml) {
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
}

String.prototype.toUpperCaseFirstChar = function() {
    return this.substr( 0, 1 ).toUpperCase() + this.substr( 1 );
}

function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
}

/*
$.noty.defaults = {
    layout: 'top',
    theme: 'bootstrapTheme', // or 'relax'
    type: 'alert',
    text: '', // can be html or string
    dismissQueue: true, // If you want to use queue feature set this true
    template: '<div class="noty_message"><span class="noty_text"></span><div class="noty_close"></div></div>',
    animation: {
        open: {height: 'toggle'}, // or Animate.css class names like: 'animated bounceInLeft'
        close: {height: 'toggle'}, // or Animate.css class names like: 'animated bounceOutLeft'
        easing: 'swing',
        speed: 500 // opening & closing animation speed
    },
    timeout: false, // delay for closing event. Set false for sticky notifications
    force: false, // adds notification to the beginning of queue when set to true
    modal: false,
    maxVisible: 5, // you can set max visible notification for dismissQueue true option,
    killer: false, // for close all notifications before show
    closeWith: ['click'], // ['click', 'button', 'hover', 'backdrop'] // backdrop click will close all notifications
    callback: {
        onShow: function() {},
        afterShow: function() {},
        onClose: function() {},
        afterClose: function() {},
        onCloseClick: function() {},
    },
    buttons: false // an array of buttons
};
*/


function show_notify(message_text,message_type,message_position,message_duration,message_container){
    if (message_position === undefined  ){ message_position = 'topRight';}
    if (message_type === undefined      ){ message_type = 'alert';}
    if (message_duration === undefined  ){ message_duration = 7500;}
    if (message_container === undefined ){ message_container = null;}
    

	new Noty({
	    text: message_text,
	    type: message_type,
	    theme: 'bootstrap-v3',
	    timeout: message_duration,
	    layout: message_position,
	    progressBar: true,
	    container: message_container
	}).show();

/*
    new Noty({
        text: message_text,
        layout: message_position,
        theme: 'bootstrapTheme',
        type: message_type,
        dismissQueue: true, // If you want to use queue feature set this true
        template: '<div class="noty_message"><span class="noty_text"></span><div class="noty_close"></div></div>',
        animation: {
            open: {height: 'toggle'},
            close: {height: 'toggle'},
            easing: 'swing',
            speed: 500 // opening & closing animation speed
        },
        timeout: message_duration, // delay for closing event. Set false for sticky notifications
        force: false, // adds notification to the beginning of queue when set to true
        modal: false,
        maxVisible: 5, // you can set max visible notification for dismissQueue true option
        closeWith: ['click'], // ['click', 'button', 'hover']
        callback: {
            onShow: function() {},
            afterShow: function() {},
            onClose: function() {},
            afterClose: function() {}
        },
        buttons: false // an array of buttons
    }).show();
*/
}

function confirm_notify(message_text,message_type,message_position,message_duration){
    if (message_position === undefined  ){ message_position = 'topRight';}
    if (message_type === undefined      ){ message_type = 'alert';}
    if (message_duration === undefined  ){ message_duration = 10000;}

	new Noty({
	    text: message_text,
	    type: message_type,
	    timeout: false,
	    closeWith: ['click'],
	}).show();

/*
    new Noty({
        text: message_text,
        layout: message_position,
        theme: 'bootstrapTheme',
        type: message_type,
        dismissQueue: true, // If you want to use queue feature set this true
        template: '<div class="noty_message"><span class="noty_text"></span><div class="noty_close"></div></div>',
        animation: {
            open: {height: 'toggle'},
            close: {height: 'toggle'},
            easing: 'swing',
            speed: 500 // opening & closing animation speed
        },
        timeout: false, // delay for closing event. Set false for sticky notifications
        force: false, // adds notification to the beginning of queue when set to true
        modal: true,
        maxVisible: 5, // you can set max visible notification for dismissQueue true option
        closeWith: ['click'], // ['click', 'button', 'hover']
        callback: {
            onShow: function() {},
            afterShow: function() {},
            onClose: function() {},
            afterClose: function() {}
        },
          buttons: [
            {addClass: 'btn btn-default btn-sm', text: 'Ok', onClick: function($noty) {
                $noty.close();
              }
            }
          ]
    }).show();
*/
}

var graph_fonts = "Helvetica,Arial,Sans-Serif ";
var graph_font_size = "normal 11px ";
var graph_title_size = "normal 12px ";
var graph_legend_size = "12px ";

var red_to_green = [
    '#00ff00',
    '#33ff00',
    '#66ff00',
    '#99ff00',
    '#ccff00',
    '#ffff00',
    '#ffcc00',
    '#ff9900',
    '#ff6600',
    '#ff3300',
    '#ff0000',
]
var graph_colors =  [
    '#ff0000',
    '#2f7ed8',
    '#8bbc21',
    '#910000',
    '#1aadce',
    '#492970',
    '#f28f43',
    '#77a1e5',
    '#c42525',
    '#89A54E',
    '#4572A7',
    '#80699B',
    '#AA4643',
    '#ccc',
    '#888',
    '#a6c96a',
    '#3D96AE',
    '#DB843D',
    '#92A8CD',
    '#A47D7C',
    '#B5CA92',
    '#a6cee3',
    '#1f78b4',
    '#8bbc21',
    '#b2df8a',
    '#33a02c',
    '#fb9a99',
    '#e31a1c',
    '#fdbf6f',
    '#ff7f00',
    '#cab2d6',
    '#6a3d9a',
    '#ffff99',
    '#b15928'
];

var graph_colors_workflow =  [
    '#2f7ed8',
    '#8bbc21',
    '#1aadce',
    '#492970',
    '#f28f43',
    '#77a1e5',
    '#c42525',
    '#89A54E',
    '#4572A7',
    '#80699B',
    '#AA4643',
    '#ccc',
    '#888',
    '#a6c96a',
    '#3D96AE',
    '#DB843D',
    '#92A8CD',
    '#A47D7C',
    '#B5CA92',
    '#a6cee3',
    '#1f78b4',
    '#8bbc21',
    '#b2df8a',
    '#33a02c',
    '#fb9a99',
    '#e31a1c',
    '#fdbf6f',
    '#ff7f00',
    '#cab2d6',
    '#6a3d9a',
    '#ffff99',
    '#b15928',
    '#ff0000',
    '#910000'
];

var phone_colors = [
    '#80699B',
    '#89A54E'
];

var data_colors = [
    '#6BB848',
    '#75CC58'
];

var traffic_colors = [
//   '#87CEFA',
   '#4682B4',
   '#9ABD93',
//   '#CD748F'
];


(function($) {
    $.fn.spin = function(opts, color) {
        var presets = {
            "tiny": { lines: 8, length: 2, width: 2, radius: 3 },
            "small": { lines: 8, length: 4, width: 3, radius: 5 },
            "large": { lines: 10, length: 8, width: 4, radius: 8 }
        };
        if (Spinner) {
            return this.each(function() {
                var $this = $(this),
                    data = $this.data();

                if (data.spinner) {
                    data.spinner.stop();
                    delete data.spinner;
                }
                if (opts !== false) {
                    if (typeof opts === "string") {
                        if (opts in presets) {
                            opts = presets[opts];
                        } else {
                            opts = {};
                        }
                        if (color) {
                            opts.color = color;
                        }
                    }
                    data.spinner = new Spinner($.extend({color: $this.css('color')}, opts)).spin(this);
                }
            });
        } else {
            throw "Spinner class not available.";
        }
    };
    $.customerSelect = function(selector,placeholder,list,prepaid) {
        var placeholder = (typeof placeholder	!== 'undefined' && placeholder.length > 0 ? placeholder : 'Select a customer');
        var prepaid		= (typeof prepaid		!== 'undefined' && prepaid > 0 ? 1 : 0);
        return $(selector).select2({
            'minimumResultsForSearch': 5,
            'placeholder' : placeholder,
            'allowClear' : true,
            'ajax' : {
                'url' : datatill.url('customers/ajax_search'),
                'dataType' : 'JSON',
                'quietMillis' : 250,
                'data' : function(term,page) {
                    return {
                        'query'		: term,
                        'page'		: page,
                        'prepaid'	: (prepaid >0 ? 1 : 0),

                    };
                },
                'results' : function(data, page) {
                    var more = (page * 30) < data.total_rows;
                    return {
                        results : data.items,
                        'text': function(item) {
                            return item.title;
                        },
                        'more': more,
                    };
                },
                'cache' : true
            },
            'initSelection' : function(el,callback) {
                var id = $(el).val();

                    $.ajax({
                        'dataType' : 'JSON',
                        'data' : {
                            id : id
                        },
                        'url' : datatill.url('customers/ajax_get'),
                        'quietMillis' : 250,
                        'success' : function(data,xhr) {
                            callback({
                                id : data.id,
                                text : data.accounting_code+'-'+data.customer_title
                            });
                        },
                        'error' : function(xhr) {

                        }

                    });
            }
        });
    };
    $.customerMultiSelect = function(selector,placeholder) {
        var placeholder = (typeof placeholder !== 'undefined' && placeholder.length > 0 ? placeholder : 'Select customers');
        return $(selector).select2({
            'minimumResultsForSearch': 5,
			'multiple' : true,
            'placeholder' : placeholder,
            'allowClear' : true,
            'ajax' : {
                'url' : datatill.url('customers/ajax_search'),
                'dataType' : 'JSON',
                'quietMillis' : 250,
                'data' : function(term,page) {
                    return {
                        'query' : term,
                        'page' : page
                    };
                },
                'results' : function(data, page) {
                    var more = (page * 30) < data.total_rows;
                    return {
                        results : data.items,
                        'text': function(item) {
                            return item.title;
                        },
                        'more': more,
                    };
                },
                'cache' : true
            },
            'initSelection' : function(el,callback) {
                var id = $(el).val();

                    $.ajax({
                        'dataType' : 'JSON',
                        'data' : {
                            id : id
                        },
                        'url' : datatill.url('customers/ajax_get'),
                        'quietMillis' : 250,
                        'success' : function(data,xhr) {
                            callback({
                                id : data.id,
                                text : data.accounting_code+'-'+data.customer_title
                            });
                        },
                        'error' : function(xhr) {

                        }

                    });
            }
        });
    };
    $.customerDebtorsSelect = function(selector,placeholder,list) {
        var placeholder = (typeof placeholder	!== 'undefined' && placeholder.length > 0 ? placeholder : 'Select a customer');
        
        return $(selector).select2({
            'minimumResultsForSearch': 5,
            'placeholder' : placeholder,
            'allowClear' : true,
            'ajax' : {
                'url' : datatill.url('customers/ajax_debtors_search'),
                'dataType' : 'JSON',
                'quietMillis' : 250,
                'data' : function(term,page) {
                    return {
                        'query'		: term,
                        'page'		: page,

                    };
                },
                'results' : function(data, page) {
                    var more = (page * 30) < data.total_rows;
                    return {
                        results : data.items,
                        'text': function(item) {
                            return item.title;
                        },
                        'more': more,
                    };
                },
                'cache' : true
            },
            'initSelection' : function(el,callback) {
                var id = $(el).val();

                    $.ajax({
                        'dataType' : 'JSON',
                        'data' : {
                            id : id
                        },
                        'url' : datatill.url('customers/ajax_get'),
                        'quietMillis' : 250,
                        'success' : function(data,xhr) {
                            callback({
                                id : data.id,
                                text : data.accounting_code+'-'+data.customer_title
                            });
                        },
                        'error' : function(xhr) {

                        }

                    });
            }
        });
    };
    $.resellerCustomerSelect = function(selector,placeholder) {
        var placeholder = (typeof placeholder !== 'undefined' && placeholder.length > 0 ? placeholder : 'Select a customer');
        return $(selector).select2({
            'minimumResultsForSearch': 5,
            'placeholder' : placeholder,
            'allowClear' : true,
            'ajax' : {
                'url' : datatill.url('customers/ajax_reseller_customer_search'),
                'dataType' : 'JSON',
                'quietMillis' : 250,
                'data' : function(term,page) {
                    return {
                        'query' : term,
                        'page' : page
                    };
                },
                'results' : function(data, page) {
                    var more = (page * 30) < data.total_rows;
                    return {
                        results : data.items,
                        'text': function(item) {
                            return item.title;
                        },
                        'more': more,
                    };
                },
                'cache' : true
            },
            'initSelection' : function(el,callback) {
                var id = $(el).val();
                    $.ajax({
                        'dataType' : 'JSON',
                        'data' : {
                            id : id
                        },
                        'url' : datatill.url('customers/ajax_resellers_get'),
                        'quietMillis' : 250,
                        'success' : function(data,xhr) {
                            callback({
                                id : data.id,
                                text : data.accounting_code+'-'+data.customer_title
                            });
                        },
                        'error' : function(xhr) {

                        }

                    });
            }
        });
    };
    $.resellerCustomerMultiSelect = function(selector,placeholder) {
        var placeholder = (typeof placeholder !== 'undefined' && placeholder.length > 0 ? placeholder : 'Select customers');
        return $(selector).select2({
            'minimumResultsForSearch': 5,
            'placeholder' : placeholder,
			'multiple' : true,
            'allowClear' : true,
            'ajax' : {
                'url' : datatill.url('customers/ajax_reseller_customer_search'),
                'dataType' : 'JSON',
                'quietMillis' : 250,
                'data' : function(term,page) {
                    return {
                        'query' : term,
                        'page' : page
                    };
                },
                'results' : function(data, page) {
                    var more = (page * 30) < data.total_rows;
                    return {
                        results : data.items,
                        'text': function(item) {
                            return item.title;
                        },
                        'more': more,
                    };
                },
                'cache' : true
            },
            'initSelection' : function(el,callback) {
                var id = $(el).val();
                    $.ajax({
                        'dataType' : 'JSON',
                        'data' : {
                            id : id
                        },
                        'url' : datatill.url('customers/ajax_resellers_get'),
                        'quietMillis' : 250,
                        'success' : function(data,xhr) {
                            callback({
                                id : data.id,
                                text : data.accounting_code+'-'+data.customer_title
                            });
                        },
                        'error' : function(xhr) {

                        }

                    });
            }
        });
    };
    $.subaccountsCustomerSelect = function(selector,placeholder) {
        var placeholder = (typeof placeholder !== 'undefined' && placeholder.length > 0 ? placeholder : 'Select a customer');
        return $(selector).select2({
            'minimumResultsForSearch': 5,
            'placeholder' : placeholder,
            'allowClear' : true,
            'ajax' : {
                'url' : datatill.url('customers/ajax_subaccounts_customer_search'),
                'dataType' : 'JSON',
                'quietMillis' : 250,
                'data' : function(term,page) {
                    return {
                        'id' : $('#id').val(),
                        'query' : term,
                        'page' : page
                    };
                },
                'results' : function(data, page) {
                    var more = (page * 30) < data.total_rows;
                    return {
                        results : data.items,
                        'text': function(item) {
                            return item.title;
                        },
                        'more': more,
                    };
                },
                'cache' : true
            },
            'initSelection' : function(el,callback) {
                var id = $(el).val();
                    $.ajax({
                        'dataType' : 'JSON',
                        'data' : {
                            id : id
                        },
                        'url' : datatill.url('customers/ajax_subaccounts_get'),
                        'quietMillis' : 250,
                        'success' : function(data,xhr) {
                            callback({
                                id : data.id,
                                text : data.accounting_code+'-'+data.customer_title
                            });
                        },
                        'error' : function(xhr) {

                        }

                    });
            }
        });
    };
    $.radiusSelect = function(selector,account_type,result_type,customer_id,parent_only,include_prepaid,include_expired,include_lte,include_mikrotik,placeholder,multiple) {
        var placeholder			= (typeof placeholder 		!== 'undefined' && placeholder.length		> 0 ? placeholder : 'Select a data account');
        var result_type			= (typeof result_type		!== 'undefined' && result_type.length		> 0 ? result_type : 'radius');
        var multiple			= (typeof multiple			!== 'undefined' && multiple					> 0 ? true : false);

//        var parent_only		= (typeof parent_only !== 'undefined' && parent_only.length > 0 ? parent_only : 0);
 //       var include_prepaid	= (typeof include_prepaid !== 'undefined' && include_prepaid.length > 0 ? include_prepaid : 0);
        return $(selector).select2({
            'minimumResultsForSearch': 5,
            'placeholder' : placeholder,
            'allowClear' : true,
			'multiple': multiple,
            'ajax' : {
                'url' : datatill.url('radius/ajax_search'),
                'dataType' : 'JSON',
                'quietMillis' : 250,
                'data' : function(term,page) {
                    return {
                        'query'				: term,
                        'page'				: page,
                        'account_type'		: account_type,
                        'result_type'		: result_type,
                        'parent_only'		: parent_only,
                        'include_prepaid'	: include_prepaid,
                        'include_expired'	: include_expired,
                        'customer_id'		: customer_id,
                        'include_lte'		: (include_lte>0 ? 1 : 0),
                        'include_mikrotik'	: (include_mikrotik>0 ? 1 : 0)
                    };
                },
                'results' : function(data, page) {
                    var more = (page * 30) < data.total_rows;
                    return {
                        results : data.items,
                        'text': function(item) {
                            return item.title;
                        },
                        'more': more,
                    };
                },
                'cache' : true
            },
            'initSelection' : function(el,callback) {
                var id = $(el).val();

                    $.ajax({
                        'dataType' : 'JSON',
                        'data' : {
                            id : id
                        },
                        'url' : datatill.url('radius/ajax_get'),
                        'quietMillis' : 250,
                        'success' : function(data,xhr) {
	                        if (result_type == 'customer'){
	                            callback({
	                                id : data.id,
	                                text : (data.alias>'' ? data.alias+ ' ('+data.username+')' : data.username)+' - '+data.customer_title
	                            });
	                        } else {
	                            callback({
	                                id : data.id,
	                                text : (data.alias>'' ? data.alias+ ' ('+data.username+')' : data.username)
	                            });
	                        }
                        },
                        'error' : function(xhr) {

                        }

                    });
            }
        });
    };
      $.customerPortaSelect = function(selector,placeholder,list,prepaid) {
        var placeholder = (typeof placeholder	!== 'undefined' && placeholder.length > 0 ? placeholder : 'Select a customer');
        var prepaid		= (typeof prepaid		!== 'undefined' && prepaid > 0 ? 1 : 0);
        return $(selector).select2({
            'minimumResultsForSearch': 5,
            'placeholder' : placeholder,
            'allowClear' : true,
            'ajax' : {
                'url' : datatill.url('customers/ajax_porta_search'),
                'dataType' : 'JSON',
                'quietMillis' : 250,
                'data' : function(term,page) {
                    return {
                        'query'		: term,
                        'page'		: page,
                        'prepaid'	: (prepaid >0 ? 1 : 0),

                    };
                },
                'results' : function(data, page) {
                    var more = (page * 30) < data.total_rows;
                    return {
                        results : data.items,
                        'text': function(item) {
                            return item.title;
                        },
                        'more': more,
                    };
                },
                'cache' : true
            },
            'initSelection' : function(el,callback) {
                var id = $(el).val();

                    $.ajax({
                        'dataType' : 'JSON',
                        'data' : {
                            id : id
                        },
                        'url' : datatill.url('customers/ajax_get'),
                        'quietMillis' : 250,
                        'success' : function(data,xhr) {
                            callback({
                                id : data.id,
                                text : data.accounting_code+'-'+data.customer_title
                            });
                        },
                        'error' : function(xhr) {

                        }

                    });
            }
        });
    };
   

    $.toDecimal = function(number,negative,decimals,debug){

        decimals= isNaN(decimals) ? 2 : decimals < 0 ? 2 : decimals;
        number=$.trim(number+'');
        number=number.replace(/\s/g,'').replace(/,/g,'.').replace(/(\.)([0-9]*)((\.)([0-9]*))/g,'$1$2').replace(/[^\-\.0-9]/,'');
        //if(!negative) number=number.replace('-',0);

        if(number.indexOf('-')>0) number='0';
        number=+number;
        var a = Math.pow(10,decimals),b = Math.pow(10,decimals+1),c=b/a;

        return isNaN(number)? (+0).toFixed(decimals) : (Math.round(Math.round(number*b)/c)/a).toFixed(decimals);
    };
    /**
     * Calls a bootbox modal for you to load your form into via JSON AJAX Request
     * Requires: data.title for header & data.message
     * @param {[object]} args
     * @param args.url          Url to GET form and POST/PUT data
     * @param args.params       Extra params for GET/PUT/POST besides form
     * @param args.successCallback      Custom Callback for clicking the submit button. handling form etc
     * @param args.title        An Optional Title for your modal
     * @param args.message      A Custom Message for your modal
     * @usage var popup = new $.Crud({ url: datatill.url(), params: {} }).create()
     */
    $.Crud = function(args){

        var args = $.extend({
            url :'',
            params : {},
            onHidden : null,
            successCallback : null,
            title : '',
            message : ''
        },args);

        this.args = args;
        this.success = false;
        this.id = null;
        this.dialog = null;
    };

    $.Crud.prototype = {
        create : function(args){
            var args = $.extend(true,{},{
                buttons :
                {
                    success : {
                        label : 'Create',
                        className : 'btn btn-success btn-save',
                    }
                }
            },args);


            var form = this.fetchForm(args);
        },
        read : function(args) {
            // Todo
        },
        update : function(args){
            var args = $.extend(true,{},{
                buttons :
                {
                    success : {
                        label : 'Update',
                        className : 'btn btn-success btn-save',
                    }
                }
            },args);
            var form = this.fetchForm(args);
        },
        delete : function(args) {
            var self = this;

            var dialog = self.createDialog({
                    title : (!self.args.title.length ? 'Please confirm before proceeding.' : self.title),
                    message : (!self.args.message.length ? 'Are you sure you want to delete this item ?' : self.message),
                    buttons : {
                        success : {
                            label : 'Delete',
                            className : 'btn btn-danger btn-save',
                            callback : function(ev) {
                                var form = $(ev.delegateTarget).find('.modal-content > .modal-body');
                                $.post(self.args.url,self.args.params,function(data){
                                    if(typeof data.success !== 'undefined' && data.success > 0) {
                                        self.showSuccess(form,'Item successfully deleted');
                                        self.success = data.success;
                                        self.id = data.success;
                                        return true;
                                    } else {
                                        self.success = false;
                                        bootbox.alert('An Error has occured trying to delete this item');
                                    }
                                });
                                return false;
                            }
                        },
                        danger : {
                            label : 'Cancel',
                            className : 'btn btn-primary pull-left',
                            callback : function(ev) {
                                return true;
                            }
                        }
                    }
                });
        },
        fetchForm : function(args) {
            var self = this;
            if(typeof self.args.message !== 'undefined' && self.args.message.length) {
            var args = $.extend({
                    title : (typeof self.args.title !== 'undefined' && self.args.title.length > 0 ? self.args.title : data.title ),
                    message : self.args.message
                },args);
                return self.createDialog(args);
            }
            var xhr = $.ajax({
                url : self.args.url,
                data : self.args.params,
                method : 'GET',
                contentType : 'JSON',
                success : function(data,xhr) {
                    self.createDialog({
                        title : (typeof self.args.title !== 'undefined' && self.args.title.length > 0 ? self.args.title : data.title ),
                        message : data.message || '',
                        buttons : args.buttons
                    });
                }
            });
        },
        postForm : function(form){
	        $('.btn-save').button('loading');
            var self = this;
            var data = form.serializeArray();
                if(typeof self.args.params !== 'undefined' && self.args.params !== null) {
                    data.push(self.args.params);
                }
            var xhr = $.ajax({
                url : self.args.url,
                data : data,
                method : 'POST',
                dataType : 'JSON',
                success : function(data,xhr) {
					$('.btn-save').button('reset');
                    if($.isPlainObject(data.errors) && !$.isEmptyObject(data.errors)) {
                        self.showErrors(form,data.errors);
                        self.success = false;
                    } else if(data.success > 0) {
                        // TODO showSuccess
                        self.hideErrors(form);
                        var msg = (typeof data.message !== 'undefined' && data.message !== null ? data.message : 'Your action was successfull');
                        self.showSuccess(form,msg);
                        self.success = data.success;
                        self.id = data.success;
                    }
                },
                error : function(xhr) {
					$('.btn-save').button('reset');
                    bootbox.alert('A problem has occured with your request, Please try again later.',function(resp){
                        bootbox.hideAll();
                    });
                }
            });
        },
        createDialog : function(args) {
            var self = this;

            var args = $.extend(true,{},{
                title : '',
                message : '',
                buttons : {
                    success : {
                        label : 'Save',
                        className : 'btn btn-success btn-save',
                        callback : function(ev){
                            var form = $(ev.delegateTarget).find('form');
                            if(form.length > 0) {
                                self.hideErrors(form);
                                self.postForm(form);
                            }
                            return false;
                        }
                    },
                    danger : {
                        label : 'Close',
                        className : 'btn btn-danger pull-left',
                        callback : function(ev) {
                            return true;
                        }
                    }
                }
            },args);

            // https://github.com/select2/select2/issues/1436
            $.fn.modal.Constructor.prototype.enforceFocus = function() {};
            // Fetch our Dialog for display
            var dialog = bootbox.dialog(args);
            dialog.on('hidden.bs.modal',function(e){
                // Remove all old select2 dom content
                $(e.currentTarget).find('.select-2').select2('destroy');
                if(e.target == this) {

                    if($.isFunction(self.args.onHidden) && self.args.onHidden !== null) {
                        return self.args.onHidden(e,self);
                    }
                }
            });
            // Anything we should do once hidden ?
        },
        showSuccess : function(form,msg) {
			if (typeof do_background_tickets == 'function') { do_background_tickets();}
//             var alert = ['<div class="alert fade in alert-success form-success">',msg,' <br/>This Screen will automatically close in <b class="timer">3</b> seconds.</div>'].join('');
            this.success = true;
			form.closest('.modal').modal('hide');  // IRIRIR
/*
            form.prepend(alert);
            var timeout = 2000;
            var timer = setInterval(function(){
                form.find('.alert.form-success > .timer').text((timeout/1000));
                timeout = timeout-1000;
                if(timeout<0) {
                    clearInterval(timer);
                    timer=null;
                    form.closest('.modal').modal('hide');
                    return false;
                }
            },1000);
*/

        },
        showErrors : function(form,errors) {
            var rows = [],formErrors=form.find('.alert-danger.form-errors');
            $.each(errors,function(i,val){
                rows.push('<li>'+val+'</li>');
            });
            formErrors.find('ul').html(rows.join(''));
            formErrors.show(330);
            this.success = false;
            return false;
        },
        hideErrors : function(form) {
            var formErrors = form.find('.alert-danger.form-errors');
            formErrors.hide(330).find('ul').html('');
            this.success = true;
            return true;
        }
    };
    window.datatill = $.extend(window.datatill || {},{
        init:function(){
            $('body').off('click.datatillInit');
            $('body').on('click.datatillInit','[data-dismiss=popup-destroy]',function(e){
                e.preventDefault();
                var popup=$(this).closest('.popup'),api=popup.data('popup');
                if(api)api.destroy=true;
                popup.popup('hide');
            });
            $('body').on('click.datatillInit','[data-dismiss=popup]',function(e){
                e.preventDefault();
                $(this).closest('.popup').popup('hide');
            });
            $('body').on('click.datatillInit','[data-toggle=popup-fullscreen]',function(e){
                e.preventDefault();
                var popup=$(this).closest('.popup');
                popup.toggleClass('fullscreen');
                $(window).resize();
            });
        }
    });
})(jQuery);


if (typeof(bootbox) != "undefined") {
    bootbox.setDefaults({
        show: true,
        backdrop: true,
        closeButton: true,
        animate: false,
        className: "my-modal"
    });
}


if (typeof($.fn.dataTable) != "undefined") {
	if (typeof($.fn.dataTable.defaults) != "undefined") {
		$.extend($.fn.dataTable.defaults, {
		  "fnInitComplete": function(oSettings, json) {
			$(".dataTables_length  select").select2({
				minimumResultsForSearch: -1,
				dropdownAutoWidth : true
			});
		  },
		});
	}
	if (typeof($.fn.dataTableExt.oApi) != "undefined") {
		$.extend($.fn.dataTableExt.oApi, {
		  "fnMultiFilter": function(oSettings, oData) {
			    for ( var key in oData )
			    {
			        if ( oData.hasOwnProperty(key) )
			        {
			            for ( var i=0, iLen=oSettings.aoColumns.length ; i<iLen ; i++ )
			            {
			                if( oSettings.aoColumns[i].idx == key )
			                {
			                    oSettings.aoPreSearchCols[ i ].sSearch = oData[key];
			                    break;
			                }
			            }
			        }
			    }
			    this.oApi._fnReDraw( oSettings );
		  },
		});
	}
}

function initialize_gallery(){
	$('a.DTgallery').featherlightGallery({
		previousIcon: '&#9664;',     /* Code that is used as previous icon */
		nextIcon: '&#9654;',         /* Code that is used as next icon */
		galleryFadeIn: 100,          /* fadeIn speed when slide is loaded */
		galleryFadeOut: 300          /* fadeOut speed before slide is loaded */
	});
}

function b64Encode(str) {
    if (typeof str != 'string') throw new TypeError('Passed parameter is not a string');
    const output = str.replace(
        /[\u0080-\u07ff]/g,  // U+0080 - U+07FF => 2 bytes 110yyyyy, 10zzzzzz
        function(c) {
            var cc = c.charCodeAt(0);
            return String.fromCharCode(0xc0 | cc>>6, 0x80 | cc&0x3f); }
    ).replace(
        /[\u0800-\uffff]/g,  // U+0800 - U+FFFF => 3 bytes 1110xxxx, 10yyyyyy, 10zzzzzz
        function(c) {
            var cc = c.charCodeAt(0);
            return String.fromCharCode(0xe0 | cc>>12, 0x80 | cc>>6&0x3F, 0x80 | cc&0x3f); }
    );
    return btoa(output);
}

function b64Decode(str) {
    if (typeof str != 'string') throw new TypeError('Passed parameter is not a string');
    var base64regex = /^([0-9a-zA-Z+/]{4})*(([0-9a-zA-Z+/]{2}==)|([0-9a-zA-Z+/]{3}=))?$/;
    if (base64regex.test(str)) { str = atob(str); } // only does a decode if the string is a valid Base64 encoded
    // note: decode 3-byte chars first as decoded 2-byte strings could appear to be 3-byte char!
    const output = str.replace(
        /[\u00e0-\u00ef][\u0080-\u00bf][\u0080-\u00bf]/g,  // 3-byte chars
        function(c) {  // (note parentheses for precedence)
            var cc = ((c.charCodeAt(0)&0x0f)<<12) | ((c.charCodeAt(1)&0x3f)<<6) | ( c.charCodeAt(2)&0x3f);
            return String.fromCharCode(cc); }
    ).replace(
        /[\u00c0-\u00df][\u0080-\u00bf]/g,                 // 2-byte chars
        function(c) {  // (note parentheses for precedence)
            var cc = (c.charCodeAt(0)&0x1f)<<6 | c.charCodeAt(1)&0x3f;
            return String.fromCharCode(cc); }
    );
    return output;
}

var file_uploads_in_progress = [] ;
function get_new_upload_id(){
    var upload_id = Math.random();
    return upload_id;
}

function begin_upload(upload_id) {

    var upload = {
        id : upload_id,
        complete : false
    };
    file_uploads_in_progress.push(upload);
    return upload_id;
}

function complete_upload(upload_id) {
    var len = file_uploads_in_progress.length;
    for (var i=0; i<len;i++){
        if (file_uploads_in_progress[i].id == upload_id){
            file_uploads_in_progress[i].complete = true;
            break;
        }
    }
}

function uploads_complete(){
    var len = file_uploads_in_progress.length;
    for (var i=0; i<len;i++){
        if (file_uploads_in_progress[i].complete == false){
            return false;
        }
    }
    return true;
}


// MAR-19
function check_refer_a_friend_item(message, selector){
    $(selector).hide();
    var theOption = [];
    $('#table_lines tr').each(function(i){
        if( $(this).css('display') !== 'none') {
            var id_split = $(this).attr('id').split('_');
            theOption.push($('#item_type_' + id_split[1] + ' option:selected').val());
        }
    });
    if ( theOption.indexOf('BANDWIDTH') == -1 ) {
        $(selector).html(message).show();
        return;
    }
    return 1;
}
 
function generate_label(label_list_color,label_list_name){
	return "<button type='button' class='label label-default nopointevent' style='border-color:"+label_list_color+"; margin-bottom:2px; border-left: 15px solid "+label_list_color+"; '>"+label_list_name+"</button> ";
}
 
// Format a number with thousand markers and fixed decimals
function formatNumber(number, dec_f, dec_m, thou_m) {
  var dec_f = isNaN(dec_f = Math.abs(dec_f)) ? 2 : dec_f,
    dec_m = dec_m == undefined ? "." : dec_m,
    thou_m = thou_m == undefined ? "," : thou_m,
    neg = number < 0 ? "-" : "",
    actual = String(parseInt(number = Math.abs(Number(number) || 0).toFixed(dec_f))),
    split = (split = actual.length) > 3 ? split % 3 : 0;

  return neg + (split ? actual.substr(0, split) + thou_m : "") + 
  actual.substr(split).replace(/(\d{3})(?=\d)/g, "$1" + thou_m) + 
  (dec_f ? dec_m + Math.abs(number - actual).toFixed(dec_f).slice(2) : "");
};

// Pass a decimal representation to have it converted to D:HH:MM:SS
function convertNumberToTimeDHMS(value) {
    var days = Math.floor(value/1440);
    var sub_days = Boolean(days) ? value - (1440*days) : value;
    var show_hours = Boolean(days) ? 1 : 0;
    var hours = Math.floor(sub_days/60);
    var hour_ = (String(hours).length == 1) ? '0'+hours : hours;
    var sub_hour = Boolean(hours) ? sub_days - (60*hours) : sub_days;
    var minutes = Math.floor(sub_hour);
    var seconds = Math.round((sub_hour % 1)*100)/100;
    var min = ((String(minutes).length == 1) ? '0'+minutes : minutes)
    var sec_ = parseInt(seconds*60);
    var sec = (String(sec_).length == 1) ? '0'+sec_ : sec_;
    return ((Boolean(days)) ? days + ':' : '' ) + ((Boolean(hours) || Boolean(show_hours)) ? hour_ + ':' : '' ) + min + ':' + sec;
}

// Pass a decimal representation to have it converted to MM:SS
function convertNumberToTimeMS(value) {
    let minutes = Math.floor(value / 60);
    let seconds = Math.round((value % 60) * 100) / 100;
    let min = ((String(minutes).length === 1) ? '0' + minutes : minutes);
    let sec_ = parseInt(seconds);
    let sec = (String(sec_).length == 1) ? '0' + sec_ : sec_;
    return min + ':' + sec;
}

/**
 *  `DTSUPPORT ONLY` will be sections in the system
 *  that allow only the namesake user additional functionality;
 *  debugging, insights, raw data, testing ...
 */
function dtsupportInsertMarker() {
    $(".dtsupport_only").each(function(){
        $(this).before("<hr>").prepend($('<div>').text("DTSUPPORT ONLY"));
    });
}

var customjs_version=15;
