#= require ./rankings_list_view

SwipeyRank.StatsView = Ember.View.extend
  templateName: 'stats'

  didInsertElement: ->
    $('#carousel').carouFredSel
      width: 2560
      direction: "left"
      scroll:
        items: 1
        easing: "easeOut"
        duration: 2000
        timeoutDuration: 500
        pauseOnHover: false