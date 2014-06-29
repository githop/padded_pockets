// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
function voting(type,commentId) {
  var politicianId = window.location.pathname.slice(-1);
  var url = "/politicians/" + politicianId + "/comments/" + commentId + "/" + type;
  $.post(url, {comment_id: commentId, politician_id: politicianId}, function(result){
    $('.'+commentId).replaceWith("<div class='votecount child-flex'>" + (result.vote_up - result.vote_down) +  " points</div>")
  }, "JSON");
}

function updateVote() {

}

$(document).ready(function(){
  var commentId;
  $("img[alt='up_vote']").on('click', function(){
    commentId = $(this).attr('value')
    voting("upvote", commentId)
  });
  $("img[alt='down_vote']").on('click', function(){
    commentId = $(this).attr('value')
    voting("downvote", commentId)
  });

 $('#post_state_id').on("change", function(){
    $("#peoples").empty();
    var stateSelection = $('#post_state_id').val();
    console.log(stateSelection)
    $.post('/congress_by_state', {state: stateSelection}, function(p){
      console.log (p[0].id)
      for (var i in p) {
      $("#peoples").append("<li><a href=/politicians/" + p[i].id +  ">" + p[i].first_name + " " + p[i].last_name + ": " + p[i].title + " - " + p[i].party + "</a></li>");
    }})

  });
});
