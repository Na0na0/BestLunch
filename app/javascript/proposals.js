import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

document.addEventListener("turbo:load", function(event) {
    $('#proposals').on('cocoon:before-remove', function(event, insertedItem) {
        if ($(document).find('.proposal-nested-fields').length == 2) {
            event.preventDefault();
        }
    });
});