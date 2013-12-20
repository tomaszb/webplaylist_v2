# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#2. This code loads the IFrame Player API code asynchronously.
tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

window.onYouTubeIframeAPIReady = ->
  window.player = new YT.Player("player",
  height: "200"
  width: "400"
  videoId: "M7lc1UVf-VE"
  events:
    onReady: onPlayerReady
    onStateChange: onPlayerStateChange
  )

# 4. The API will call this function when the video player is ready.
window.onPlayerReady = (event) ->
  $('.song_part').first().addClass('selected_song');
  window.index_song = 0;
  window.all_songs = $('.selected_song').data('songs');
  window.player.loadVideoById($('.song_part').data('songs')[0]['youtubeid']);
  event.target.playVideo()

# 5. The API calls this function when the player's state changes.
#    The function indicates that when playing a video (state=1),
#    the player should play for six seconds and then stop.
window.done = false
window.onPlayerStateChange = (event) ->
  if event.data is YT.PlayerState.PLAYING and not window.done
    #setTimeout stopVideo, 6000
    window.done = true
  if event.data is YT.PlayerState.ENDED
    window.index_song++;
    #current_song = $('.selected_song').data('index');
    $('.selected_song').removeClass('selected_song');
    if window.all_songs[window.index_song]
      window.player.loadVideoById(window.all_songs[window.index_song].youtubeid)
    else
      window.index_song = 0
      window.player.loadVideoById(window.all_songs[window.index_song].youtubeid)
    $(".song-"+(window.index_song+1)).addClass('selected_song');

window.stopVideo = ->
  window.player.stopVideo()

@bindsongs = (parent) ->
  parent.find('.song_part').on 'click', ->
      window.all_songs = $(this).data('songs');
      window.index_song = $(this).data('index');
      window.player.loadVideoById(window.all_songs[window.index_song].youtubeid);
      $('.selected_song').removeClass('selected_song')
      $(this).addClass('selected_song');
      window.song_playing = $('.selected_song').attr('class').substring(10,16);
  
  if ($("." + window.song_playing).length != 0)
    console.log("first here");
    if ($("."+ window.song_playing).data('index') != window.index_song)
      console.log("second_here");
      $('.song_part[data-index="'+window.index_song+'"]').addClass('selected_song');
    else
      console.log("third here");
      $("."+window.song_playing).addClass('selected_song');

$ ->
  $('.song_part').on 'click', ->
      window.all_songs = $(this).data('songs');
      window.index_song = $(this).data('index');
      window.player.loadVideoById(window.all_songs[window.index_song].youtubeid);
      $('.selected_song').removeClass('selected_song')
      $(this).addClass('selected_song');

  $('.playlist_part').click ->
    if ($('.selected_song').length != 0)
      window.song_playing = $('.selected_song').attr('class').substring(10,16);
    window.index_playlist = $(this).data('index');
    $('.pl_selected').removeClass("pl_selected");
    $(this).find('li').addClass('pl_selected');
