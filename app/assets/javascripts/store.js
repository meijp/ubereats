$(document).on('click','#ytimg',function(e){
    $('#ytimg').hide();
    $('#ytvideo').html('<iframe width="100%" height="500" src="https://www.youtube.com/embed/qSi6TaXRhdc?autoplay=1&rel=0" frameborder="0" allowfullscreen></iframe>').show();
});
