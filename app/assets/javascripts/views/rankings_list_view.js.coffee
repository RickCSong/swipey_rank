#= require ./rankings_list_item_view

SwipeyRank.RankingsListView = Ember.VirtualListView.extend
  classNames: 'rank-list'

  height: ( ->
    @computeHeight()
  ).property()
  rowHeight: 100

  itemViewClass: SwipeyRank.RankingsListItemView.extend()

  didAdjustOnResize: (->
    $(window).resize =>
      @set('height', @computeHeight())
  ).on('didInsertElement')

  computeHeight: ->
    $(window).height() - 34 - 71 - 30
