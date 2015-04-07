describe 'Unit. Abstract AbListener', =>

  it 'Класс существует', ->
    expression = typeof AbListener is "function"
    expect(expression).toBeTruthy()


  describe 'Unit. Abstract AbListener. Method constructor()', =>

    it 'Метод должен быть переопределен', =>
      expect( => new AbListener JsonFixture::Get() ).not.toThrow()

    it 'Метод не дожен принимать нулевое значение', =>
      expect( => new AbListener null ).toThrow()

    it 'Метод должен содержать поле title', =>
      expect( => new AbListener JsonFixture::GetWithoOtTitle() ).toThrow()

    it 'Метод должен содержать поле defaultState', =>
      expect( => new AbListener JsonFixture::GetWithOtDefaultState() ).toThrow()

    it 'Метод должен содержать поле owner', =>
      expect( => new AbListener JsonFixture::GetWithOtOwner() ).toThrow()

    it 'DOM должен содержать owner', =>
      json = JsonFixture::Get()
      owner = json.owner
      expect( $(owner) ).toExist()

    it 'Метод должен провоцировать исключение, если в доме нет owner', =>
      expect( => new AbListener JsonFixture::GetIncorrectOwner()  ).toThrow()

  describe 'Unit. Abstract AbListener. Method getTitle()', =>

    it 'Метод должен быть переопределен', =>
      listener = new AbListener JsonFixture::Get()
      expect( => listener.getTitle() ).not.toThrow()

    it 'Метод должен возврщать значение', =>
      listener = new AbListener JsonFixture::Get()
      expect( listener.getTitle() ).not.toBeNull()

  describe 'Unit. Abstract AbListener. Method setTitle()', =>

    it 'Метод должен быть переопределен', =>
      listener = new AbListener JsonFixture::Get()
      expect( => listener.setTitle 'my title' ).not.toThrow()


    it 'Метод должен устанавливать значение', =>
      listener = new AbListener JsonFixture::Get()
      title1 = listener.getTitle()
      listener.setTitle 'My Title'
      title2 = listener.getTitle()
      expect( title1 ).not.toEqual title2


    it 'Устанавливаемое значение не должно быть пустым', =>
      listener = new AbListener JsonFixture::Get()
      expect( => listener.setTitle null ).toThrow()

    it 'Устанавливаемое значение должно быть длинее 0', =>
      listener = new AbListener JsonFixture::Get()
      expect( => listener.setTitle '' ).toThrow()

    it 'Устанавливаемое значение должно быть строкой', =>
      listener = new AbListener JsonFixture::Get()
      expect( => listener.setTitle {'object'} ).toThrow()


  describe 'Unit. Abstract AbListener. Method getAction()', =>

    it 'Метод должен быть переопределен', =>
      listener = new AbListener JsonFixture::Get()
      expect( => listener.getTitle 'actionClick' ).not.toThrow()


    it 'Метод должен возвращать function', =>
      listener = new AbListener JsonFixture::Get()
      action = listener.getAction 'actionClick'
      expect( typeof action is 'function' ).toBeTruthy()


    it 'Метод должен бросать исключение, если запрашивается неизвестная функция', =>
      listener = new AbListener JsonFixture::Get()
      expect( => json.listener[actionName] ).toThrow()


  describe 'Unit. Abstract AbListener. Method getOwner()', =>

    it 'Метод должен быть переопределен', =>
      listener = new AbListener JsonFixture::Get()
      expect( => listener.getOwner() ).not.toThrow()


    it 'Метод должен возвращать не пустое значение', =>
      listener = new AbListener JsonFixture::Get()
      owner = listener.getOwner()
      expect( owner ).not.toBeNull()


  describe 'Тестируем кнопу на стандартном наборе входных значений c titles. JsonFixture::GetWithTitles()', =>
    listener = null
    beforeEach =>
      listener = new AbListener JsonFixture::GetWithTitles()
    afterEach =>
      listener = null

    it 'Метод getTitle(state) должен возвращать title при state == "calm"', =>
      expect( listener.getTitle 'calm' ).not.toBeNull()

    it 'Метод getTitle(state) должен возвращать title при state == null', =>
      expect( listener.getTitle() ).not.toBeNull()

    it 'Метод getTitle(state) должен бросать исключение, при state == ???', =>
      expect( => listener.getTitle 'calming' ).toThrow()