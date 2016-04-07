import Textfield from 'ember-material-lite/components/mdl-textfield';

export default Textfield.extend({
  actions: {
    focusOut: function() {
      this.sendAction('focusOut');
    }
  }
});