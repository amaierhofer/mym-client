# kickoff app, handle ui

log = (msg) -> console.log(msg)

randomImage = ->
  images = ("bg_kicker_0#{count}.jpg" for count in [1..5])
  index = Math.floor(Math.random() * images.length)
  $("#background").css "background-image": "url(images/#{images[index]})"

updateUI = (data) ->

  if data.active
    if !countdown.isActive()
      countdown.start(data.seconds_left)

    for i in [1..data.device_count]
      $("#p#{i}").addClass('active')

    if i > 4
      $("#join").hide()
      $("#playerComplete").show()
  else
    $("#join").hide()
    $("#players").hide()
    $("#now").show()

    countdown.stop()


if window.location.hostname == 'localhost'
  log 'running in browser'
else
  log 'running on device'
  $(document).on 'deviceready', gcm.register

switchScene = ->
  if ls.get('name')
    $('#screen1').hide()
    $('#screen2').show()

api.login()

$ ->
  randomImage()
  switchScene()

  $('#now').one('click', api.start)
  $('#join').one('click', api.join)
  $('#cancel').on('click', api.cancel)
  $('#go').one 'click', ->
    ls.set('name', $('#name').val())
    switchScene()
    api.login()

