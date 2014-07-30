# for more details see: http://emberjs.com/guides/views/

SwipeyRank.RankingsIndexView = Ember.View.extend
  templateName: 'rankings/index'

  # 30 Seconds
  timeout: 1000 * 30

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
    @get('controller').send('resetFilter')
    window.scrollTo(0, 0)
