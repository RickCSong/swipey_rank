# for more details see: http://emberjs.com/guides/controllers/

SwipeyRank.RankingsIndexController = Ember.ArrayController.extend({
  sortProperties: 'maxScore'.w()
  sortAscending: false

  query: ''

  rankedContent: ( ->
    arrangedContent = @get('arrangedContent')
    rank = 1

    arrangedContent.map (item, index) ->
      if item.maxScore != arrangedContent[index - 1]?.maxScore
        rank = index + 1

      SwipeyRank.RankingsIndexItemController.create
        content: item
        rank: rank
  ).property('arrangedContent.@each')

  filteredContent: ( ->
    content = @get('rankedContent')
    query = @get('query')

    unless Ember.empty(query)
      content = content?.filter (c) ->
        c.get('fullName').match(query)

    content
  ).property('rankedContent.@each', 'query')

  actions:
    resetFilter: ->
      @set('query', '')
})
