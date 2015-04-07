class JsonFixture

  ASYNC_TIMER: 100
  ASYNC_TIMER_STEP: 20

  Get:->
    "title" : 'Abstract Button'
    "owner": "#btn"
    "defaultState" : "AbButtonStateCalm"
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
      "calm": "Abstract Button - calm"
      "fire": "Abstract Button - fire"
      "waiting": "Abstract Button - waiting"
      "blocked": "Abstract Button - blocked"
    "owner": "#btn"
    "defaultState" : "AbButtonStateCalm"
    "listener":
      "actionClick": (B) =>
        setTimeout (=>
          B.setState(B.getStateBlocked() );
        ), @ASYNC_TIMER
      "actionMouseOver": (B) =>
      "actionMouseOut": (B) =>


  GetWithOtOwner:->
    "title" : 'Abstract Button'
    "defaultState" : "AbButtonStateCalm"
    "listener":
      "actionClick": (e) =>
        console.log 'onClick'
      "actionMouseOver": (e) =>
        console.log 'onMouseOver'
      "actionMouseOut": (e) =>
        console.log 'onMouseOut'

  GetIncorrectOwner:->
    "title" : 'Abstract Button'
    "owner": "#btncdscdscdsvdsvdsvdfsv"
    "defaultState" : "AbButtonStateCalm"
    "listener":
      "actionClick": (e) =>
        console.log 'onClick'
      "actionMouseOver": (e) =>
        console.log 'onMouseOver'
      "actionMouseOut": (e) =>
        console.log 'onMouseOut'


  GetWithOtDefaultState:->
    "title" : 'Abstract Button'
    "owner": "#btn"
    "listener":
      "actionClick": (e) =>
        console.log 'onClick'
      "actionMouseOver": (e) =>
        console.log 'onMouseOver'
      "actionMouseOut": (e) =>
        console.log 'onMouseOut'


  GetWithOutTitle:->
    "owner": "#btn"
    "defaultState" : "AbButtonStateCalm"
    "listener":
      "actionClick": (e) =>
        console.log 'onClick'
      "actionMouseOver": (e) =>
        console.log 'onMouseOver'
      "actionMouseOut": (e) =>
        console.log 'onMouseOut'
