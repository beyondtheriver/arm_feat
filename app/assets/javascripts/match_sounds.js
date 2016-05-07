$(document).on("ready page:change", function(){
   if ($("#flash_message_profile").text().includes("WON")){
   //    //PLAY YOU WON AUDIO
      $('#you_won')[0].play();
   } else if ($("#flash_message_profile").text().includes("LOSE")){
      $('#you_lose')[0].play();
   }
})
