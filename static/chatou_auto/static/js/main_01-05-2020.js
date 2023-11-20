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
        deleteMarkers();
        placeMarkersOnMap(map,context);
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
                deleteMarkers();
                placeMarkersOnMap(map,data.context);
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

