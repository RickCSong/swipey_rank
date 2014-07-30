SwipeyRank.RankingsRoute = Ember.Route.extend
  model: ->
    $.getJSON('/rankings.json').then (rankings) ->
      SwipeyRank.Utils.camelizeArray(rankings)

  afterModel: ->
    Ember.run.later this, ->
      @refresh()
    , 1000
