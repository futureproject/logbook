window.tfp ||= {}

tfp.playMedia = (elem) ->
  $('video, audio').each -> tfp.pauseMedia(this)
  elem.play()
  $(elem).closest('.video-container').addClass('playing')

tfp.pauseMedia = (elem) ->
  elem.pause()
  elem.currentTime = 0
  $(elem).closest('.video-container').removeClass('playing')

