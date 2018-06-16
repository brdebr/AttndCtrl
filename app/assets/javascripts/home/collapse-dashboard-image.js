var initializeCollapse = function(){
    $('.dashboard-image').on('click', function () {
        $(this).slideUp().queue(function () {
            $('.dashboard-links').slideDown();
        })
    })
};
$(document).on('turbolinks:load', initializeCollapse);