function setPermissionAppDownload(isAllowed) {
    $.ajax({
      type: 'POST',
      url: '/set_cookie/',
      dataType: 'json',
      
      data: {'cookie_type':'appdownload','is_allowed':isAllowed},
  
      success: function (data) {
         
      }
    });
  }

  function getCookie() {
    $.ajax({
      type: 'POST',
      url: '/get_cookie/',
      dataType: 'json',
      data: {'cookie':'appdownload'},
      
      success: function (data) {
          if(data.cookie_value=="YES" || data.cookie_value=="NO") {
            $('.download-banner').hide();
          } else if (data.cookie_value=="SHOW") {
            $('.download-banner').show();
          }
     
      }
    });
  }
  $(document).ready(function() {
    $('.download-banner').hide();
      getCookie();
  });

  function appdownloaded() {
    setPermissionCookie("YES");
    $('.download-banner').hide();
  }
  
  function downloadlater() {
    setPermissionCookie("NO");
    $('.download-banner').hide();
  }