import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

$(document).ready(function() {
    $('#proposals').on('cocoon:before-remove', function(event, insertedItem) {
        if ($(document).find('.nested-fields').length == 2) {
            event.preventDefault();
        }
    });
});