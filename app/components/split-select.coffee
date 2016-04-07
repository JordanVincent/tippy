`import Ember from 'ember';`

SplitSelectComponent = Ember.Component.extend

  evenlyShareDollars: ( ->
    (@get('tab.totalDollars')/@get('tab.numberParticipants')).toFixed(2)
  ).property('tab.totalDollars', 'tab.numberParticipants')

  actions:
    submit: (split) ->
      @set('tab.split', split)
      @sendAction('submit')

`export default SplitSelectComponent;`