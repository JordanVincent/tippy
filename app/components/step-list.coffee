`import Ember from 'ember';`

Step = Ember.Object.extend
  componentName: null
  title: null
  description: null

StepListComponent = Ember.Component.extend

  stepIndex: 0
  lastActiveStepIndex: 0

  steps: ( ->
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

    steps.map (step) ->
      Step.create(step)
  ).property()

  activeStep: ( ->
    @get('steps').objectAt(@get('stepIndex'))
  ).property('steps.[]', 'stepIndex')

  visibleSteps: ( ->
    @get('steps').slice 0, (@get('lastActiveStepIndex') + 1)
  ).property('steps.[]', 'lastActiveStepIndex')

  focusStep: ->
    Ember.run.later =>
      itemH = 65;
      index = @get('stepIndex')
      items = Ember.A($('.step-item').toArray())

      scroll = 16
      scroll += itemH*(index-1) if index > 0

      $('.mdl-layout__content').animate({
        scrollTop: scroll
      }, 500)

      activeItem = items.objectAt(index)
      inactiveItems = items.removeObject(activeItem)

      $(inactiveItems).animate({
        'min-height': 0
      }, 500)

      previousItemH = if index > 0 then itemH else 0
      nextItemH = if index < @get('lastActiveStepIndex') then itemH else 0
      pageH = $('.mdl-layout__content').height()

      $(activeItem).animate({
        'min-height': pageH - nextItemH - previousItemH
      }, 500)

    , 100

  setup: ( ->
    index = 0
    index = 3 if @get('tab.rounding')
    index = 6 if @get('tab.split')

    @setProperties
      stepIndex: index
      lastActiveStepIndex: index

    @focusStep()
  ).observes('tab').on('didInsertElement')

  actions:
    submit: (quit) ->
      return @sendAction('quit') if quit

      @incrementProperty('stepIndex')
      @set('lastActiveStepIndex', @get('stepIndex')) if @get('stepIndex') > @get('lastActiveStepIndex')

      @focusStep()

    activate: (step) ->
      @set 'stepIndex', @get('steps').indexOf(step)
      @focusStep()

`export default StepListComponent;`