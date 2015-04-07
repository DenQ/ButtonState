class BootstrapButtonStateFire extends AbButtonStateFire

  constructor:(button)->
    listener = button.getListener()
    listener.$owner.attr 'state', 'fire'
    listener.$owner.addClass 'btn-warning'
    listener.$owner.removeClass 'btn-primary'
    button.setName listener.getTitle 'fire'
    @

  actionClick:(button)-> super


  actionMouseOver:(button)-> super


  actionMouseOut:(button)-> super