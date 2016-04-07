`import Ember from 'ember';`

BillTotalInputComponent = Ember.Component.extend
  classNames: ['bill-total-input']

  billTotal: Ember.computed.oneWay('tab.billDollars')

  actions:
    submit: ->
      billCents = parseFloat(@get('billTotal'))*100
      @set('tab.billCents', billCents)
      @sendAction('submit')

    focusOut: ->
      console.log('sdgdsfgdfgdfgdsfgdf')

`export default BillTotalInputComponent;`