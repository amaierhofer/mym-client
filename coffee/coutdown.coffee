# fancy countdown
countdown = do ->
  active = false
  seconds = 900
  intervalFn = null

  secondPassed: ->
    minutes = Math.floor(seconds / 60)
    remainingSeconds = seconds % 60
    remainingSeconds = "0" + remainingSeconds  if remainingSeconds < 10

    $("#countdown").html("#{minutes}:#{remainingSeconds}")


    if seconds is 0
      clearInterval intervalFn
      $("#countdown").innerHTML = "NOW!"
      $("#alt_in").style.display = "none"
      $("#alt_min").style.display = "none"
    else
      seconds--

  stop: ->
    clearInterval intervalFn
    $("#countdown").html("15:00")

  isActive: -> active

  start: (secondsLeft) ->
    seconds = secondsLeft
    active = true

    intervalFn = setInterval((-> countdown.secondPassed()), 1000)

    $("#now").hide()
    $("#join").css('display', 'block') # show sets display: inline
    $("#players").show()
