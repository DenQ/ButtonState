class AbButtonStateWaiting extends IButtonState

  constructor:(button)->
    listener = button.getListener()
    listener.$owner.attr 'state', 'waiting'
    button.setName listener.getTitle 'waiting'
    @


  actionClick:(button)->@


  actionMouseOver:(button)->@


  actionMouseOut:(button)->@