# simply way of talking to backend
api = do ->
  port = 3000
  host = window.location.hostname

  $(document).ajaxError (event, request, settings) ->
    console.error "Error requesting #{settings.url} "

  $(document).ajaxSend (event, request, settings) ->
    log "#{settings.type} #{settings.url}"
    request.setRequestHeader('X-NAME', ls.get('name')) if ls.get('name')
    request.setRequestHeader('X-AUTH-TOKEN', ls.get('auth_token')) if ls.get('auth_token')
    request.setRequestHeader('X-PUSH-TOKEN', ls.get('push_token')) if ls.get('push_token')

  $(document).ajaxComplete (event, request, settings) ->
    ls.set('auth_token', request.responseJSON['auth_token'])
    log(JSON.stringify(request.responseJSON))
    updateUI(request.responseJSON)

  path = (action) ->
    if (window.location.hostname)
      "http://#{window.location.hostname}:3000/#{action}"
    else
      "http://mym-jln.rhcloud.com/#{action}"

  get = (action, callback) ->
    $.get(path(action), callback)

  start: -> get('start')
  join: -> get('join')
  login: -> get('login')
  cancel: -> get('cancel')

