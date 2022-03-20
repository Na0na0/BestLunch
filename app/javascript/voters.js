import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

$(document).ready(function() {
    $('#voters').on('cocoon:before-remove', function(event, insertedItem) {
        if ($(document).find('.voter-nested-fields').length == 2) {
            event.preventDefault();
        }
    });
});