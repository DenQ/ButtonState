describe 'Unit. Interface IListener', =>

  it 'Интерфейс существует', ->
    expression = typeof IListener is "function"
    expect(expression).toBeTruthy()


  it 'При создании экземпляра должно возникать исключение', =>
    expect( IListener ).toThrow()