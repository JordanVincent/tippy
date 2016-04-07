`import Ember from 'ember';`

TotalSummaryComponent = Ember.Component.extend
  classNames: ['total-summary']

  actions:
    submit: ->
      @sendAction('submit')

`export default TotalSummaryComponent;`