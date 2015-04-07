class AbButton extends IButton

  state : null
  listener : null

  constructor:(__stateName , __json)->
    @__initListener __json
    @__initState __stateName
    @__initActions()
    return @

  getState:->
    @state;


  setState:(__state)->
    unless __state instanceof IButtonState
      throw false
    @state = __state
    return null


  getListener:-> return @listener

  __initListener:(__json)->
    unless __json?
      throw false
    @listener = @createListener __json
    return null


  __initState:(stateName)->
    if stateName?
      if typeof window[stateName] is 'function'
        @setState new window[stateName] @
      else
        throw false
    else
      @setState @getStateCalm()
    return null


  __initActions:->
    @listener.$owner.unbind('click').click => @actionClick()
    @listener.$owner.unbind('mouseover').mouseover => @actionMouseOver()
    @listener.$owner.unbind('mouseout').mouseout => @actionMouseOut()


  actionClick:->
    @state.actionClick @
    return null


  actionMouseOver:->
    @state.actionMouseOver @
    return null


  actionMouseOut:->
    @state.actionMouseOut @
    return null

  # Override
  setName:(name)->
    @listener.$owner.text name


  # Override
  getStateCalm:-> new AbButtonStateCalm @

  # Override
  getStateFire:-> new AbButtonStateFire @

  # Override
  getStateWaiting:-> new AbButtonStateWaiting @

  # Override
  getStateBlocked:-> new AbButtonStateBlocked @

  # Override
  createListener:(__json)-> new AbListener __json