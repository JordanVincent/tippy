`import Ember from 'ember';`

TabRoute = Ember.Route.extend

  setupController: (controller, model) ->
    @_super(controller, model)

    # controller.setProperties(
    #   stepIndex: 6
    #   lastActiveStepIndex: 6
    # )

`export default TabRoute;`