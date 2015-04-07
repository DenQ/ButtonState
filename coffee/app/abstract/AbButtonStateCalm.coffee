class AbButtonStateCalm extends IButtonState

  constructor:(button)->
    listener = button.getListener()
    listener.$owner.attr 'state', 'calm'
    listener.$owner.removeAttr 'disabled'
    button.setName listener.getTitle 'calm'
    @

  actionClick:(button)->
    listener = button.getListener()
    action = listener.getAction 'actionClick'
    action button
    button.setState button.getStateWaiting()
    @


  actionMouseOver:(button)->
    button.setState button.getStateFire()
    @


  actionMouseOut:(button)->
    listener = button.getListener()
    action = listener.getAction 'actionMouseOut'
    action button
    @