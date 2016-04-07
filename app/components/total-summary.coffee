`import Ember from 'ember';`

TotalSummaryComponent = Ember.Component.extend
  classNames: ['total-summary']

  actions:
    submit: (quit) ->
      @sendAction('submit', quit)

`export default TotalSummaryComponent;`