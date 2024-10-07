/* Project specific Javascript goes here. */

/*
Formatting hack to get around crispy-forms unfortunate hardcoding
in helpers.FormHelper:

    if template_pack == 'bootstrap4':
        grid_colum_matcher = re.compile('\w*col-(xs|sm|md|lg|xl)-\d+\w*')
        using_grid_layout = (grid_colum_matcher.match(self.label_class) or
                             grid_colum_matcher.match(self.field_class))
        if using_grid_layout:
            items['using_grid_layout'] = True

Issues with the above approach:

1. Fragile: Assumes Bootstrap 4's API doesn't change (it does)
2. Unforgiving: Doesn't allow for any variation in template design
3. Really Unforgiving: No way to override this behavior
4. Undocumented: No mention in the documentation, or it's too hard for me to find
*/
$('.form-group').removeClass('row');

// Animations init
new WOW().init();

// init tooltips
$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});


// setup ajax
function getCookie(name) {
    var cookieValues = [];
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValues.push(decodeURIComponent(cookie.substring(name.length + 1)));
            }
        }
        var cookieValue = "";
        for (var i = 0; i < cookieValues.length; i++){
            if (cookieValues[i].length > cookieValue.length) {
                cookieValue = cookieValues[i];
            }
        }
    }
    return cookieValue;
}
var csrftoken = getCookie('csrftoken');
function csrfSafeMethod(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}
$.ajaxSetup({beforeSend: function(xhr, settings) {
        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    }
});

// make AJAX call
function makeAjaxCall(type, url, data, callback, error=undefined, timeout=5000, timeoutCallback=undefined) {
  $.ajax({
    url: url,
    method: type,
    data: data,
    success: callback,
    error: function(reason) {
      // add an error notification
    },
    timeout: timeout,
  });
}
