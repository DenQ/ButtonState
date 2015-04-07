describe 'Behavior. BootstrapButton Family', =>

  describe 'Тестируем кнопу на стандартном наборе входных значений', =>
    button = null
    listener = null
    owner = null
    $owner = null
    beforeEach =>
      button = new BootstrapButton null, BootstrapButtonFixture::Get()
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

    it 'При mouseover кнопка должна изменить состояние на BootstrapButtonStateFire', ->
      $owner.trigger 'mouseover'
      expect( button.getState() instanceof BootstrapButtonStateFire ).toEqual true

    it 'При mouseover -> mouseout кнопка должна изменить состояние на BootstrapButtonStateCalm', ->
      $owner.trigger 'mouseover'
      $owner.trigger 'mouseout'
      expect( button.getState() instanceof BootstrapButtonStateCalm ).toEqual true

    it 'При mouseover -> click кнопка должна изменить состояние на BootstrapButtonStateWaiting', ->
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      expect( button.getState() instanceof BootstrapButtonStateWaiting ).toEqual true

    it 'При mouseover -> click -> click -> click кнопка должна иметь состояние BootstrapButtonStateWaiting', ->
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      expect( button.getState() instanceof BootstrapButtonStateWaiting ).toEqual true

    it 'При mouseover -> click -> time кнопка должна изменить состояние на BootstrapButtonStateBlocked', (done) =>
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      setTimeout (=>
        expect( button.getState() instanceof BootstrapButtonStateBlocked ).toEqual true
        done()
      ), BootstrapButtonFixture::ASYNC_TIMER + BootstrapButtonFixture::ASYNC_TIMER_STEP

    it 'При mouseover -> click -> time -> click не кнопка должна изменять состояние', (done) =>
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      setTimeout (=>
        $owner.trigger 'click'
        expect( button.getState() instanceof BootstrapButtonStateBlocked ).toEqual true
        done()
      ), BootstrapButtonFixture::ASYNC_TIMER + BootstrapButtonFixture::ASYNC_TIMER_STEP

    it 'В состоянии BootstrapButtonStateBlocked кнопка не должна менять свое состояние, ни при какиз воздействиях', (done) =>
      $owner.trigger 'mouseover'
      $owner.trigger 'click'
      setTimeout (=>
        $owner.trigger 'mouseover'
        expect( button.getState() instanceof BootstrapButtonStateBlocked ).toEqual true
        $owner.trigger 'mouseout'
        expect( button.getState() instanceof BootstrapButtonStateBlocked ).toEqual true
        done()
      ), BootstrapButtonFixture::ASYNC_TIMER + BootstrapButtonFixture::ASYNC_TIMER_STEP