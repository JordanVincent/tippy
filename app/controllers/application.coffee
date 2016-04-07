`import Ember from 'ember';`

ApplicationController = Ember.Controller.extend

  stepIndex: 6
  lastActiveStepIndex: 6

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
    submit: (value) ->
      @incrementProperty('stepIndex')
      @set('lastActiveStepIndex', @get('stepIndex')) if @get('stepIndex') > @get('lastActiveStepIndex')

      @focusStep()

    activate: (step) ->
      @set 'stepIndex', @get('steps').indexOf(step)
      @focusStep()

`export default ApplicationController;`