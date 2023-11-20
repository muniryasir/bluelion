function initMap() {
    let map = new google.maps.Map(document.getElementById('map'), {
        zoom: 14,
        center: {lat: 48.8954021, lng: 2.1484749}
    });

    let image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
    let beachMarker = new google.maps.Marker({
        position: {lat: 48.8954021, lng: 2.1484749},
        map: map,
        icon: image
    });
}
var stepMarkers = [];
var stepinfowindows = [];

function googleMapMethod() {
     var step_names =  ["La maison Fournaise","La maison Levanneur","L’église de Notre-Dame","L'ancien château Bertin","Le Nymphée de Soufflot","La villa Lambert","Boulevard de la République","L’hôtel de ville","La Place Berteaux","La gare de Chatou"];
     var step_images = ["step0/Chatou Île 042 La Maison Fournaise depuis le Pont.jpg","step1/W Adam78 Maison Levanneur.jpg","step2/Eglise 04.jpg","step3/Chatou Parc 080 Le Château Bertin 1910.jpg","step4/Chatou Parc 065 Le Nymphée 1905.jpg","step5/Chatou Pièce dEau 023 Villa Lambert.jpg","step6/Chatou - Av. de la République avant 1911.jpg","step7/Chatou_Mairie par Moonik Hôtel de Ville W.JPG","step8/Chatou Entrée du Pays - Place du Marché 1910.jpg","step9/Chatou Gare 013b Le Quai vers 1910.jpg"];
     var count = 0;
     var image_loc = `${staticAddress}/chatou/static/images/pages/impressionistes_a/`;
     var step_image = image_loc+step_images[count];
     
     
     var step_name = step_names[count];
     var marker_image = staticAddress+'testmap/static/images/markers/Pictos_Epingle_Map_blue.png';
           
    // var myCenter = new google.maps.LatLng(51.508742,-0.120850);
    var locstep1 =  new google.maps.LatLng(48.889756,2.163500);
    var locstep2 =  new google.maps.LatLng(48.889957,2.163316);
    var locstep3 =  new google.maps.LatLng(48.889091,2.159590);
    var locstep4 =  new google.maps.LatLng(48.891179,2.160159);
    var locstep5 =  new google.maps.LatLng(48.892315,2.161312);

    var locstep6 =  new google.maps.LatLng(48.893382,2.154504);

    var locstep7 =  new google.maps.LatLng(48.891244, 2.150216);

    var locstep8 =  new google.maps.LatLng(48.889714, 2.157410);
    var locstep9 =  new google.maps.LatLng(48.886729, 2.155448);
    var locstep10 =  new google.maps.LatLng(48.885364, 2.156045);
    
    content_layout1 =  `<div class="infoPopupContainer">
                              <div class="infoPopupImg" ><img src="${step_image}" /></div> 
                              <div class="infoPopupLink"><a href="/chatou/step0/"><span  >${step_name.toUpperCase()}</span></a></div>
                              <div class="infoPopupDirections"></div>
                            </div>`; 
    count++;
    step_name = step_names[count];
    step_image = image_loc+step_images[count];
    content_layout2 =  `<div class="infoPopupContainer">
                              <div class="infoPopupImg" ><img src="${step_image}" /></div> 
                              <div class="infoPopupLink"><a href="/chatou/step1/"><span  >${step_name.toUpperCase()}</span></a></div>
                              <div class="infoPopupDirections"></div>
                            </div>`; 
    count++;
    step_name = step_names[count];
    step_image = image_loc+step_images[count];
    content_layout3 =  `<div class="infoPopupContainer">
    <div class="infoPopupImg" ><img src="${step_image}" /></div> 
    <div class="infoPopupLink"><a href="/chatou/step2/"><span  >${step_name.toUpperCase()}</span></a></div>
    <div class="infoPopupDirections"></div>
  </div>`;
  count++;
    step_name = step_names[count];
    step_image = image_loc+step_images[count];
  content_layout4 =  `<div class="infoPopupContainer">
  <div class="infoPopupImg" ><img src="${step_image}" /></div> 
  <div class="infoPopupLink"><a href="/chatou/step3/"><span  >${step_name.toUpperCase()}</span></a></div>
  <div class="infoPopupDirections"></div>
  </div>`; 
  count++;
    step_name = step_names[count];
    step_image = image_loc+step_images[count];
  content_layout5 =  `<div class="infoPopupContainer">
  <div class="infoPopupImg" ><img src="${step_image}" /></div> 
  <div class="infoPopupLink"><a href="/chatou/step4/"><span  >${step_name.toUpperCase()}</span></a></div>
  <div class="infoPopupDirections"></div>
  </div>`;
  count++;
    step_name = step_names[count];
    step_image = image_loc+step_images[count];
  content_layout6 =  `<div class="infoPopupContainer">
  <div class="infoPopupImg" ><img src="${step_image}" /></div> 
  <div class="infoPopupLink"><a href="/chatou/step5/"><span  >${step_name.toUpperCase()}</span></a></div>
  <div class="infoPopupDirections"></div>
</div>`;
count++;
    step_name = step_names[count];
    step_image = image_loc+step_images[count];
  content_layout7 =  `<div class="infoPopupContainer">
    <div class="infoPopupImg" ><img src="${step_image}" /></div> 
    <div class="infoPopupLink"><a href="/chatou/step6/"><span  >${step_name.toUpperCase()}</span></a></div>
    <div class="infoPopupDirections"></div>
  </div>`;
  count++;
    step_name = step_names[count];
    step_image = image_loc+step_images[count];
  content_layout8 =  `<div class="infoPopupContainer">
  <div class="infoPopupImg" ><img src="${step_image}" /></div> 
  <div class="infoPopupLink"><a href="/chatou/step7/"><span  >${step_name.toUpperCase()}</span></a></div>
  <div class="infoPopupDirections"></div>
</div>`;
count++;
    step_name = step_names[count];
    step_image = image_loc+step_images[count];
content_layout9 =  `<div class="infoPopupContainer">
                              <div class="infoPopupImg" ><img src="${step_image}" /></div> 
                              <div class="infoPopupLink"><a href="/chatou/step8/"><span  >${step_name.toUpperCase()}</span></a></div>
                              <div class="infoPopupDirections"></div>
                            </div>`; 
  count++;
  step_name = step_names[count];
  step_image = image_loc+step_images[count];                            
  content_layout10 =  `<div class="infoPopupContainer">
  <div class="infoPopupImg" ><img src="${step_image}" /></div> 
  <div class="infoPopupLink"><a href="/chatou/step9/"><span >${step_name.toUpperCase()}</span></a></div>
  <div class="infoPopupDirections"></div>
</div>`;                        
    
    var infowindow1 = new google.maps.InfoWindow({
      content:content_layout1
    });
    var infowindow2 = new google.maps.InfoWindow({
      content:content_layout2
    });
    var infowindow3 = new google.maps.InfoWindow({
      content:content_layout3
    });
    var infowindow4 = new google.maps.InfoWindow({
      content:content_layout4
    });
    var infowindow5 = new google.maps.InfoWindow({
      content:content_layout5
    });
    var infowindow6 = new google.maps.InfoWindow({
      content:content_layout6
    });
    var infowindow7 = new google.maps.InfoWindow({
      content:content_layout7
    });
    var infowindow8 = new google.maps.InfoWindow({
      content:content_layout8
    });
    var infowindow9 = new google.maps.InfoWindow({
      content:content_layout9
    });
    var infowindow10 = new google.maps.InfoWindow({
      content:content_layout10
    });
  var mapProp= {
    center:locstep1,
    disableDefaultUI: true,
    zoom:15,
  };

  var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  // var map2 = new google.maps.Map(document.getElementById("map"),mapProp);
  //alert('1'); 
  window.globalMap = map;
  window.mapOptions = mapProp;
  var markerstep1 = new google.maps.Marker({
    position: locstep1,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
  },
  label: {
    text: '1',
    color: "#000000",
    fontSize: "20px",
    fontWeight: "bold",
    font: "Source Sans Pro"
}
  });

markerstep1.addListener('click', function() {
  infowindow1.open(map,markerstep1);
  infowindow2.close();
  infowindow3.close();
  infowindow4.close();
  infowindow5.close();
  infowindow6.close();
  infowindow7.close();
  infowindow8.close();
  infowindow9.close();
  infowindow10.close();
});
  var markerstep2 = new google.maps.Marker({
    position: locstep2,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '2',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });

   

markerstep2.addListener('click', function() {
  infowindow2.open(map,markerstep2);
  infowindow1.close();
  infowindow3.close();
  infowindow4.close();
  infowindow5.close();
  infowindow6.close();
  infowindow7.close();
  infowindow8.close();
  infowindow9.close();
  infowindow10.close();
});
  var markerstep3 = new google.maps.Marker({
    position: locstep3,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '3',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });


markerstep3.addListener('click', function() {
  infowindow3.open(map,markerstep3);
  infowindow1.close();
  infowindow2.close();
  infowindow4.close();
  infowindow5.close();
  infowindow6.close();
  infowindow7.close();
  infowindow8.close();
  infowindow9.close();
  infowindow10.close();
});
  var markerstep4 = new google.maps.Marker({
    position: locstep4,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '4',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });


  
  
markerstep4.addListener('click', function() {
  infowindow4.open(map,markerstep4);
  infowindow2.close();
  infowindow3.close();
  infowindow1.close();
  infowindow5.close();
  infowindow6.close();
  infowindow7.close();
  infowindow8.close();
  infowindow9.close();
  infowindow10.close();
});
  var markerstep5 = new google.maps.Marker({
    position: locstep5,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '5',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });


markerstep5.addListener('click', function() {
  infowindow5.open(map,markerstep5);
  infowindow2.close();
  infowindow3.close();
  infowindow4.close();
  infowindow1.close();
  infowindow6.close();
  infowindow7.close();
  infowindow8.close();
  infowindow9.close();
  infowindow10.close();
});
  var markerstep6 = new google.maps.Marker({
    position: locstep6,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '6',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });
 
  
  
markerstep6.addListener('click', function() {
  infowindow6.open(map,markerstep6);
  infowindow2.close();
  infowindow3.close();
  infowindow4.close();
  infowindow5.close();
  infowindow1.close();
  infowindow7.close();
  infowindow8.close();
  infowindow9.close();
  infowindow10.close();
});
  var markerstep7 = new google.maps.Marker({
    position: locstep7,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '7',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });
  
  
  
markerstep7.addListener('click', function() {
  infowindow7.open(map,markerstep7);
  infowindow2.close();
  infowindow3.close();
  infowindow4.close();
  infowindow5.close();
  infowindow6.close();
  infowindow1.close();
  infowindow8.close();
  infowindow9.close();
  infowindow10.close();
});
  var markerstep8 = new google.maps.Marker({
    position: locstep8,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '8',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });
  
 
markerstep8.addListener('click', function() {
  infowindow8.open(map,markerstep8);
  infowindow2.close();
  infowindow3.close();
  infowindow4.close();
  infowindow5.close();
  infowindow6.close();
  infowindow7.close();
  infowindow1.close();
  infowindow9.close();
  infowindow10.close();
});
  var markerstep9 = new google.maps.Marker({
    position: locstep9,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '9',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });

  
 
markerstep9.addListener('click', function() {
  infowindow9.open(map,markerstep9);
  infowindow2.close();
  infowindow3.close();
  infowindow4.close();
  infowindow5.close();
  infowindow6.close();
  infowindow7.close();
  infowindow8.close();
  infowindow1.close();
  infowindow10.close();
});
  var markerstep10 = new google.maps.Marker({
    position: locstep10,
    icon:{
      url:marker_image,
      labelOrigin: new google.maps.Point(31,22)
    },
    label: {
      text: '10',
      color: "#000000",
      fontSize: "20px",
      fontWeight: "bold",
      font: "Source Sans Pro"
    }
  });

  
  
markerstep10.addListener('click', function() {
  infowindow10.open(map,markerstep10);
  infowindow2.close();
  infowindow3.close();
  infowindow4.close();
  infowindow5.close();
  infowindow6.close();
  infowindow7.close();
  infowindow8.close();
  infowindow9.close();
  infowindow1.close();
});
  markerstep1.setMap(map);
  markerstep2.setMap(map);
  markerstep3.setMap(map);
  markerstep4.setMap(map);
  markerstep5.setMap(map);
  markerstep6.setMap(map);
  markerstep7.setMap(map);
  markerstep8.setMap(map);
  markerstep9.setMap(map);
  markerstep10.setMap(map);

  stepMarkers.push(markerstep1);
  stepMarkers.push(markerstep2);
  stepMarkers.push(markerstep3);
  stepMarkers.push(markerstep4);
  stepMarkers.push(markerstep5);
  stepMarkers.push(markerstep6);
  stepMarkers.push(markerstep7);
  stepMarkers.push(markerstep8);
  stepMarkers.push(markerstep9);
  stepMarkers.push(markerstep10);
  stepinfowindows.push(infowindow1);
  stepinfowindows.push(infowindow2);
  stepinfowindows.push(infowindow3);
  stepinfowindows.push(infowindow4);
  stepinfowindows.push(infowindow5);
  stepinfowindows.push(infowindow6);
  stepinfowindows.push(infowindow7);
  stepinfowindows.push(infowindow8);
  stepinfowindows.push(infowindow9);
  stepinfowindows.push(infowindow10);
}