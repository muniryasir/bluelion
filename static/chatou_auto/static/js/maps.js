function initMap() {
    let map = new google.maps.Map(document.getElementById('map'), {
        // zoom: 14,
        // center: {lat: 48.8954021, lng: 2.1484749}
    });

    // let image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
    // let beachMarker = new google.maps.Marker({
    //     position: {lat: 48.8954021, lng: 2.1484749},
    //     map: map,
    //     icon: image
    // });
}
var stepMarkers = [];
// var stepMarkersRed = [];
var stepinfowindows = [];
var globalContext;
var globalMap;
var slat;
var slongt;
var MarkerData;
var userPositionMarker;
var showInfoWindow;
var mapError;
function googleMapMethod() {
  var noPoi = [
    {
        featureType: "poi.business",
        stylers: [
          { visibility: "off" }
        ]   
      },
      {
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#ebe3cd"
          }
        ]
      },
      {
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#523735"
          }
        ]
      },
      {
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#f5f1e6"
          }
        ]
      },
      {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "color": "#c9b2a6"
          }
        ]
      },
      {
        "featureType": "administrative.land_parcel",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "color": "#dcd2be"
          }
        ]
      },
      {
        "featureType": "administrative.land_parcel",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#ae9e90"
          }
        ]
      },
      {
        "featureType": "landscape.natural",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#dfd2ae"
          }
        ]
      },
      {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#dfd2ae"
          }
        ]
      },
      {
        "featureType": "poi",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#93817c"
          }
        ]
      },
      {
        "featureType": "poi.attraction",
        "elementType": "labels",
        "stylers": [
          {
            "weight": 0.5
          }
        ]
      },
      {
        "featureType": "poi.business",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.business",
        "elementType": "geometry",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.medical",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
          {
            "color": "#a5b076"
          }
        ]
      },
      {
        "featureType": "poi.park",
        "elementType": "labels.text",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.park",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#447530"
          }
        ]
      },
      {
        "featureType": "poi.school",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.sports_complex",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#f5f1e6"
          }
        ]
      },
      {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#fdfcf8"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#f8c967"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "color": "#e9bc62"
          }
        ]
      },
      {
        "featureType": "road.highway.controlled_access",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#e98d58"
          }
        ]
      },
      {
        "featureType": "road.highway.controlled_access",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "color": "#db8555"
          }
        ]
      },
      {
        "featureType": "road.local",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#806b63"
          }
        ]
      },
      {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#dfd2ae"
          }
        ]
      },
      {
        "featureType": "transit.line",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#8f7d77"
          }
        ]
      },
      {
        "featureType": "transit.line",
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#ebe3cd"
          }
        ]
      },
      {
        "featureType": "transit.station",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#dfd2ae"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
          {
            "color": "#b9d3c2"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#92998d"
          }
        ]
      } 
    ];
//   var noPOi = [
//       {
//     featureType: "poi.accounting",
//     stylers: [
//       {
//         visibility: "off"
//       }
//     ]
//   }
// ];
  // var locstep1 =  new google.maps.LatLng(48.889756,2.163500);
    var mapProp= {
    // center:locstep1,
    disableDefaultUI: true,
    // zoom:15,
  };

  var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  map.setOptions({styles: noPoi});
  window.globalMap = map;
  window.mapOptions = mapProp;
  $.ajax({
    type: 'POST',
    url: '/gcookie/',
    dataType: 'json',

    success: function (data) {
        // deleteMarkers();
        placeMarkersOnMap(map,data.context);
        globalMap = map;
        
        // getMapCookie();
        if(isIos()) {
          showUserPosition('set');
          var fiveMinutes =  5*60;
          startTimer(fiveMinutes);
            } else {
          AndroidTracking();
        }  
    }
  });
  // placeMarkersOnMap(map);
  
}


function adjustMap(map) {
  $.ajax({
		type: 'POST',
		url: '/gmapcontrols/',
    dataType: 'json',
    success: function (data) {
      
      // console.log(data.zoom);
      // console.log(data.page);
      // console.log(data.level);
      // console.log(stepMarkers.length)
      
      globalMap.setZoom(parseFloat(data.zoom));
      if(data.level=='home') {
        var locstep1 =  new google.maps.LatLng(48.889756,2.163500);
        globalMap.setCenter(locstep1);
      } else {

        let labelIndex = searchMarkers(globalMap,data.page);
        console.log("globalContext " +showInfoWindow);
        let marker = stepMarkers[labelIndex];
        globalMap.setCenter(marker.getPosition());
        
        if(data.level == 'step' && showInfoWindow=='yes') {
          openInfoWindow(globalMap,marker,labelIndex);

        }
      }
    }
  });
}

function openInfoWindow(map, marker, labelIndex) {
  let infowindow = stepinfowindows[labelIndex];
  infowindow.open(map, marker);
}

function placeMarkersOnMap(map, context='none') {
// console.log(context);
globalContext =context
  $.ajax({
		type: 'POST',
		url: '/mapdata/',
    dataType: 'json',
    data: {'context':context},
		success: function (data) {
      MarkerData = data;

      contextBasedMarkersOnMap()
      
       
      
		}
    });
}
function AndroidTracking() {
	showUserPosition('set');
	startWatch();
}


    
function startWatch() { 
	
	// if ( !geoWatch ) { 
	
		if ( "geolocation" in navigator && "watchPosition" in navigator.geolocation ) { 

			geoWatch = navigator.geolocation.watchPosition( setCurrentPosition, positionError, { 
							 maximumAge:0, timeout:15e3, enableHighAccuracy: true 
						} ); 

		} 
	// }
   }

   function setCurrentPosition( position ) { 
    
        console.log("watch on");
        userPositionMarker.setPosition( new google.maps.LatLng( position.coords.latitude, position.coords.longitude ) );
    }

  function positionError( error ) { 
    
        switch ( error.code ) { 
            case error.PERMISSION_DENIED: 
                
                console.error( "User denied the request for Geolocation." ); 
                break; 
    
            case error.POSITION_UNAVAILABLE: 
    
                console.error( "Location information is unavailable." ); 
                break; 
    
            case error.TIMEOUT: 
    
                console.error( "The request to get user location timed out." ); 
                break; 
    
            case error.UNKNOWN_ERROR: 
    
                console.error( "An unknown error occurred." ); 
                break; 
        }
    }

function startTimer(duration) {
  var timer = duration, minutes, seconds;
  
  setInterval(function () {
      minutes = parseInt(timer / 60, 10);
      seconds = parseInt(timer % 60, 10);

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;

      // display.textContent = minutes + ":" + seconds;
      showUserPosition('move');
      if (--timer < 0) {
          timer = duration;
      }
  }, 1000);
}
function contextBasedMarkersOnMap(context='none',isToOpenInfoWindow) {
  showInfoWindow = isToOpenInfoWindow;
  if(context=='none') {
    
  } else {
    globalContext = context;
  }

  for(var color in MarkerData) {

    // console.log(color);
    if(globalContext=='home') {}
    else if(globalContext!=color) {
      continue;
    }
    
   
    if(MarkerData[color] instanceof Object) {

        itinerary = MarkerData[color];
        for(var step in itinerary) {
          if(itinerary[step] instanceof Object) {
            (function () {
            // console.log(step)
            // console.log(itinerary[step]);
           
            markersOnMap(step, color)

          })();
          }
        }

    } 
      
  }
  adjustMap(map); 
}
  function markersOnMap(step, color) {
    step_details = itinerary[step];

    var pin_color = color
    var label = step_details["page_title"];
    var image = "/media/"+step_details["image"];
    var lat = step_details["lat"];
    var longt = step_details["longt"];
    var step_link = step_details["page_link"];
    var page_order = step_details["page_order"];

   

    var marker_image;
    var text_color;
    if (pin_color == "BLUE") {
      text_color = "#2D94D2";
      marker_image = staticAddress+'chatou_auto/static/images/maps/markers/Pictos_Epingle_Map_blue.png';
      arrow_link = staticAddress+'chatou_auto/static/images/maps/infowindow/arrow_link_blue.svg';
    } else if (pin_color == "RED") {
      text_color = "#C90C5D"
      marker_image = staticAddress+'chatou_auto/static/images/maps/markers/Pictos_Epingle_Map_red.png';
      arrow_link = staticAddress+'chatou_auto/static/images/maps/infowindow/arrow_link_red.svg';
    }

    var directions_method = `openNativeMap(${lat},${longt})`;
    var locstep =  new google.maps.LatLng(lat,longt);

    var content_layout =`<div class="main_div">
    <div class="image" style="background:url(${image}) no-repeat;background-size:cover;background-position:center;float:left;width:35%;height:60px;"></div>
    <div class="title" style="color:${text_color};text-transform:uppercase;float:left;width:47%;height:60px;display:flex;flex-wrap:wrap;justify-content:center;align-items:center;text-align:center;font-size:13px;overflow-x:hidden;padding:0 5px;font-weight:bold;margin:0;">
    <a href="/${step_link}"><span style="color:${text_color};" >${label.toUpperCase()}</span></a>
    </div>
    <div class="map_nav" style="float:right;width:16%;height:50px;line-height:60px;display: flex;flex-wrap: wrap;justify-content: center;text-align: center;align-items: center;">
      <a href="javascript:;" onclick="${directions_method}" style="display: inline-block;margin-top:10px;">
        <img src="${arrow_link}" style="height:20px;" alt="" />
      </a>
    </div>
    <div style="clear:both;"></div>
  </div>`;
  var infowindow = new google.maps.InfoWindow({
    
    content:content_layout
  });

  stepinfowindows.push(infowindow);
  // alert(data.winning_combo);
  var markerstep = new google.maps.Marker({
  position: locstep,
  icon:{
    url:marker_image,
    labelOrigin: new google.maps.Point(31,22)
  },
  label: {
    text: JSON.stringify(page_order),
    color: text_color,
    fontSize: "20px",
    fontWeight: "bold",
    font: "Source Sans Bold"
  }
});

markerstep.setMap(globalMap);

stepMarkers.push(markerstep);


    markerstep.addListener('click', function() {
      
      for (var i=0; i<stepMarkers.length; i++) {
       
        if (stepMarkers[i].getPosition().equals(markerstep.getPosition())) { 

          stepinfowindows[i].open(map,markerstep);
          /* start Dynamic css code for info window */
          // console.log(stepinfowindows[i].attr("gm-style-iw.gm-style-iw-c"));
          /* End Dynamic css code for info window */
          google.maps.event.addListener(stepinfowindows[i], 'domready', function() {
            var l = $('.gm-style-iw.gm-style-iw-c');
            var m = $('.gm-style .gm-style-iw-t::after');
            // console.log(l);
            var img;
            if (pin_color == "BLUE") {
              img = staticAddress+'chatou_auto/static/images/maps/infowindow/home_downarrow_blue.png';
              l.css({
                'border': '5px solid #2D94D2',
                // 'background':`url(${img})  no-repeat`,
                // 'box-shadow': 'unset !important',
                // 'content': '"" !important',
                // 'height': '28px !important',
                // 'background-size': 'contain',
                // 'background-position': 'center',
                // 'background-size':'cover',
                // 'left': '0 !important',
                // 'position': 'absolute !important',
                // 'margin-top': '46px !important',
                // 'top': '0 !important',
                // 'width': '30px !important',
                // 'transform': 'translate(-80%,160%) rotate(0deg) !important',
              });
              // m.css({'background':`url(${img}) no-repeat`,});
              $('head').append('<style>.gm-style .gm-style-iw-t::after{background:url('+img+') no-repeat !important;background-size:100% 100% !important;top: 2px !important;}</style>');
            } else {
              img = staticAddress+'chatou_auto/static/images/maps/infowindow/home_downarrow_red.png';
              l.css({
                'border': '5px solid #C90C5D',
                // 'background':`url(${img})  no-repeat`,
            });
              // m.css({'background':`url(${img}) no-repeat`,});
              $('head').append('<style>.gm-style .gm-style-iw-t::after{background:url('+img+') no-repeat !important;background-size:100% 100% !important;top: 2px !important;}</style>');
            }
            
        });


        }
        else {
          stepinfowindows[i].close();
        }
        
    }
    }); 

     /*** Edit by Shayan ***/ 
  google.maps.event.addListener(map, "click", function(event) {
    for (var i=0;i<stepMarkers.length;i++) {
       stepinfowindows[i].close();
    }
  });
  }

 



function deleteMarkers() {
  setMapOnAll(null);
  stepMarkers = [];
  stepinfowindows = [];
}

function setMapOnAll(map) {
  for (var i = 0; i < stepMarkers.length; i++) {
    stepMarkers[i].setMap(map);
  }
}

function searchMarkers(map, label) {
  var page_position= label.split(',');
  
  // var page_position =  new google.maps.LatLng(parseFloat(label[0]),parseFloat(label[1]));
  for (var i = 0; i < stepMarkers.length; i++) {
  //  console.log(stepMarkers[i].getPosition().lat()+"---"+stepMarkers[i].getPosition().lng());
    // console.log( parseFloat(page_position[0]));
    // console.log( parseFloat(page_position[1]));
    // console.log((stepMarkers[i].getPosition().lat() == parseFloat(page_position[0])) && (stepMarkers[i].getPosition().lng() == parseFloat(page_position[1])));
    if( (stepMarkers[i].getPosition().lat() == parseFloat(page_position[0])) && (stepMarkers[i].getPosition().lng() == parseFloat(page_position[1])) )
      {
        return i;
      }
  }
}

function showUserPosition(mode) {
  console.log('1');
  map = globalMap;
  // infoWindow = new google.maps.InfoWindow;
        var globale_marker_image = staticAddress+'commune_de_paris/static/images/maps/markers/PCT_Picto_Geoloc_51px.png';
        // Try HTML5 geolocation.
        if (navigator.geolocation) {

          navigator.geolocation.getCurrentPosition( function(position) {
            setPermissionCookie("YES");
            slat = position.coords.latitude;
            slongt = position.coords.longitude;
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            // userPositionMarker.setMap(null);
            if (mode == 'set' ) {
              userPositionMarker = new google.maps.Marker({
                position: pos,
                icon:{
                  url:globale_marker_image,
                  
                }
                
              });
              userPositionMarker.setMap(map);
            } else if (mode == 'move' || mode == 'set2') {
              
              userPositionMarker.setPosition( new google.maps.LatLng( position.coords.latitude, position.coords.longitude ) );
            }
            if (mode=='set2') {
              map.setCenter(pos);
            }
            
          }, function(error) {
            // handleLocationError(true, infoWindow, map.getCenter());
            var x;
            switch(error.code) {
              case error.PERMISSION_DENIED:
                x = "User denied the request for Geolocation."
                setPermissionCookie("NO");
                break;
              case error.POSITION_UNAVAILABLE:
                x = "Location information is unavailable."
                break;
              case error.TIMEOUT:
                x = "The request to get user location timed out."
                break;
              case error.UNKNOWN_ERROR:
                x = "An unknown error occurred."
                break;
            }
            // console.log(JSON.stringify(err));
            // window.alert(x);
            mapError = x;
            getMapCookie();
          },
          {maximumAge:60, timeout:500, enableHighAccuracy: true}
          );
        } else {
          // Browser doesn't support Geolocation
          // handleLocationError(false, infoWindow, map.getCenter());hjhj
          // window.alert("Browser doesn't support Geolocation");
          mapError = "Browser doesn't support Geolocation";
          getMapCookie();
        }
        // showUserPosition('move');
}


// function handleLocationError(browserHasGeolocation, infoWindow, pos) {
//   infoWindow.setPosition(pos);
//   infoWindow.setContent(browserHasGeolocation ?
//                         'Error: The Geolocation service failed.' :
//                         'Error: Your browser doesn\'t support geolocation.');
//   infoWindow.open(map);
// }

function openNativeMap(lat, longt) {
  if /* if we're on iOS, open in Apple Maps */
    ((navigator.platform.indexOf("iPhone") != -1) || 
     (navigator.platform.indexOf("iPad") != -1) || 
     (navigator.platform.indexOf("iPod") != -1))
    // window.open(`maps://maps.google.com/maps?daddr=${lat},${longt}&amp;ll=&travelmode=bicycling`);
    window.open(`http://maps.apple.com/?daddr=${lat},${longt}`);
else /* else use Google */

    window.open(`https://maps.google.com/maps?daddr=${lat},${longt}&amp;ll=&dirflg=w&saddr=${slat},${slongt}`);
}

function setPermissionCookie(isAllowed) {
  $.ajax({
    type: 'POST',
    url: '/set_cookie/',
    dataType: 'json',
    
    data: {'cookie_type':'map','is_allowed':isAllowed},

    success: function (data) {
       
    }
  });
}

function getMapCookie() {
  $.ajax({
    type: 'POST',
    url: '/get_cookie/',
    dataType: 'json',
    data: {'cookie':'map'},
    
    success: function (data) {
      if (data.cookie_value=="YES")
        {
          // showUserPosition(); 
          window.alert(mapError); 
        }
    }
  });
}