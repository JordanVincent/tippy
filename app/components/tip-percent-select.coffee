`import Ember from 'ember';`

TipPercentSelectComponent = Ember.Component.extend

  tip10Dollars: ( ->
    (@get('tab.billCents')*0.001).toFixed(2)
  ).property('tab.billCents')

  tip15Dollars: ( ->
    (@get('tab.billCents')*0.0015).toFixed(2)
  ).property('tab.billCents')

  tip20Dollars: ( ->
    (@get('tab.billCents')*0.002).toFixed(2)
  ).property('tab.billCents')

  actions:
    submit: (tip) ->
      @set('tab.selectedTipPercent', tip)
      @sendAction('submit')

`export default TipPercentSelectComponent;`