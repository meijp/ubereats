$(document).on('click','#ytimg',function(e){
    $('#ytimg').hide();
    $('#ytvideo').html('<iframe width="100%" height="500" src="https://www.youtube.com/embed/qSi6TaXRhdc?autoplay=1&rel=0" frameborder="0" allowfullscreen></iframe>').show();
});


$(document).on('turbolinks:load', function() {
  // var current_url = window.location.href;
    // if (current_url.match(/\/stores\/sign_up/)){
      var myIndex = 0;
      carousel();

      function carousel() {
          var i;
          var x = document.getElementsByClassName("mySlides");
          for (i = 0; i < x.length; i++) {
             x[i].style.display = "none";
          }
          myIndex++;
          if (myIndex > x.length) {myIndex = 1}
          x[myIndex-1].style.display = "block";
          setTimeout(carousel, 7000); // Change image every 7 seconds
      }
   // }
   // else {
      // setInterval(carousel, 1000);
    // }
});

