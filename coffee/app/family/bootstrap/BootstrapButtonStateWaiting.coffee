class BootstrapButtonStateWaiting extends AbButtonStateWaiting

  constructor:(button)->
    listener = button.getListener()
    listener.$owner.attr 'state', 'waiting'
    listener.$owner.removeClass 'btn-primary'
    listener.$owner.addClass 'btn-danger'
    listener.$owner.addClass 'disabled'
    button.setName listener.getTitle 'waiting'
    @