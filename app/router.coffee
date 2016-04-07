`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'tabs', ->
    @route 'tab', { resetNamespace: true }, ->

`export default Router;`
