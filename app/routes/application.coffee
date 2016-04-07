`import Ember from 'ember';`

Step = Ember.Object.extend
  componentName: null
  title: null
  description: null

ApplicationRoute = Ember.Route.extend

  model: ->
    @store.createRecord('tab')

  setupController: (controller, model) ->
    @_super(controller, model)

    steps = [
      componentName: 'bill-total-input'
      title: 'Bill Total'
      description: 'Enter the total including tax'
    ,
      componentName: 'tip-percent-select'
      title: 'Tip'
      description: 'Choose a percentage'
    ,
      componentName: 'rounding-select'
      title: 'Round Total'
      description: 'It\'s easier when using cash'
    ,
      componentName: 'total-summary'
      title: 'Summary'
    ,
      componentName: 'participants-select'
      title: 'Participants'
      description: 'Enter only paying participants'
    ,
      componentName: 'split-select'
      title: 'Split'
      description: 'How should the bill be splitted?'
    ,
      componentName: 'share-summary'
      title: 'Share Summary'
      description: 'Here is what everyone owes you'
    ]

    controller.set('steps', steps.map (step) ->
      Step.create(step)
    )

`export default ApplicationRoute;`