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
var stepinfowindows = [];
var globalContext;
function googleMapMethod() {
  var noPoi = [
    {
        featureType: "poi",
        stylers: [
          { visibility: "off" }
        ]   
      }
    ];
  
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
  
    
}

function adjustMap(map) {
  $.ajax({
		type: 'POST',
		url: '/commune_de_paris/gmapcontrols/',
    dataType: 'json',
    success: function (data) {
      
      // console.log(data.zoom);
      // console.log(parseInt(data.page));
      // console.log(data.level);
      
      map_center_point = data.map_center;
      map_center_point_split = map_center_point.split(',')
      // console.log( parseFloat(map_center_point_split[0]));
      var  map_center =  new google.maps.LatLng( parseFloat(map_center_point_split[0]), parseFloat(map_center_point_split[1]));
      map.setZoom(parseFloat(data.zoom));
      if(data.level=='home') {
        // var locstep1 =  new google.maps.LatLng(map_center);
        map.setCenter(map_center);
      } else {

        let labelIndex = searchMarkers(map,parseInt(data.page));
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
console.log(context);
globalContext =context
  $.ajax({
		type: 'POST',
		url: '/commune_de_paris/mapdata/',
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
        pin_center_point = parts[2];
        pin_center_point_split = pin_center_point.split(',')
        // console.log( parseFloat(map_center_point_split[0]));
        // var  map_center =  new google.maps.LatLng( parseFloat(map_center_point_split[0]), parseFloat(map_center_point_split[1]));
        var lat = parseFloat(pin_center_point_split[0]);
        var longt = parseFloat(pin_center_point_split[1]);
        var step_link = parts[3];
        var page_order = parts[4];
        var pin_color = parts[5];
        // var step_name = parts[7];
        // console.log(step_name );
        if(page_order){
            // console.log(pin_color );
        var marker_image;
        var text_color;
        if (pin_color == "BLUE") {
          text_color = "#2D94D2";
          marker_image = staticAddress+'testmap/static/images/markers/Pictos_Epingle_Map_blue.png';
        } else if (pin_color == "RED") {
          text_color = "#C90C5D"
          marker_image = staticAddress+'testmap/static/images/markers/Pictos_Epingle_Map_red.png';
        }
        arrow_link = staticAddress+'commune_de_paris/static/images/arrow_link.svg'
        var locstep =  new google.maps.LatLng(lat,longt);

        var content_layout =`<div class="main_div">
        <div class="image" style="background:url(${image}) no-repeat;background-size:cover;background-position:center;float:left;width:35%;height:60px;"></div>
        <div class="title" style="color:#2D94D2;text-transform:uppercase;float:left;width:47%;height:60px;display:flex;flex-wrap:wrap;justify-content:center;align-items:center;text-align:center;font-size:13px;overflow-x:hidden;padding:0 5px;font-weight:bold;margin:0;">
        <a href="/${step_link}"><span  >${label.toUpperCase()}</span></a>
        </div>
        <div class="map_nav" style="float:right;width:16%;height:50px;line-height:60px;display: flex;flex-wrap: wrap;justify-content: center;text-align: center;align-items: center;">
          <a href="javascript:;" onclick="getLocation()" style="display: inline-block;margin-top:10px;">
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
        stepMarkers.push(markerstep);
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
  for (var i = 0; i < stepMarkers.length; i++) {
    // console.log(stepMarkers[i].getLabel());
    if(stepMarkers[i].getLabel().text == label)
      {
        return i;
      }
  }
}


