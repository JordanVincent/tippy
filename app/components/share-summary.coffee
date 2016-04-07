`import Ember from 'ember';`

ShareSummaryComponent = Ember.Component.extend
  classNames: ['share-summary']

  actions:
    submit: ->
      @sendAction('submit')

`export default ShareSummaryComponent;`