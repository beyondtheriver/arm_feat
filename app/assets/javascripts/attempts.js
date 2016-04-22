$(document).on('ready page:change', function(){
   if ($('#boss_try').length == 0) {
      return;
   }
   var counter = 10000;
   var x = parseInt($("#arm_x").val());
   var type_speed = 500;
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


// $(document).ready(function(){
//    //counter is used for Score
//    var counter = 0;
//    //x is used for arm degrees
//    var x = 0;

//    function change_word() {
//       //clear input fields after Submit
//       $("#user_input").val("");
//       $("#op_types").text("");
//       //temporary words list
//       var words_array = ["popcorn", "shoestring", "birthday", "vegetative",
//       "numerology", "umbrella", "ignominous", "phrenology",
//       "graph", "stack", "press", "cargo"];
//       //random word from words list
//       var random_word = words_array[Math.round(Math.random() * words_array.length)]
//       //throwing the random word into a h1
//       $("#the_word").text(random_word);
//       //allowing the AI to type
//       opponentTypes();
//    };
//    //change challenge word
//    change_word();
//    //allowing AI to type
//    function opponentTypes(){
//       //the word to match
//       var match = $("#the_word").text();
//       //splitting that word into an array
//       var array = match.split("");
//       var input = $("#op_types");
//       for (var i = 0; i < array.length; i++){
//          setTimeout(function(j) {
//             input.text(input.text() + array[j]);
//          }, i * 400, i)
//       }
//    }

//    // Every tenth of a second
//    setInterval(function(){
//       var chal_word = $("#the_word").text();
//       //Do we have the value of challenge word?
//       // console.log($("#user_input").val());
//       //Set jQuery object to javascript variable
//       var us_inp = $("#user_input").val();
//       //Set jQuery object to javascript variable
//       var comp_inp = $("#op_types").text();

//       if (chal_word === us_inp) {
//          //Do the words match?
//          console.log("USER MATCHED!")
//          //Increase score
//          counter++;
//          //Increase angle of arm towards winning
//          x = x + 9;
//          //Show score
//          console.log("Score:" + counter);
//          //Rotate arm in css
//          $("#arm img").css('transform', 'rotate('+x+'deg)');
//          $("#arm img").css('transform-origin', 'bottom');
//          $("#arm img").css('transition', 'transform 1s');
//           change_word();
//       } else if (chal_word === comp_inp) {
//          //Do the words match?
//          console.log("COMPUTER MATCHED");
//          //Increase score
//          counter--;
//          //Decrease angle of arm towards User losing
//          x = x - 9;
//          //Show score
//          console.log("Score:" + counter);
//          //Rotate arm in css
//          //Three formats for CSS transformations:
//          // $(selector).css({property:value, property:value, ...})
//          // $('.user-text').css('transform', 'scale(' + ui.value + ')');
//          // $(selector).css(property,value)
//          $("#arm img").css('transform', 'rotate('+x+'deg)');
//          $("#arm img").css('transform-origin', 'bottom');
//          $("#arm img").css('transition', 'transform 1s');
//           change_word();
//       }

//       //Wins when User score gets to ten.
//       if (counter == 10) {
//          $("#announcer").html("YOU'RE THE WINNER!");
//       }
//       if (counter == -10) {
//          $("#announcer").html("COMPUTER IS THE WINNER!")
//       }
//    //end of setInterval
//   }, 100);


// });
