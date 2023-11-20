$(document).ready(function() {
    console.log("hello123 "+mobileAndTabletCheck());
    if (mobileAndTabletCheck()) {
      
      
    } else {
      $('.info-tooltip-download').hide();
    }
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
         console.log('step');
        $.ajax({
            type: 'POST',
            url: '/gcookie/',
            dataType: 'json',
        
            success: function (data) {
                // deleteMarkers();
                console.log(data.context);
                showLargeMap(data.context,'yes');
            }
        });
        
   
    });

    $(".map-cta-reset").click(function (elt) {
         console.log('home');

        showLargeMap('home','no');
    });
    function showLargeMap(context, showInfoWindow) {
        let modal = $('.modal-map');
        modal.addClass("is-active");
        var map = window.globalMap;
        var mapNode = map.getDiv();

        
        $('#map').append(mapNode);
        map.setOptions(window.mapOptions);
        google.maps.event.trigger(map, "resize");
        // deleteMarkers();
        // placeMarkersOnMap(map,context);
        deleteMarkers();
        contextBasedMarkersOnMap(context, showInfoWindow);
    }
    //Check click on close cross on modal :
    $(".modal-close, .modal-background").click(function (elt) {
        let modal = $(elt.target).parent();
        // console.log('close app');
        var map = window.globalMap;
        var mapNode = map.getDiv();
        $('#mapframe').append(mapNode);
        map.setOptions(window.mapOptions);
        google.maps.event.trigger(map, "resize");
        $.ajax({
            type: 'POST',
            url: '/gcookie/',
            dataType: 'json',
        
            success: function (data) {
                // deleteMarkers();
                deleteMarkers();
                contextBasedMarkersOnMap(data.context);
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
    if (isIos() && !isInStandaloneMode()) {
            
          $('#pwa_link').hide();  
    }
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
        if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
            //mobile one

          if (navigator.share) {

            navigator.share(
                {
                  title: "Chatou Auto",
                  url: window.location.href
                }
              );

          } else {

            $('#st-2').attr('style', 'bottom:0 !important;width:100% !important;');
            setTimeout(function() {
                $('#st-2').attr('style', 'bottom:-48px !important;width:100% !important;');
            }, 7000);

          }

        }
        else {
            //left one
            $('#st-2.st-left').attr('style', 'left:0 !important;width: 96px !important;');
            setTimeout(function() {
                $('#st-2.st-left').attr('style', 'left: -48px !important;width: 96px !important;');
            }, 7000);
        }
    });

});

let deferredPrompt;

window.addEventListener('beforeinstallprompt', (e) => {
  // Prevent the mini-infobar from appearing on mobile
  e.preventDefault();
  // Stash the event so it can be triggered later.
  deferredPrompt = e;
  // Update UI notify the user they can install the PWA
  showInstallPromotion();
});
// Detects if device is on iOS 
const isIos = () => {
    const userAgent = window.navigator.userAgent.toLowerCase();
    return /iphone|ipad|ipod/.test( userAgent );
  }
// Detects if device is in standalone mode
const isInStandaloneMode = () => ('standalone' in window.navigator) && (window.navigator.standalone);
window.mobileAndTabletCheck = function() {
    let check = false;
    (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
    return check;
  };
function downloadApp() {

        if (isIos() && !isInStandaloneMode()) {
            this.setState({ showInstallMessage: true });
            
        } else {
            // Show the install prompt
             deferredPrompt.prompt();
             // Wait for the user to respond to the prompt
            deferredPrompt.userChoice.then((choiceResult) => {
                if (choiceResult.outcome === 'accepted') {
                console.log('User accepted the install prompt');
                } else {
                console.log('User dismissed the install prompt');
                }
            });
        }    
      
}