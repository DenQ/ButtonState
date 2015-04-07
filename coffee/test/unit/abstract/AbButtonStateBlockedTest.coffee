describe 'Unit. Abstract AbButtonStateBlocked', =>

  it 'Класс существует', ->
    expression = typeof AbButtonStateBlocked is "function"
    expect(expression).toBeTruthy()


  describe 'Unit. Abstract AbButtonStateBlocked. Method constructor()', =>

    it 'Метод должен быть переопределен', =>
      expect( => AbButtonFixture 'AbButtonStateBlocked', JsonFixture::Get() ).not.toThrow()


  describe 'Unit. Abstract AbButtonStateBlocked. Method actionClick()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateBlocked', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionClick button  ).not.toThrow()


  describe 'Unit. Abstract AbButtonStateBlocked. Method actionMouseOver()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateBlocked', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionMouseOver button  ).not.toThrow()

  describe 'Unit. Abstract AbButtonStateBlocked. Method actionMouseOut()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateBlocked', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionMouseOut button  ).not.toThrow()