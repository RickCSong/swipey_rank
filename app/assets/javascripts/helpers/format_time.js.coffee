Ember.Handlebars.registerBoundHelper 'format-time', (seconds) ->
  if seconds > 60
    "#{Math.floor(seconds / 60)} minutes"
  else
    "#{seconds} seconds"

