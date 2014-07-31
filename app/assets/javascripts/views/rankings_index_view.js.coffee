#= require ./rankings_list_view

SwipeyRank.RankingsIndexView = Ember.View.extend
  templateName: 'rankings/index'

  # 30 Seconds
  timeout: 30 * 1000

  listView: SwipeyRank.RankingsListView.create(
    contentBinding: 'controller.filteredContent'
  )

  touchStart: ->
    Ember.run.debounce this, @executeTimeout, @get('timeout')

  touchMove: ->
    Ember.run.debounce this, @executeTimeout, @get('timeout')

  mouseDown: ->
    Ember.run.debounce this, @executeTimeout, @get('timeout')

  mouseMove: ->
    Ember.run.debounce this, @executeTimeout, @get('timeout')

  keyDown: ->
    Ember.run.debounce this, @executeTimeout, @get('timeout')

  executeTimeout: ->
    Ember.run =>
      @get('controller').send('resetFilter')
      Ember.run.next =>
        @get('listView').scrollTo(0)
