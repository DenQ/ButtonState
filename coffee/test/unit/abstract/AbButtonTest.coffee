describe 'Unit. Abstract AbButton', =>

  it 'Класс существует', ->
    expression = typeof AbButton is "function"
    expect(expression).toBeTruthy()


  describe 'Unit. Abstract AbButton. Method constructor()', =>

    it 'Метод должен быть переопределен', =>
      expect( => AbButtonFixture(null, JsonFixture::Get()) ).not.toThrow()


    it 'При отсуствиии json, должно быть исключение', =>
      expect( => AbButtonFixture() ).toThrow()


    it 'Если параметр state передается, то он должен принадлежать интерфесу имя класса существующего состояния, иначе исключение', =>
      expect( => AbButtonFixture('State') ).toThrow()


    it 'Конструктор должен вернуть экземпляр IButton', =>
      button = new AbButton null, JsonFixture::Get()
      expect(button instanceof IButton).toBeTruthy()


  describe 'Unit. Abstract AbButton. Method getState()', =>

    it 'Метод должен быть переопределен', =>
      button = new AbButton null, JsonFixture::Get()
      expect(button.getState).not.toThrow()


    it 'Метод должен возвращать тип IButtonState', =>
      button = new AbButton null, JsonFixture::Get()
      state = button.getState()
      expect(state instanceof IButtonState).toBeTruthy()


    it 'Метод должен возвращать тип который устанвливается в конструкторе для state, при передаче явно', =>
      button = new AbButton 'AbButtonStateCalm', JsonFixture::Get()
      stateEnd = button.getState()
      expect(stateEnd instanceof AbButtonStateCalm ).toBeTruthy()


  describe 'Unit. Abstract AbButton. Method setState()', =>

    it 'Метод должен быть переопределен', =>
      foo=()->
        button = new AbButton null, JsonFixture::Get()
        button.setState new AbButtonStateCalm button
      expect( foo ).not.toThrow()


    it 'Метод должен принимать только тип IButtonState, иначе исключение', =>
      foo=()->
        button = new AbButton null,JsonFixture::Get()
        button.setState {}
      expect( foo ).toThrow()


  describe 'Unit. Abstract AbButton. Method getListener()', =>

    it 'Метод должен быть переопределен', =>
      foo=()->
        button = new AbButton null, JsonFixture::Get()
        button.getListener()
      expect( foo ).not.toThrow()


    it 'Метод должен возвращать тип IListener', =>
      button = new AbButton null, JsonFixture::Get()
      listener = button.getListener()
      expect(listener instanceof IListener).toBeTruthy()


  describe 'Unit. Abstract AbButton. Method getActionClick()', =>

    it 'Метод должен быть переопределен', =>
      expect( => AbButtonFixture(null, JsonFixture::Get(), 'actionClick') ).not.toThrow()


  describe 'Unit. Abstract AbButton. Method getActionMouseOver()', =>

    it 'Метод должен быть переопределен', =>
      expect( => AbButtonFixture(null, JsonFixture::Get(), 'actionMouseOver') ).not.toThrow()


  describe 'Unit. Abstract AbButton. Method getActionMouseOut()', =>

    it 'Метод должен быть переопределен', =>
      expect( => AbButtonFixture(null, JsonFixture::Get(), 'actionMouseOut') ).not.toThrow()



  describe 'Unit. Получение состояний(для полиморфизма)', =>
    button = null
    beforeEach =>
      button = AbButtonFixture null, JsonFixture::Get()
    afterEach =>
      button = null

    describe 'Unit. Abstract AbButton. Method getStateCalm()', =>
      it 'Метод должен существовать', =>
        expect( => button.getStateCalm() ).not.toThrow()
      it 'Метод должен возвращать экземпляр типа IButtonState', =>
        expect( button.getStateCalm() instanceof IButtonState ).toBeTruthy()

    describe 'Unit. Abstract AbButton. Method getStateFire()', =>
      it 'Метод должен существовать', =>
        expect( => button.getStateFire() ).not.toThrow()
      it 'Метод должен возвращать экземпляр типа IButtonState', =>
        expect( button.getStateFire() instanceof IButtonState ).toBeTruthy()

    describe 'Unit. Abstract AbButton. Method getStateWaiting()', =>
      it 'Метод должен существовать', =>
        expect( => button.getStateWaiting() ).not.toThrow()
      it 'Метод должен возвращать экземпляр типа IButtonState', =>
        expect( button.getStateWaiting() instanceof IButtonState ).toBeTruthy()

    describe 'Unit. Abstract AbButton. Method getStateBlocked()', =>
      it 'Метод должен существовать', =>
        expect( => button.getStateBlocked() ).not.toThrow()
      it 'Метод должен возвращать экземпляр типа IButtonState', =>
        expect( button.getStateBlocked() instanceof IButtonState ).toBeTruthy()