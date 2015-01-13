(function () {
    var update_handle_track_pos;
    update_handle_track_pos = function (slider, ui_handle_pos) {
        var handle_track_xoffset, slider_range_inverse_width;
        handle_track_xoffset = -(ui_handle_pos / 100 * slider.clientWidth);
        $(slider).find('.handle-track').css('left', handle_track_xoffset);
        slider_range_inverse_width = 100 - ui_handle_pos + '%';
        return $(slider).find('.slider-range-inverse').css('width', slider_range_inverse_width);
    };
    $('.js-slider').slider({
        range: 'min',
        max: 10,
        value: 5,
        create: function (event, ui) {
            var slider;
            slider = $(event.target);
            slider.find('.ui-slider-handle').append('<span class="dot"><span class="handle-track"></span></span>');
            slider.prepend('<div class="slider-range-inverse"></div>');
            slider.find('.handle-track').css('width', event.target.clientWidth);
            return update_handle_track_pos(event.target, $(this).slider('value'));
        },
        slide: function (event, ui) {
            return update_handle_track_pos(event.target, ui.value);
        }
    });
}.call(this));