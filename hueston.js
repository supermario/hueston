
var hueston = {
  timer: null,
  huesets: {
    default:   ['f04950','f58d4e','f9a54b','fece3e','fff533','a3fd39','33b8a5','33a7d8','3276b5','8869ad','b868ad','e966ac'],
    saturated: ['cd222a','d3562a','e0922e','f0c430','fff12e','afcd4b','38894f','259692','2369b1','522eac','7d4296','8b345e'],
    custom:    ['f82836','f85e38','fdd226','aae636','57ef5c','2fe6a4','1dc7d8','4c9ce1','9476d8','d24ab9','f0356a']
  },
  init: function(hueset) {
    this.animate(this.huesets[hueset]);
  },
  colour: function(segment, hex) {
    var move = require('move');
    move('.'+segment)
      .set('background-color', hex)
      // .duration('1s')
      .end();
  },
  animate: function(hueset) {
    var i = j = 0;
    this.timer = setInterval(function(){

      var hour = parseInt(moment().format('H'));
      var minute = moment().minute();
      var second = moment().second();
      console.log(hour, minute, second);

      i = Math.floor(hour % 12);
      j = Math.floor(minute / 5);

      console.log(i,j);

      hueston.colour('hour', '#'+hueset[i]);
      hueston.colour('minute', '#'+hueset[j]);

    }, 1000);
  },
  stop: function() {
    clearTimeout(this.timer);
  }
};


(function ($) {

  $(document).ready(function(){

    hueston.init('saturated');

  });

})(jQuery);
