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
  $(document).ready(function() {
    $('#cookies-eu-banner').hide();
      getCookie();
  });

  function acceptCookie() {
    setPermissionCookie("YES");
    $('#cookies-eu-banner').hide();
  }
  
  function rejectCookie() {
    setPermissionCookie("NO");
    $('#cookies-eu-banner').hide();
  }