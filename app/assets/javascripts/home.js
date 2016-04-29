$(document).ready(function(){
   $("#crowd_noise")[0].play();
   setTimeout(function(){
      $("#announcer")[0].play();
   }, 1250)
   setTimeout(function(){
      $("#bell_noise")[0].play()
   }, 3750);
})
