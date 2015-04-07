class BootstrapButtonStateBlocked extends AbButtonStateBlocked

  constructor:(button)->
    listener = button.getListener()
    listener.$owner.attr 'state', 'blocked'
    listener.$owner.attr 'disabled', ''
    listener.$owner.addClass 'disabled'
    listener.$owner.addClass 'btn-success'
    listener.$owner.removeClass 'btn-warning'
    listener.$owner.removeClass 'btn-danger'
    button.setName listener.getTitle 'blocked'