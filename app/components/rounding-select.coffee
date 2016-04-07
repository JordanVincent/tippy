`import Ember from 'ember';`

RoundingSelectComponent = Ember.Component.extend

  actions:
    submit: (rounding) ->
      @set('tab.rounding', rounding)
      @sendAction('submit')

`export default RoundingSelectComponent;`