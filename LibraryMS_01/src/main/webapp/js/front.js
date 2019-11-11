$(function () {


    // ------------------------------------------------------ //
    // Masonary
    // ------------------------------------------------------ //


    $('.img-fluid').imagesLoaded(function() {
        $('.grid').masonry({
            itemSelector: '.grid-item',
            columnWidth: 50,
/*            isResizableL:false*/
        });

    });


        // ------------------------------------------------------ //
    //  Off-canvas menu
     // ------------------------------------------------------ //

     $(document).ready(function () {
         $('[data-toggle="offcanvas"]').click(function () {
             $('.row-offcanvas').toggleClass('active')
         });
         $('[data-toggle="offcanvas-right"]').click(function () {
             $('.row-offcanvasright').toggleClass('active')
         });
     });


        $("#showbtn").click(function () {
            $(this).toggleClass("j1")
            $(this).toggleClass("j2")
        })

    // ------------------------------------------------------ //
    // Main slider
    // ------------------------------------------------------ //
    $('#main-slider').owlCarousel({
        items: 1,
        nav: false,
        dots: true,
        autoplay: true,
        autoplayHoverPause: true
    });


    // ------------------------------------------------------ //
    // For demo purposes, can be deleted
    // ------------------------------------------------------ //

    var stylesheet = $('link#theme-stylesheet');
    $( "<link id='new-stylesheet' rel='stylesheet'>" ).insertAfter(stylesheet);
    var alternateColour = $('link#new-stylesheet');

    if ($.cookie("theme_csspath")) {
        alternateColour.attr("href", $.cookie("theme_csspath"));
    }

    $("#colour").change(function () {

        if ($(this).val() !== '') {

            var theme_csspath = 'css/style.' + $(this).val() + '.css';

            alternateColour.attr("href", theme_csspath);

            $.cookie("theme_csspath", theme_csspath, { expires: 365, path: document.URL.substr(0, document.URL.lastIndexOf('/')) });

        }

        return false;
    });

});
