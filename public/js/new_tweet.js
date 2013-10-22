// Shorthand for document ready
$(function(){
  $('#new_tweet_button').on('click', function() {
    $node ='<div id="new_tweet_block"><textarea name="tweet_text" cols="35" rows="3"></textarea><input id="submit_tweet" type="submit" value="Post Tweet"></div>'
    $('#new_tweet_button').remove();
    $('#new_tweet_form').append($node)
    $('.new_tweet').show()

      $("#submit_tweet").on('submit', function(event) {
      event.preventDefault()
      var tweet_text = $('#tweet_text').val()
      console.log(tweet_text)
      // if (tweet_text) {
        // post tweet via controller
      // }
    })
  })

});
