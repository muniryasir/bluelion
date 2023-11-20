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
var userPositionMarker;
function googleMapMethod() {
  var noPoi = [
    {
        featureType: "poi",
        stylers: [
          { visibility: "off" }
        ]   
      }
    ];
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
  placeMarkersOnMap(map);
  globalMap = map;
  showUserPosition();  
}

function adjustMap(map) {
  $.ajax({
		type: 'POST',
		url: '/chatou_auto/gmapcontrols/',
    dataType: 'json',
    success: function (data) {
      
      // console.log(data.zoom);
      // console.log(data.page);
      // console.log(data.level);
      // console.log(stepMarkers.length)
      map.setZoom(parseFloat(data.zoom));
      if(data.level=='home') {
        var locstep1 =  new google.maps.LatLng(48.889756,2.163500);
        map.setCenter(locstep1);
      } else {

        let labelIndex = searchMarkers(map,data.page);
        // console.log(globalContext);
        let marker = stepMarkers[labelIndex];
        map.setCenter(marker.getPosition());
        if(globalContext == 'step') {
          openInfoWindow(map,marker,labelIndex);

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
		url: '/chatou_auto/mapdata/',
    dataType: 'json',
    data: {'context':context},
		success: function (data, context) {
			var response = JSON.stringify(data.map_data);
      var partsmain = response.split("-M-");
      for(var i=0; i<partsmain.length-1; i++) {
        (function () {
        var parts= partsmain[i].split("-t-"); 
        var label = parts[0];
        //  console.log(JSON.stringify(parts))
        var image = parts[1];
        var lat = parts[2];
        var longt = parts[3];
        var step_link = parts[4];
        var page_order = parts[5];
        var pin_color = parts[6];
        // var step_name = parts[7];
        // console.log(step_name );
        if(page_order){
            // console.log(pin_color );
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
        text: page_order,
        color: text_color,
        fontSize: "20px",
        fontWeight: "bold",
        font: "Source Sans Bold"
      }
    });
      

   
        markerstep.addListener('click', function() {
          
          for (var i=0; i<stepMarkers.length; i++) {
            // console.log(JSON.stringify(stepMarkers[i].getPosition()));
           
            if (stepMarkers[i].getPosition().equals(markerstep.getPosition())) { 
              
                // console.log(i);
              
              stepinfowindows[i].open(map,markerstep);
              // console.log("markerstep.marker_index1");
            }
            else {
              // console.log("markerstep.marker_index2");

              stepinfowindows[i].close();
            }
            
        }
        }); 
        // infowindow.open(map,markerstep);
        
      
      
        markerstep.setMap(map);
        // if (pin_color == "BLUE") {
          stepMarkers.push(markerstep);
        // } else if (pin_color == "RED") {
          // stepMarkersRed.push(markerstep);
        // }
      } else { }
      })();
      }
      
        adjustMap(map); 
      
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
   console.log(stepMarkers[i].getPosition().lat()+"---"+stepMarkers[i].getPosition().lng());
    console.log( parseFloat(page_position[0]));
    console.log( parseFloat(page_position[1]));
    console.log((stepMarkers[i].getPosition().lat() == parseFloat(page_position[0])) && (stepMarkers[i].getPosition().lng() == parseFloat(page_position[1])));
    if( (stepMarkers[i].getPosition().lat() == parseFloat(page_position[0])) && (stepMarkers[i].getPosition().lng() == parseFloat(page_position[1])) )
      {
        return i;
      }
  }
}

function showUserPosition() {
  map = globalMap;
  // infoWindow = new google.maps.InfoWindow;
        var globale_marker_image = staticAddress+'chatou_auto/static/images/maps/markers/Pictos_Epingle_Map_blue.png';
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            userPositionMarker = new google.maps.Marker({
              position: pos,
              icon:{
                url:globale_marker_image,
                
              }
              
            });
            userPositionMarker.setMap(map);
            map.setCenter(pos);
            
          }, function() {
            // handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          // handleLocationError(false, infoWindow, map.getCenter());
        }
      
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