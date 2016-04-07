`import Ember from 'ember';`

Step = Ember.Object.extend
  componentName: null
  title: null
  description: null

TabController = Ember.Controller.extend

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
    index = @get('stepIndex')
    prevIndex = index-1
    items = Ember.A($('.step-item').toArray())

    scroll = 16
    if prevIndex >= 0
      items.slice(0, prevIndex).map (el) ->
        scroll += $(el).outerHeight()

    $('.mdl-layout__content').animate({
      scrollTop: scroll
    }, 500)

    activeItem = items.objectAt(index)
    previousItem = items.objectAt(index-1)
    nextItem = items.objectAt(index+1)
    inactiveItems = items.removeObject(activeItem)

    $(inactiveItems).animate({
      'min-height': 0
    }, 500)

    previousItemH = if previousItem then 64 else 0
    nextItemH = if nextItem then 64 else 0
    pageH = $('.mdl-layout__content').height()

    $(activeItem).animate({
      'min-height': pageH - nextItemH - previousItemH
    }, 500)

  actions:
    submit: (quit) ->
      if quit
        @get('model').save().then =>
          @transitionToRoute('tabs')

      else
        @incrementProperty('stepIndex')
        @set('lastActiveStepIndex', @get('stepIndex')) if @get('stepIndex') > @get('lastActiveStepIndex')

        @focusStep()

    activate: (step) ->
      @set 'stepIndex', @get('steps').indexOf(step)
      @focusStep()

`export default TabController;`