describe 'Unit. Interface IButtonState', =>

  it 'Интерфейс существует', ->
    expression = typeof IButtonState is "function"
    expect(expression).toBeTruthy()


  it 'При создании экземпляра должно возникать исключение', =>
    expect(IButtonState).toThrow()
