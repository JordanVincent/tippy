`import Ember from 'ember';`

ParticipantsSelectComponent = Ember.Component.extend

  actions:
    submit: (numberParticipants) ->
      @set('tab.numberParticipants', numberParticipants)
      @sendAction('submit')

`export default ParticipantsSelectComponent;`