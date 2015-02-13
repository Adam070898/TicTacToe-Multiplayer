
var gameid = $('#gameid').text();
var turn = $('#turn').text();
var clicks = {}


function createfunc(i, gameid, turn) {
  var url = "/play/"+ gameid +"/"
  return function() {
    // console.log('click '+i)
    $.ajax({
      type: "POST",
      url: url,
      data: {'turn': turn, 'click': i-1},
      success: function(msg){
        console.log('data sent from click '+i)
        console.log(msg)
      },
    });
  };
}

function refresh(gameid) {
  url = "/play/"+ gameid
  console.log('screen replaced')
  $.ajax({
    type: "GET",
    url: url,
    success: function(data){
      $(".container").replaceWith(data)
    },
  });
}


$(document).ready(function() {
  for (var i = 1; i < 10; i++) {
    var gameid = $('#gameid').text();
    debugger
    clicks[i] = createfunc(i, gameid, turn);
  }
  // setInterval(refresh(gameid), 3000)
});

