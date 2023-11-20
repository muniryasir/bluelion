$(document).ready(function() {

    // Check for click events on the navbar burger icon
    $(".navbar-burger").click(function(elt) {
        let burger = $(elt.currentTarget);
        let menu = $('#' + burger.attr('data-target'));
        let arrow = $('.back-arrow');
        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        if (!arrow.hasClass('is-not-active')){
            arrow.toggleClass("is-active");
        }
        burger.toggleClass("is-active");
        menu.toggleClass("is-active");

    });

    //Check for click event on the maps icon or aside image
    $(".map-cta").click(function (elt) {
        // console.log('step');
        showLargeMap('step');
   
    });

    $(".map-cta-reset").click(function (elt) {
        //console.log('home');

        showLargeMap('home');
    });
    function showLargeMap(context) {
        let modal = $('.modal-map');
        modal.addClass("is-active");
        var map = window.globalMap;
        var mapNode = map.getDiv();

        
        $('#map').append(mapNode);
        map.setOptions(window.mapOptions);
        google.maps.event.trigger(map, "resize");
        // deleteMarkers();
        // placeMarkersOnMap(map,context);
    }
    //Check click on close cross on modal :
    $(".modal-close, .modal-background").click(function (elt) {
        let modal = $(elt.target).parent();
        
        var map = window.globalMap;
        var mapNode = map.getDiv();
        $('#mapframe').append(mapNode);
        map.setOptions(window.mapOptions);
        google.maps.event.trigger(map, "resize");
        $.ajax({
            type: 'POST',
            url: '/chatou_auto/gcookie/',
            dataType: 'json',
        
            success: function (data) {
                // deleteMarkers();
                // placeMarkersOnMap(map,data.context);
            }
        });
        modal.removeClass("is-active");
    });

    //Trigger the gallery pic that is linked by the data-target attribute
    $('.is-gallery-trigger').click(function (elt) {

        target = $(elt.currentTarget).attr("data-target");
        $("#" + target).click();
    });

    //Open the citation modal
    $('.cite-cta').click(function (elt) {
        target = $(elt.currentTarget).attr("data-target");
        $("#" + target).addClass("is-active");
    })
});
//Function that return to the previous page (Etape −> Parcours -> Home <- Intro/Histo/Author)
function returnToFunction(page){
    //Prevent back if menu is open
    if ($('.back-arrow').hasClass('is-active')){
        window.location.replace(page);
    }
}


//Edited by Shayan
$(document).ready(function(){
    //hide on click/touch body
    $(document).on("click touchstart", 'html, body', function(e) {
        var container = $("#navbarMenu");
        var containerr = $(".navbar-burger");
        if (!container.is(e.target) && container.has(e.target).length === 0 && !containerr.is(e.target) && containerr.has(e.target).length === 0) {
            //
            let arrow = $('.back-arrow');
            if (!arrow.hasClass('is-not-active')){
                arrow.toggleClass("is-active");
            }
            containerr.removeClass("is-active");
            container.removeClass("is-active");
            //
        }
    });

    //hide on esc
    $( document ).on( 'keydown', function ( e ) {
        if ( e.keyCode === 27 ) { // ESC
            
            //
            let arrow = $('.back-arrow');
            if (!arrow.hasClass('is-not-active')){
                arrow.toggleClass("is-active");
            }
            containerr.removeClass("is-active");
            container.removeClass("is-active");
            //

        }
    });

    //share this click
    $(".share-this").click(function(){
        $('#st-2').attr('style', 'bottom:0 !important;width:100% !important;');
        setTimeout(function() {
            $('#st-2').attr('style', 'bottom:-48px !important;width:100% !important;');
        }, 7000);
    });

});