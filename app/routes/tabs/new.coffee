`import Ember from 'ember';`

TabsNewRoute = Ember.Route.extend
  controllerName: 'tab'

  renderTemplate: ->
    @render('tab')

  model: ->
    # @store.createRecord 'tab',
    #   billCents: defaultValue: 5842
    #   selectedTipPercent: 20
    #   rounding: 'exact'
    #   split: 'evenly'
    #   numberParticipants: 4
    @store.createRecord('tab')

`export default TabsNewRoute;`