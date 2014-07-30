SwipeyRank.RankingsIndexItemController = Ember.ObjectController.extend({
  rank: 0

  isFlipping: (->
    @get('maxBackflips') > 0
  ).property('maxBackflips')
})

