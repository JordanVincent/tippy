`import Ember from 'ember';`

StepFormattedValueComponent = Ember.Component.extend
  value: ( ->
    switch @get('step.componentName')
      when 'bill-total-input' then '$' + @get('tab.billDollars')
      when 'tip-percent-select' then @get('tab.tipPercent') + '% ($' + @get('tab.tipDollars') + ')'
      when 'rounding-select'
        switch @get('tab.rounding')
          when 'down' then 'Rounded Down'
          when 'exact' then 'Exact'
          when 'up' then 'Rounded Up'
      when 'total-summary' then '$' + @get('tab.totalDollars')
      when 'participants-select' then @get('tab.numberParticipants')
      when 'split-select' then Ember.String.capitalize @get('tab.split')
      else ''
  ).property('tab.{billDollars,tipPercent,tipDollars,rounding}', 'step.componentName')

`export default StepFormattedValueComponent;`