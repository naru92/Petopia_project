<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<title>Petopia</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<%@include file="../include/default_css.jsp"%>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Londrina+Solid|Nunito:400,300);
$blue: #53BDFF;
$green: #2EB933;
$drk-blue: darken($blue, 10%);
* {
	font-family: 'NEXON Lv1 Gothic OTF Light !important';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
  box-sizing: border-box;
}
footer {
   width:100%;
   height:260px;
   position:absolute;
   bottom:-120px !important;
   background:#385663;
  text-align: center;
  color: white;
}
html, body {
  height: 100%;
}

#hint{
margin-top: 15px;
color: white ;
font-size: 30px;
}
body {
  background:  #2AC1BC;

}

a {
  color: $blue;
  text-decoration: none;
  font-size: 14px;
  &:hover {
    color: lighten($blue, 10%);
  }
}
.hangman {
  font-family: 'NEXON Lv1 Gothic OTF' !important';
  margin: 0 auto;
  text-align: center;
  padding: 10px;
 }

h1 {
  font-size: 50px;
  margin-bottom: 20px;
  color: $blue;
  font-weight: 300;
}

p {
  margin-bottom: 20px;
  color: gray;
  line-height: 1.3;
  
}
@keyframes letteranim {
  50% {
    transform: translateY(-5px) scale(1.05);
  }
}

.letter {
  display: inline-block;
  color: transparent;
  border-bottom: 5px solid #385663;
  margin: 0 10px;
  font-size: 50px;
  padding: 10px;
  transition: .5s;
  text-transform: uppercase;
  
  
}
.word {
  display: block;
  white-space: nowrap;
}

.correct {
  color: #385663;
  text-shadow: 1px 2px 0 $drk-blue;
  animation: letteranim .3s ease;
}

.guessForm {
  margin: 20px auto 0;
  input, .guessButton {
    font-family: "Londrina Solid", cursive;
  }
  input[type="text"] {
    outline: none;
    padding: 10px;
    font-size: 30px;
    margin-bottom: 20px;
    margin-right: 5px;
    border: 1px solid #aaa;
    color: gray;
  }
  
  .guessButton {
    border: none;
    font-size: 30px;
    padding: 10px 20px;
    cursor: pointer;
    background: #3eb2a2;
    color: white;
    transition: .3s;
    margin: 10px 0;
    text-shadow: 1px 2px 0 $drk-blue;
    &:hover {
      background: #2AC1BC;
    }
  }
}

.wrongLetters p{
  font-size: 20px;
  margin-bottom: 10px;
  
}
.wrongLetters  li {
    display: inline-block !important;
    font-size: 40px;
    background:lighten(red,15%);
    text-shadow: 1px 2px 0 black;
    padding: 10px;
    color: white;
    text-transform: uppercase;
    margin-right: 10px;
    animation: letteranim .3s ease;
  }

.message {
  display: none;
  padding: 20px;
  position: absolute;
  top: 90px;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  background: #FF7F60;
  z-index: 12402402;
  
  h1 {
    display: none;
    color: white;
    text-shadow: 1px 2px 0 #ccc;
  }
  
  .highlight {
    color: yellow;
    text-transform: capitalize;
  }
  
  .text {
    color: white;
    font-size: 30px;
    display: none;
    p {
      color: white;
    }
    .highlight {
      font-size: 40px;
    }
  }
  .muted {
    margin: 20px auto;
    color: lighten($blue, 10%);
  }
}

.button {
    display: none;
    margin: 10px 0;
    border: none;
    font-size: 30px;
    padding: 10px 20px;
    cursor: pointer;
    background: lighten($green, 5%);
    color: white;
    transition: .3s;
    text-shadow: 1px 2px 0 $green;
    font-family: "Londrina Solid", cursive;
    &:hover {
      background: lighten($green, 20%);
      
    }
}
</style>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>




	<div class="container col-10 board" style="margin-top: 120px">
		<div class="hangman">
  <div class="guess"></div>
  <form class="guessForm">
  <input type="text" class="guessLetter" maxlength="1"  placeholder="알파벳 하나씩 입력!   &#x23ce;"/> <button type="submit" class="guessButton">Guess</button>
  </form>  
  <p id="hint">Hint: 국내 최고의 펫샵 이름은?<br/><a href="https://codepen.io/natewiley"></a></p>
  <div class="wrong">
    <div class="wrongLetters"></div>
  </div>
  <div class="message">
    <h1 class="title"></h1>
    <p class="text"></p>
    <button class="restart button">Play Again?</button>
    
  </div>
</div>
		
	</div>
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<%@include file="../include/default_sidebar_js.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			
			/*
			* SPOILER ALERT! 
			* WORDS FOR THE GAME ARE IN THIS FILE ;)
			* ©2014 Nate Wiley -- MIT License
			Sounds from http://soundfxnow.com, and http://www.soundjay.com
			Fonts from Google Fonts
			*/
			(function($, window, undefined){

			  Hangman = {
			    init: function(words){
			      this.words = words,
			      this.hm = $(".hangman"),
			      this.msg = $(".message"),
			      this.msgTitle = $(".title"),
			      this.msgText = $(".text"),
			      this.restart = $(".restart"),
			      this.wrd = this.randomWord(),
			      this.correct = 0,
			      this.guess = $(".guess"),
			      this.wrong = $(".wrong"),
			      this.wrongGuesses = [],
			      this.rightGuesses = [],
			      this.guessForm = $(".guessForm"),
			      this.guessLetterInput = $(".guessLetter"),
			      this.goodSound = new Audio("https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/goodbell.mp3"),
			      this.badSound = new Audio("https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/bad.mp3"),
			      this.winSound = new Audio("https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/win.mp3"),
			      this.loseSound = new Audio("https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/lose.mp3"),
			      this.setup();
			    },


			    setup: function(){
			      this.binding();
			      this.sounds();
			      this.showGuess(this.wrongGuesses);
			      this.showWrong();

			    },

			    
			    sounds: function(){  
			      this.badSound.volume = .4;
			      this.goodSound.volume = .4;
			      this.winSound.volume = .8;
			      this.loseSound.volume = .4;
			      
			    },
			    
			    
			    binding: function(){
			      this.guessForm.on("submit", $.proxy(this.theGuess, this));
			      this.restart.on("click", $.proxy(this.theRestart, this));
			    },


			    playSound: function(sound){
			      this.stopSound(sound);
			      this[sound].play();
			    },


			    stopSound: function(sound){
			      this[sound].pause();
			      this[sound].currentTime = 0;

			    },


			    theRestart: function(e){
			      e.preventDefault();
			      this.stopSound("winSound");
			      this.stopSound("loseSound");
			      this.reset();
			    },


			    theGuess: function(e){
			      e.preventDefault();
			      var guess = this.guessLetterInput.val();
			      if(guess.match(/[a-zA-Z]/) && guess.length == 1){
			        if($.inArray(guess, this.wrongGuesses) > -1 || $.inArray(guess, this.rightGuesses) > -1){
			          this.playSound("badSound");
			          this.guessLetterInput.val("").focus();
			        }
			        else if(guess) {
			          var foundLetters = this.checkGuess(guess);
			          if(foundLetters.length > 0){
			            this.setLetters(foundLetters);
			            this.playSound("goodSound");
			            this.guessLetterInput.val("").focus();
			          } else {
			            this.wrongGuesses.push(guess);
			            if(this.wrongGuesses.length == 10){
			              this.lose();
			            } else {
			              this.showWrong(this.wrongGuesses);
			              this.playSound("badSound");
			            }
			            this.guessLetterInput.val("").focus();
			          }
			        }
			      } else {
			        this.guessLetterInput.val("").focus();
			      }
			    },

			    randomWord: function(){
			      return this._wordData(this.words[ Math.floor(Math.random() * this.words.length)] );
			    },


			    showGuess: function(){
			      var frag = "<ul class='word'>";
			      $.each(this.wrd.letters, function(key, val){
			        frag += "<li data-pos='" +  key  + "' class='letter'>*</li>";
			      });
			      frag += "</ul>";
			      this.guess.html(frag);
			    },


			    showWrong: function(wrongGuesses){
			      if(wrongGuesses){
			        var frag = "<ul class='wrongLetters'>";
			        frag += "<p>틀린 글자: </p>";
			        $.each(wrongGuesses, function(key, val){
			          frag += "<li>" + val + "</li>";
			        });
			        frag += "</ul>";
			      }
			      else {
			        frag = "";
			      }

			      this.wrong.html(frag);
			    },


			    checkGuess: function(guessedLetter){
			      var _ = this;
			      var found = [];
			      $.each(this.wrd.letters, function(key, val){
			        if(guessedLetter == val.letter.toLowerCase()){
			          found.push(val);
			          _.rightGuesses.push(val.letter);
			        }
			      });
			      return found;

			    },


			    setLetters: function(letters){
			      var _ = this;
			      _.correct = _.correct += letters.length;
			      $.each(letters, function(key, val){
			        var letter = $("li[data-pos=" +val.pos+ "]");
			        letter.html(val.letter);
			        letter.addClass("correct");

			        if(_.correct  == _.wrd.letters.length){
			          _.win();
			        }
			      });
			    },


			    _wordData: function(word){

			      return {
			        letters: this._letters(word),
			        word: word.toLowerCase(),
			        totalLetters: word.length
			      };
			    },


			    hideMsg: function(){
			      this.msg.hide();
			      this.msgTitle.hide();
			      this.restart.hide();
			      this.msgText.hide();
			    },


			    showMsg: function(){
			      var _ = this;
			      _.msg.show("blind", function(){
			        _.msgTitle.show("bounce", "slow", function(){
			          _.msgText.show("slide", function(){
			            _.restart.show("fade");
			          });

			        });

			      });
			    },


			    reset: function(){
			      this.hideMsg();
			      this.init(this.words);
			      this.hm.find(".guessLetter").focus();

			    },


			    _letters: function(word){
			      var letters = [];
			      for(var i=0; i<word.length; i++){
			        letters.push({
			          letter: word[i],
			          pos: i
			        });
			      }
			      return letters;
			    },


			    rating: function(){
			      var right = this.rightGuesses.length,
			          wrong = this.wrongGuesses.length || 0,
			          rating = {
			            rating: Math.floor(( right / ( wrong + right )) * 100),
			            guesses: (right + wrong)
			            
			          };
			      return rating;
			    },

			    win: function(){
			      var rating = this.rating();
			      this.msgTitle.html("Awesome, You Won!");
			      // this is messy
			      this.msgText.html("You solved the word in <span class='highlight'>" + rating.guesses + "</span> Guesses!<br>Score: <span class='highlight'>" + rating.rating + "%</span>");
			      this.showMsg();
			      this.playSound("winSound");

			    },


			    lose: function(){
			      this.msgTitle.html("You Lost.. The word was <span class='highlight'>"+ this.wrd.word +"</span>");
			      this.msgText.html("Don't worry, you'll get the next one!");
			      this.showMsg();
			      this.playSound("loseSound");
			    }
			  
			  };

			  var wordList = ["petopia"];

			  Hangman.init(wordList);
			  
			})(jQuery, window);



			  
			  

			
			

	
		
		});
		
	</script>
</body>
</html>






