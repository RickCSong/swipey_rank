SwipeyRank.Router.reopen
  location: if window.history.pushState then 'history' else 'hash'

SwipeyRank.Router.map ()->
  @resource 'rankings', ->
  @resource 'stats', ->

