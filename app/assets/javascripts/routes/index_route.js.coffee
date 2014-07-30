SwipeyRank.IndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'rankings'
    # NOTE: Be careful not to return the promise returned by #transitionTo,
    # otherwise we end up in a weird situation where the transition is waiting
    # for itself.
    return
