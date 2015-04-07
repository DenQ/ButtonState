describe 'Unit. Abstract AbButtonStateCalm', =>

  it 'Класс существует', ->
    expression = typeof AbButtonStateCalm is "function"
    expect(expression).toBeTruthy()


  describe 'Unit. Abstract AbButtonStateCalm. Method constructor()', =>

    it 'Метод должен быть переопределен', =>
      expect( => AbButtonFixture 'AbButtonStateCalm', JsonFixture::Get() ).not.toThrow()


  describe 'Unit. Abstract AbButtonStateCalm. Method actionClick()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateCalm', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionClick button  ).not.toThrow()


  describe 'Unit. Abstract AbButtonStateCalm. Method actionMouseOver()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateCalm', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionMouseOver button  ).not.toThrow()

  describe 'Unit. Abstract AbButtonStateCalm. Method actionMouseOut()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateCalm', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionMouseOut button  ).not.toThrow()