class BootstrapButtonStateCalm extends AbButtonStateCalm

  constructor:(button)->
    listener = button.getListener()
    listener.$owner.attr 'state', 'calm'
    listener.$owner.removeAttr 'disabled'
    listener.$owner.removeClass 'disabled'
    listener.$owner.removeClass 'btn-warning'
    listener.$owner.addClass 'btn-primary'
    listener.$owner.removeClass 'btn-danger'
    button.setName listener.getTitle 'calm'
    @


  actionClick:(button)->
    listener = button.getListener()
    action = listener.getAction 'actionClick'
    action button
    button.setState button.getStateWaiting()
    @


  actionMouseOver:(button)-> super


  actionMouseOut:(button)-> super