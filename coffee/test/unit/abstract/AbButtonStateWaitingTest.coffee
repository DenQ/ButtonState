describe 'Unit. Abstract AbButtonStateWaiting', =>

  it 'Класс существует', ->
    expression = typeof AbButtonStateWaiting is "function"
    expect(expression).toBeTruthy()


  describe 'Unit. Abstract AbButtonStateWaiting. Method constructor()', =>

    it 'Метод должен быть переопределен', =>
      expect( => AbButtonFixture 'AbButtonStateWaiting', JsonFixture::Get() ).not.toThrow()


  describe 'Unit. Abstract AbButtonStateWaiting. Method actionClick()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateWaiting', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionClick button  ).not.toThrow()


  describe 'Unit. Abstract AbButtonStateWaiting. Method actionMouseOver()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateWaiting', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionMouseOver button  ).not.toThrow()

  describe 'Unit. Abstract AbButtonStateWaiting. Method actionMouseOut()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateWaiting', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionMouseOut button  ).not.toThrow()