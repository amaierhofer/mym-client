# register callback to obtain gcm push token
gcm = do ->
  register = (pushNotification) ->
    config = { senderID: "$GCM_SENDER_ID" , ecb: 'gcm.handleResponse' }
    successHandler = -> console.log 'push registered'
    errorHandler = -> console.log 'push not registerd'
    pushNotification.register(successHandler, errorHandler, config)

  handleResponse: (message) ->
    if message.event == 'registered'
      ls.set('push_token', message.regid)

    api.login()

  register: ->
    register(window.plugins.pushNotification)
