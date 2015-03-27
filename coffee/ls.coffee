# simple key value store

ls = do ->
  remove: (key) ->
    localStorage.removeItem(key)
  set: (key, value) ->
    localStorage.setItem(key, value)
  get: (key) ->
    localStorage.getItem(key)
