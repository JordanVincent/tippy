`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'tabs', { path: '/' }, ->
    @route 'new'
  @route 'tab', { path: 'tabs/:tab_id' }

`export default Router;`
