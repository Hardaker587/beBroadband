/**
 * Created by jd on 2017/03/04.
 */


function set_badges() {
    var sum = 0;
    var nan_counter = 0;
    $('.badge').each(function(i, obj) {
        var current_value = parseInt($.trim($(this).text()));
        if (isNaN(current_value)){
            nan_counter ++;
            if (nan_counter > 0)
            {
                var temp_label = nan_counter - 1;
                var search_text = '#b'+temp_label;
                $(search_text).text(sum);
            }
            sum = 0;
        }
        else{
            sum = sum+current_value;
        }
    });
}
function refresh_badges(){
    $('.badge').each(function(i, obj) {
        if ( typeof $(this).attr("data-internalid") != 'undefined' )
        {
            $.ajax({
                type: "POST",
                url: "/workflow/get_badge_count",
                data:{
                    status  			: $(this).attr("data-internalid"),
                    user_id             : current_user,
                },
                success: function(badge_count){
                    $(obj).text(badge_count.trim());
                }
            });
        }
    });
    set_badges();
}

$(document).ready(function() {
    $(document).on("click", '.panel-item', function(){
        $('.panel-item').removeClass('active');
        $(this).addClass('active');
    });
    set_badges();
    $(".collapse").on('hidden.bs.collapse', function (e) {
        if ($(this).is(e.target)) {
            var header_item = $(this).prev('.panel-item').find('.fa-caret-down');
            header_item.removeClass('fa-caret-down').addClass('fa-caret-right');
            var badge_item = $(this).prev('.panel-item').find('.badge');
            badge_item.css("display", "unset");
        }
    });
    $(".collapse").on('show.bs.collapse', function (e) {
        if ($(this).is(e.target)) {
            var header_item = $(this).prev('.panel-item').find('.fa-caret-right');
            header_item.removeClass('fa-caret-right').addClass('fa-caret-down');
            var badge_item = $(this).prev('.panel-item').find('.badge');
            badge_item.css("display", "none");
        }
    });
});
