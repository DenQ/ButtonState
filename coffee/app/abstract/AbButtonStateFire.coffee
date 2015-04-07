class AbButtonStateFire extends IButtonState

  constructor:(button)->
    listener = button.getListener()
    listener.$owner.attr 'state', 'fire'
    button.setName listener.getTitle 'fire'
    @


  actionClick:(button)->
    listener = button.getListener()
    action = listener.getAction 'actionClick'
    action button
    button.setState button.getStateWaiting()
    @


  actionMouseOver:(button)->
    listener = button.getListener()
    action = listener.getAction 'actionMouseOver'
    action button
    @


  actionMouseOut:(button)->
    listener = button.getListener()
    action = listener.getAction 'actionMouseOut'
    action button
    button.setState button.getStateCalm()
    @