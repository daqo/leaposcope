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
//= require tether
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks

//= require leap/WebGL/three.min
//= require leap/leap
//= require leap/leap-plugins-0.1.6
//= require leap/leap.rigged-hand
//= require playbacks
//= require lib/FileSaver

// function activate(id) {
// 	$('.nav-link').removeClass('active');
// 	document.getElementById(id).className = "nav-link active";
// }


var enable_canvas;
var allowedRecordingLength = 300;
enable_canvas = function() {
  var timerId;
  timerId = 0;
  timerId = window.setInterval((function() {
    $('#leap-canvas').each(function() {
      if ($(this).is(':visible')) {
        clearInterval(timerId);
        (window.controller = new Leap.Controller({
          background: true
        })).use('playback', {
          loop: false,
          pauseHotkey: false,
          pauseOnHand: false
        }).use('riggedHand', {
          parent: document.getElementById('leap-canvas')
        }).connect();

        window.controller.on('frame', function(){
          if (player().isRecording()){
              if (player().recording.frameData.length <= allowedRecordingLength) {
                $("#progressbar").attr("value", Math.ceil((player().recording.frameData.length) / allowedRecordingLength * 100));
              } else  {
                player().finishRecording();
                $("#playbackBtn").removeAttr('disabled');
              }
          }
        });
      }
    });
  }), 100);
};