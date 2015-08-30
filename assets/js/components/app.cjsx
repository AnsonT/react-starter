React = require 'react'

Bootstrap = require 'react-bootstrap'
Nav = Bootstrap.Nav
Navbar = Bootstrap.Navbar
NavItem = Bootstrap.NavItem

Router = require 'react-router'
Link = Router.Link

require 'stylesheets/components/app.less'

App = React.createClass

    mixins: [Router.State]

    getInitialState: ->
        {}

    render : ->
        <div>
            {this.topNavbar()}
            <div classNam="app-container">
                <Router.RouteHandler />
            </div>
        </div>

    topNavbar: ->

        noBottomMargin = 
            marginBottom: '0px'

        <Navbar className="app-header" style={noBottomMargin} >
            <header className=" navbar-static-top ">
                <div className="app-header-container container">
                    <div className="navbar-header">
                        <Link to="home" className="app-header-brand navbar-brand">app title</Link>
                        <button className="app-header-toggle navbar-toggle" type="button" onClick={@onNavBtnOnClick}>
                            <span className="sr-only">Toggle Nav</span>
                            <span className="icon-bar"></span>
                            <span className="icon-bar"></span>
                            <span className="icon-bar"></span>
                        </button>
                    </div>
                    {this.topNavLinks()}
                </div>
            </header>
        </Navbar>

    topNavLinks: ->
        <Nav navbar={true} collapsable={true} pullRight={@state.isPullRight}
            className="fud-navbar-collapse" role="navigation" id="top" bsClass="nav"
            expanded={@state.isExpanded}>

            <li><Link to="foo">Foo 2</Link></li>
            <li><Link to="foo">Foo 1</Link></li>
        </Nav>

    onNavBtnOnClick: ->
        currentIsExpanded = @state.isExpanded
        @setState
            isExpanded: !currentIsExpanded

module.exports = App
