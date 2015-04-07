class AbButtonStateBlocked extends IButtonState

  constructor:(button)->
    listener = button.getListener()
    listener.$owner.attr 'state', 'blocked'
    listener.$owner.attr 'disabled', ''
    button.setName listener.getTitle 'blocked'
    @

  actionClick:(button)->@


  actionMouseOver:(button)->@


  actionMouseOut:(button)->@