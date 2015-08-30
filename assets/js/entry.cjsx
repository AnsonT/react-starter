# @jsx React.DOM

React = require('react')

Router = require('react-router')
Route = Router.Route
Routes = Router.Routes
DefaultRoute = Router.DefaultRoute
NotFoundRoute = Router.NotFoundRoute

App = require('./components/app.cjsx')
Home = require('./components/home.cjsx')
Foo = require('./components/foo.cjsx')

routes =
<Route name="app" path="/" handler={App}>
    <Route name="home" handler={Home} />
    <Route name="foo" handler={Foo} />

    <DefaultRoute handler={Home} />
</Route>


Router.run(routes, (Handler) -> React.render(<Handler/>, document.body))