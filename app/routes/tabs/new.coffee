`import Ember from 'ember';`

TabsNewRoute = Ember.Route.extend
  controllerName: 'tab'

  renderTemplate: ->
    @render('tab')

  model: ->
    @store.createRecord('tab')

`export default TabsNewRoute;`