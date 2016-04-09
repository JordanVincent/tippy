`import Ember from 'ember';`

TabController = Ember.Controller.extend

  actions:
    quit: ->
      @get('model').save().then =>
        @transitionToRoute('tabs')

`export default TabController;`