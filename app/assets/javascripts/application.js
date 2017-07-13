// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {

  // Ugly hack to load iframe after mdl js layout is loaded
  document.body.addEventListener('mdl-componentupgraded', function(event) {
     if (event.target.className.split(' ').indexOf('mdl-js-layout') < 0) {
       return
     }

     $('.video-cont').append('<iframe class="video-iframe" src="https://youtube.com/embed/2Z_tMfffAVE"></iframe>')

  })

  if ($('#landing-video')) {
    $('#landing-video').prop('autoplay', true)
    $('#landing-video').prop('mute', true)
    $('#landing-video').prop('loop', true)
    setTimeout(function() {
      $('#landing-video').get(0).play()
    }, 500)


    scaleVideoContainer();

    initBannerVideoSize('.video-container .poster img');
    initBannerVideoSize('.video-container .filter');
    initBannerVideoSize('.video-container video');

    $(window).on('resize', function() {
      scaleVideoContainer();
      scaleBannerVideoSize('.video-container .poster img');
      scaleBannerVideoSize('.video-container .filter');
      scaleBannerVideoSize('.video-container video');
    });
  }

});

function scaleVideoContainer() {

  var height = $(window).height() + 5;
  var unitHeight = parseInt(height) + 'px';
  $('.homepage-hero-module').css('height',unitHeight);

}

function initBannerVideoSize(element){

  $(element).each(function(){
    $(this).data('height', $(this).height());
    $(this).data('width', $(this).width());
  });

  scaleBannerVideoSize(element);

}

function scaleBannerVideoSize(element){

  var windowWidth = $(window).width(),
  windowHeight = $(window).height() + 5,
  videoWidth,
  videoHeight;

  // console.log(windowHeight);

  $(element).each(function(){
    var videoAspectRatio = $(this).data('height')/$(this).data('width');

    $(this).width(windowWidth);

    if(windowWidth < 1000){
      videoHeight = windowHeight;
      videoWidth = videoHeight / videoAspectRatio;
      $(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'});

      $(this).width(videoWidth).height(videoHeight);
    }

    $('.homepage-hero-module .video-container video').addClass('fadeIn animated');
    $('video').prop('autoplay', true)
    $('video').prop('mute', true)
    $('video').prop('loop', true)
    $('video').load()

  });
}
