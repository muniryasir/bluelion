/*
function setPermissionCookie(isAllowed) {
    $.ajax({
      type: 'POST',
      url: '/set_cookie/',
      dataType: 'json',
      
      data: {'cookie_type':'cookie','is_allowed':isAllowed},
  
      success: function (data) {
         
      }
    });
  }

  function getCookie() {
    $.ajax({
      type: 'POST',
      url: '/get_cookie/',
      dataType: 'json',
      data: {'cookie':'cookie'},
      
      success: function (data) {
          if(data.cookie_value=="YES" || data.cookie_value=="NO") {
            $('#cookies-eu-banner').hide();
          } else if (data.cookie_value=="SHOW") {
            $('#cookies-eu-banner').show();
          }
     
      }
    });
  }
  */
 function setmPermissionCookie(isAllowed) {
  // $.ajax({
  //   type: 'POST',
  //   url: '/set_cookie/',
  //   dataType: 'json',
    
  //   data: {'cookie_type':'cookie','is_allowed':isAllowed},

  //   success: function (data) {
       
  //   }
  // });
  setmLocalCookie('cookie', isAllowed)
}

function getmCookie() {
  // $.ajax({
  //   type: 'POST',
  //   url: '/get_cookie/',
  //   dataType: 'json',
  //   data: {'cookie':'cookie'},
    
  //   success: function (data) {
  //       if(data.cookie_value=="YES" || data.cookie_value=="NO") {
  //         $('#cookies-eu-banner').hide();
  //       } else if (data.cookie_value=="SHOW") {
  //         $('#cookies-eu-banner').show();
  //       }
   
  //   }

  // });
  var cookie_value = getmLocalCookie('cookie');
  console.log("hello "+cookie_value);
  if(cookie_value=="YES" || cookie_value=="NO") {
    $('#cookies-eu-banner').hide();
  } else if (cookie_value=="SHOW" || cookie_value=="" ) {
    $('#cookies-eu-banner').show();
  }
}

function getmLocalCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

function setmLocalCookie(cname, cvalue) {
  var d = new Date();
  if (cvalue == "YES") {
    d.setTime(d.getTime() + (6*30*24*60*60*1000)); 
  } else {
    d.setTime(d.getTime() + (14*24*60*60*1000));
  }
  var expires = "expires="+ d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

  $(document).ready(function() {
    $('#cookies-eu-banner').hide();
      getmCookie();
  });

  function acceptCookie() {
    setmPermissionCookie("YES");
    $('#cookies-eu-banner').hide();
  }
  
  function rejectCookie() {
    setmPermissionCookie("NO");
    $('#cookies-eu-banner').hide();
  }