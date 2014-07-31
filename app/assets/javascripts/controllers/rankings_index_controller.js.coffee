# for more details see: http://emberjs.com/guides/controllers/

SwipeyRank.RankingsIndexController = Ember.ArrayController.extend({
  sortProperties: 'maxScore maxBackflips'.w()
  sortAscending: false

  query: ''

  rankedContent: ( ->
    arrangedContent = @get('arrangedContent')
    rank = 1

    arrangedContent.map (item, index) ->
      if item.maxScore != arrangedContent[index - 1]?.maxScore
        rank = index + 1

      rankObject = Ember.Object.create(item)
      rankObject.set('rank', rank)
      rankObject.set('isFlipping', rankObject.get('maxBackflips') > 0)
      rankObject
  ).property('arrangedContent.@each')

  filteredContent: ( ->
    content = @get('rankedContent')
    query = new RegExp(RegExp.escape(@get('query')), 'i')

    unless Ember.empty(query)
      content = content?.filter (c) ->
        c.get('fullName').match(query)

    content
  ).property('rankedContent.@each', 'query')

  actions:
    resetFilter: ->
      @set('query', '')
})
