SwipeyRank.Utils = {}

SwipeyRank.Utils.camelizeObject = (obj) ->
  camelized = {}
  for own key, value of obj
    camelized[key.toString().camelize()] = value
  camelized

SwipeyRank.Utils.camelizeArray = (arr) ->
  camelized = []
  for value, i in arr
    switch Ember.typeOf(value)
      when 'array' then camelized[i] = SwipeyRank.Utils.camelizeArray(value)
      when 'object' then camelized[i] = SwipeyRank.Utils.camelizeObject(value)
      else camelized[i] = value
  camelized

RegExp.escape = (s) ->
  String(s).replace(/([-()\[\]{}+?*.$\^|,:#<!\\])/g, '\\$1').replace(/\x08/g, '\\x08')