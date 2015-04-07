describe 'Unit. Interface IButton', =>

  it 'Интерфейс существует', ->
    expression = typeof IButton is "function"
    expect(expression).toBeTruthy()


  it 'При создании экземпляра должно возникать исключение', =>
    expect( IButton ).toThrow()
