/*
 Date:02-09-2015
 Author:Vijayan PP
 */


$(document).ready(function()
{
  $("div.preloader").delay(299).fadeOut("slow");

  }
);

(function($) {

    var App = {

      /**
      * Init Function
      */
      init: function() {

          App.Carousel();
          App.Scroll();
          App.prettyphoto();
          App.scrollingTo();

      },
      Carousel: function() {
          $('#owl-gallery').owlCarousel({
              items : 5,
              itemsDesktop : [1199,5],
              itemsDesktopSmall : [980,5],
              itemsTablet: [768,5],
              itemsTabletSmall: [550,2],
              itemsMobile : [480,2],
          });
      },
      prettyphoto:function()
      {
        jQuery('#gallery a').attr('rel', 'prettyPhoto');
        jQuery("a[rel^='prettyPhoto']").prettyPhoto();

      },
      scrollingTo:function()
      {
        $(".menu li a").click(function(event){
          if ($(event.target).attr('href')[0] == '#') {
            $("body").scrollTo($(event.target).attr('href'), 600);
          }
        });

      },
      Scroll:function()
      {
          window.scrollReveal = new scrollReveal();
      }
    }

    $(function() {
      App.init();
    });
})(jQuery);
