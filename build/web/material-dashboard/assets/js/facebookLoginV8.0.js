
window.fbAsyncInit = function() {
  FB.init({
    appId      : '{640597816630256}',
    cookie     : true,
    xfbml      : true,
    version    : '{v8.0}'
  });

  FB.AppEvents.logPageView();   

};


FB.getLoginStatus(function(response) {
    console.log(response);
    statusChangeCallback(response);
});

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "https://connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));
 
 /*
  * <fb:login-button 
  scope="public_profile,email"
  onlogin="checkLoginState();">
</fb:login-button>
  * 
  */
 function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}
