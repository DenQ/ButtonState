$.fn.bs = (options) ->
  options.owner = @selector
  btn = new BootstrapButton null, options
  return @
