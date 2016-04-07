`import Ember from 'ember';`

TabsRoute = Ember.Route.extend

  model: ->
    @store.findAll('tab')

  actions:
    new: ->
      @transitionTo('tabs.new')

`export default TabsRoute;`