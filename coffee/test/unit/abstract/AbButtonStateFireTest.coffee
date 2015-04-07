describe 'Unit. Abstract AbButtonStateFire', =>

  it 'Класс существует', ->
    expression = typeof AbButtonStateFire is "function"
    expect(expression).toBeTruthy()

  describe 'Unit. Abstract AbButtonStateFire. Method constructor()', =>

    it 'Метод должен быть переопределен', =>
      expect( => AbButtonFixture 'AbButtonStateFire', JsonFixture::Get() ).not.toThrow()


  describe 'Unit. Abstract AbButtonStateFire. Method actionClick()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateFire', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionClick button  ).not.toThrow()


  describe 'Unit. Abstract AbButtonStateFire. Method actionMouseOver()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateFire', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionMouseOver button  ).not.toThrow()

  describe 'Unit. Abstract AbButtonStateFire. Method actionMouseOut()', =>

    it 'Метод должен быть переопределен', =>
      button = AbButtonFixture 'AbButtonStateFire', JsonFixture::Get()
      state = button.getState()
      expect( => state.actionMouseOut button  ).not.toThrow()