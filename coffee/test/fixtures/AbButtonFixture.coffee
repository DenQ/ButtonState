AbButtonFixture=(stateName, json, action = null)->
  button = new AbButton stateName, json
  unless action?
    return button
  if typeof AbButton[action] is 'function'
    return button[action]()
