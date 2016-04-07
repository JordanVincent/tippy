`import DS from "ember-data";`
`import Ember from "ember";`

toDollars = (cents) ->
  (cents/100).toFixed(2)

Tab = DS.Model.extend
  billCents: DS.attr({defaultValue: 5842})
  selectedTipPercent: DS.attr({defaultValue: 20})

  # {'up', 'down', 'exact'}
  rounding: DS.attr({defaultValue: 'exact'})

  # {'evenly', 'custom'}
  split: DS.attr({defaultValue: 'evenly'})

  numberParticipants: DS.attr({defaultValue: 4})

  participants: ( ->
    perParticipant = (@get('totalDollars')/@get('numberParticipants')).toFixed(2)
    [1..@get('numberParticipants')].map ->
      perParticipant
  ).property('numberParticipants', 'totalDollars')

  totalExactCents: ( ->
    Math.round(@get('billCents')*(1+@get('selectedTipPercent')/100))
  ).property('billCents', 'selectedTipPercent')

  totalDownDollars: ( ->
    Math.floor(@get('totalExactCents')/100)
  ).property('totalExactCents')

  totalUpDollars: ( ->
    Math.ceil(@get('totalExactCents')/100)
  ).property('totalExactCents')

  totalCents: ( ->
    switch @get('rounding')
      when 'down' then @get('totalDownDollars')*100
      when 'up' then @get('totalUpDollars')*100
      else @get('totalExactCents')
  ).property('totalExactCents', 'totalUpDollars', 'totalDownDollars', 'rounding')

  tipCents: ( ->
    @get('totalCents') - @get('billCents')
  ).property('billCents', 'totalCents')

  tipPercent: ( ->
    Math.round(@get('tipCents')/@get('billCents')*100)
  ).property('billCents', 'tipCents')

  totalDollars: ( ->
    toDollars @get('totalCents')
  ).property('totalCents')

  totalExactDollars: ( ->
    toDollars @get('totalExactCents')
  ).property('totalExactCents')

  billDollars: ( ->
    toDollars @get('billCents')
  ).property('billCents')

  tipDollars: ( ->
    toDollars @get('tipCents')
  ).property('tipCents')

`export default Tab;`