class BootstrapButtonFixture

  ASYNC_TIMER: 100
  ASYNC_TIMER_STEP: 20

  Get:->
    "title" : 'Bootstrap Button'
    "owner": "#bootstrap-button"
    "defaultState" : "BootstrapButtonStateCalm"
    "listener":
      "actionClick": (B) =>
        setTimeout (=>
          B.setState(B.getStateBlocked() );
        ), @ASYNC_TIMER
      "actionMouseOver": (B) =>
      "actionMouseOut": (B) =>

  GetWithTitles:->
    "title" : 'Abstract Button'
    "titles":
      "calm": "Bootstrap Button - calm"
      "fire": "Bootstrap Button - fire"
      "waiting": "Bootstrap Button - waiting"
      "blocked": "Bootstrap Button - blocked"
    "owner": "#btn1"
    "defaultState" : "BootstrapButtonStateCalm"
    "listener":
      "actionClick": (B) =>
        setTimeout (=>
          B.setState(B.getStateBlocked() );
        ), @ASYNC_TIMER
      "actionMouseOver": (B) =>
      "actionMouseOut": (B) =>