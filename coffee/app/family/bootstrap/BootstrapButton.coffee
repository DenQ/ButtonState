class BootstrapButton extends AbButton

  state : null
  listener : null

  # Override
  getStateCalm:->
    new BootstrapButtonStateCalm @

  # Override
  getStateFire:->
    new BootstrapButtonStateFire @

  # Override
  getStateWaiting:->
    new BootstrapButtonStateWaiting @

  # Override
  getStateBlocked:->
    new BootstrapButtonStateBlocked @