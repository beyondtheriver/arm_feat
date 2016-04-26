$(document).on('ready page:change', function(){
   if ($('#boss_try').length == 0) {
      return;
   }
   var counter = 10000;
   var x = parseInt($("#arm_x").val());
   var type_speed = 500;
   $('#noise')[0].play();
   opponentTypes();


   $("#arm_lever").css('transform', 'rotate('+x+'deg)');
   $("#arm_lever").css('transform-origin', 'bottom');

   function opponentTypes(){
      //the word to match
      var match = $("#challenge_word").text();
      //splitting that word into an array
      var array = match.split("");
      var input = $("#boss_try");
      var typing = ""
      for (var i = 0; i < array.length; i++){
         setTimeout(function(j) {
            typing += array[j];
            $("#boss_try").text(typing);
            // input.text(input.text() + );
         }, i * type_speed, i)
      }
   }


   // Every tenth of a second
   setInterval(function(){
      // $('#chal').text(counter/1000);
      counter-=100;
      var chal_word = $("#challenge_word").text();
      //Do we have the value of challenge word?
      // console.log($("#user_input").val());
      //Set jQuery object to javascript variable
      var us_inp = $("#user_input").val();
      //Set jQuery object to javascript variable
      var comp_inp = "Test";

      if (chal_word === us_inp) {
         //Do the words match?
         console.log("USER MATCHED!")
         //Increase score
         // counter++;
         //Increase angle of arm towards winning
         x = x + 9;
         $("#arm_x").val(x);

         //Show score
         // console.log("Score:" + counter);
         //Rotate arm in css
         $("#arm_lever").css('transform', 'rotate('+x+'deg)');
         $("#arm_lever").css('transform-origin', 'bottom');
         $("#arm_lever").css('transition', 'transform 1s');
          // change_word();
          $('#word-send').click();
      } else if (counter <= 0 || $("#boss_try").text() == chal_word) {
         //Do the words match?
         console.log("COMPUTER MATCHED");
         //Increase score
         // counter--;
         //Decrease angle of arm towards User losing
         x = x - 9;
         $("#arm_x").val(x);
         //Show score
         // console.log("Score:" + counter);
         //Rotate arm in css
         //Three formats for CSS transformations:
         // $(selector).css({property:value, property:value, ...})
         // $('.user-text').css('transform', 'scale(' + ui.value + ')');
         // $(selector).css(property,value)
         $("#arm_lever").css('transform', 'rotate('+x+'deg)');
         $("#arm_lever").css('transform-origin', 'bottom');
         $("#arm_lever").css('transition', 'transform 1s');
          // change_word();
          $('#word-send').click();
          $("#challenge_word").text("OUT OF TIME :(");

      }

      //Wins when User score gets to ten.
      // if (counter == 10) {
      //    $("#announcer").html("YOU'RE THE WINNER!");
      // }
      // if (counter == -10) {
      //    $("#announcer").html("COMPUTER IS THE WINNER!")
      // }
   //end of setInterval
  }, 100);




})
