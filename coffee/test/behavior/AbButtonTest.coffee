describe 'Behavior. AbButton Family', =>

  describe 'Тестируем кнопу на стандартном наборе входных значений', =>
    button = null
    listener = null
    owner = null
    $owner = null

    beforeEach =>
      button = new AbButton null, JsonFixture::Get()
      listener = button.getListener()
      owner = listener.getOwner()
      $owner = listener.$owner

    afterEach =>
      button = null
      listener = null
      owner = null
      $owner = null

    it 'Кнопка существует', ->
      expect( owner ).toBeInDOM()

    it 'Кнопка по умолчанию не должна иметь атрибут :disabled', ->
      expect( owner ).not.toBeDisabled()

    it 'Изначально кнопка должна иметь атрибут state', ->
      expect( owner ).toHaveAttr 'state'

    it 'Изначально кнопка должна иметь state == calm, если не задан нужный класс состояния', ->
      expect( $owner.attr 'state' ).toEqual 'calm'

    it 'При mouseover кнопка должна изменить состояние на AbButtonStateFire', ->
      $owner.trigger 'mouseover'
      expect( button.getState() instanceof AbButtonStateFire ).toEqual true

    it 'При mouseover -> mouseout кнопка должна изменить состояние на AbButtonStateCalm', ->
      $owner.trigger 'mouseover'
      $owner.trigger 'mouseout'
      expect( button.getState() instanceof AbButtonStateCalm ).toEqual true

    it 'При mouseover -> click кнопка должна изменить состояние на AbButtonStateWaiting', ->
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      expect( button.getState() instanceof AbButtonStateWaiting ).toEqual true

    it 'При mouseover -> click -> click -> click кнопка должна иметь состояние AbButtonStateWaiting', ->
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      expect( button.getState() instanceof AbButtonStateWaiting ).toEqual true

    it 'При mouseover -> click -> time кнопка должна изменить состояние на AbButtonStateBlocked', (done) =>
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      setTimeout (=>
        expect( button.getState() instanceof AbButtonStateBlocked ).toEqual true
        done()
      ), JsonFixture::ASYNC_TIMER + JsonFixture::ASYNC_TIMER_STEP

    it 'При mouseover -> click -> time -> click не кнопка должна изменять состояние', (done) =>
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      setTimeout (=>
        $owner.trigger 'click'
        expect( button.getState() instanceof AbButtonStateBlocked ).toEqual true
        done()
      ), JsonFixture::ASYNC_TIMER + JsonFixture::ASYNC_TIMER_STEP

    it 'В состоянии AbButtonStateBlocked кнопка не должна менять свое состояние, ни при какиз воздействиях', (done) =>
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      setTimeout (=>
        $owner.trigger 'mouseover'
        expect( button.getState() instanceof AbButtonStateBlocked ).toEqual true
        $owner.trigger 'mouseout'
        expect( button.getState() instanceof AbButtonStateBlocked ).toEqual true
        done()
      ), JsonFixture::ASYNC_TIMER + JsonFixture::ASYNC_TIMER_STEP

    describe 'При смене состояний кнопка должна иметь title, который в нее заложен, если не указаны titles для состояний', =>

      it 'При состоянии calm', =>
        title = listener.getTitle()
        expect( $owner.text()).toContain title

      it 'При состоянии fire', =>
        $owner.trigger 'mouseover'
        title = listener.getTitle()
        expect( $owner.text()).toContain title

      it 'При состоянии fire -> calm', =>
        $owner.trigger 'mouseover'
        $owner.trigger 'mouseout'
        title = listener.getTitle()
        expect( $owner.text()).toContain title

      it 'При состоянии waiting', =>
        $owner.trigger 'mouseover'
        $owner.trigger 'click'
        title = listener.getTitle()
        expect( $owner.text()).toContain title

      it 'В состоянии blocked', (done) =>
        $owner.trigger 'mouseover'
        $owner.trigger 'click'
        setTimeout (=>
          title = listener.getTitle()
          expect( $owner.text()).toContain title
          done()
        ), JsonFixture::ASYNC_TIMER + JsonFixture::ASYNC_TIMER_STEP


  describe 'Тестируем кнопу на стандартном наборе входных значений c titles по состояниям JsonFixture::GetWithTitles()', =>
    button = null
    listener = null
    owner = null
    $owner = null
    beforeEach =>
      button = new AbButton null, JsonFixture::GetWithTitles()
      listener = button.getListener()
      owner = listener.getOwner()
      $owner = listener.$owner

    afterEach =>
      button = null
      listener = null
      owner = null
      $owner = null

    describe 'При смене состояний кнопка должна иметь соотвествующий title ее состоянию', =>
      it 'При состоянии calm', =>
        expect( $owner.text() ).toMatch "calm"

      it 'При состоянии fire', =>
        $owner.trigger 'mouseover'
        expect( $owner.text() ).toMatch "fire"

      it 'При состоянии fire -> calm', =>
        $owner.trigger 'mouseover'
        $owner.trigger 'mouseout'
        expect( $owner.text() ).toMatch "calm"

      it 'При состоянии waiting', =>
        $owner.trigger 'mouseover'
        $owner.trigger 'click'
        expect( $owner.text() ).toMatch "waiting"

      it 'В состоянии blocked', (done) =>
        $owner.trigger 'mouseover'
        $owner.trigger 'click'
        setTimeout (=>
          expect( $owner.text() ).toMatch "blocked"
          done()
        ), JsonFixture::ASYNC_TIMER + JsonFixture::ASYNC_TIMER_STEP