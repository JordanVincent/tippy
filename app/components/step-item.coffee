`import Ember from 'ember';`

StepItemComponent = Ember.Component.extend
  classNames: ['step-item']
  classNameBindings: ['isActive:active:inactive']

  actions:
    submit: (value) ->
      @sendAction('submit', value)

    activate: ->
      @sendAction('activate', @get('step'))

`export default StepItemComponent;`