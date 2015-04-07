class AbListener extends IListener

  json : null
  $owner : null

  constructor:(__json)->
    @__validation __json
    @json = __json
    return @


  __validation:(__json)->
    unless __json?
      throw false
    unless __json.title?
      throw false
    unless __json.defaultState?
      throw false
    unless __json.owner?
      throw false
    if __json.owner?
      unless $(__json.owner).length > 0
        throw false
      @$owner = $(__json.owner)


  getTitle:(state)->
    title = @json.title if @json.title?
    if @json.titles? and state?
      unless state of @json.titles
        throw false
      title = @json.titles[state]
    return title


  setTitle:(title)->
    unless title?
      throw false
    unless title.length > 0
      throw false
    unless typeof title is 'string'
      throw false
    @json.title = title


  getAction:(actionName)->
    unless @json.listener[actionName]?
      throw false
    return @json.listener[actionName]


  getOwner:->
    return @json.owner


  $owner:-> @$owner