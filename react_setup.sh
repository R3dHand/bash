#!/bin/bash
echo "running react_setup..."

# will install create-react-app@1.5.2
# cmd.exe /c npm install -g create-react-app@1.5.2

# create react app <name of app>
echo "Enter name of your react app..."
read app
# create app
# cmd.exe /c create-react-app ${app}
cmd.exe /c yarn create react-app ${app}
# change directory to new app
cmd.exe /c cd "./${app}"
# compile and open in browser
cmd.exe /c cd yarn start

# create directories for components, redux, shared
cmd.exe /c md "./src/redux"
cmd.exe /c md "./src/components"
cmd.exe /c md "./src/shared"

# bootstrap
cmd.ex /c yarn add bootstrap@4.0.0
# add to index.js before line with 'import './index.css';'
# import 'bootstrap/dist/css/bootstrap.min.css';
#add necessary lines to package.json
if [[ -f "temp.js" ]]; then
    rm temp.js
fi
sed "/scripts/ a\ import 'bootstrap/dist/css/bootstrap.min.css\';" <./index.js >temp.js
printf "%s" "$(cat temp.json)" > ./index.js

cmd.exe /c yarn add reactstrap@5.0.0
cmd.exe /c yarn add react-popper@0.9.2

#react router
cmd.exe /c yarn add react-router-dom@4.2.2

# create header
# imports
echo "import React, { Component } from 'react';" > ./src/components/HeaderComponent.js
echo "import { Navbar, NavbarBrand, Nav, NavbarToggler, Collapse, NavItem, Jumbotron, Button, Modal, ModalHeader, ModalBody, Form, FormGroup, Label, Input } from 'reactstrap';" >> ./src/components/HeaderComponent.js
echo "import { NavLink } from 'react-router-dom';" >> ./src/components/HeaderComponent.js

# create Header class
echo "" >> ./src/components/HeaderComponent.js
echo "class Header extends Component {" >> ./src/components/HeaderComponent.js
echo "    constructor(props) {" >> ./src/components/HeaderComponent.js
echo "        super(props);" >> ./src/components/HeaderComponent.js
echo "        this.state = {" >> ./src/components/HeaderComponent.js
echo "            isNavOpen: false," >> ./src/components/HeaderComponent.js
echo "            isModalOpen: false" >> ./src/components/HeaderComponent.js
echo "        }" >> ./src/components/HeaderComponent.js
echo "        this.toggleNav = this.toggleNav.bind(this);" >> ./src/components/HeaderComponent.js
echo "        this.toggleModal = this.toggleModal.bind(this);" >> ./src/components/HeaderComponent.js
echo "        this.handleLogin = this.handleLogin.bind(this);" >> ./src/components/HeaderComponent.js
echo "    }" >> ./src/components/HeaderComponent.js
echo "" >> ./src/components/HeaderComponent.js
echo "    toggleNav() {" >> ./src/components/HeaderComponent.js
echo "        this.setState({" >> ./src/components/HeaderComponent.js
echo "            isNavOpen: !this.state.isNavOpen," >> ./src/components/HeaderComponent.js
echo "        });" >> ./src/components/HeaderComponent.js
echo "    }" >> ./src/components/HeaderComponent.js
echo "" >> ./src/components/HeaderComponent.js
echo "    toggleModal() {" >> ./src/components/HeaderComponent.js
echo "        this.setState({" >> ./src/components/HeaderComponent.js
echo "            isModalOpen: !this.state.isModalOpen" >> ./src/components/HeaderComponent.js
echo "        });" >> ./src/components/HeaderComponent.js
echo "    }" >> ./src/components/HeaderComponent.js
echo "" >> ./src/components/HeaderComponent.js
echo "    handleLogin(event) {" >> ./src/components/HeaderComponent.js
echo "        this.toggleModal();" >> ./src/components/HeaderComponent.js
echo "        event.preventDefault();" >> ./src/components/HeaderComponent.js
echo "    }" >> ./src/components/HeaderComponent.js
echo "" >> ./src/components/HeaderComponent.js
echo "    render () {" >> ./src/components/HeaderComponent.js
echo "        return(" >> ./src/components/HeaderComponent.js
echo "            <React.Fragment>" >> ./src/components/HeaderComponent.js
echo "                <Navbar dark expand=\"md\">" >> ./src/components/HeaderComponent.js
echo "                    <div className=\"container\">" >> ./src/components/HeaderComponent.js
echo "                        <NavbarToggler onClick={this.toggleNav} />" >> ./src/components/HeaderComponent.js
echo "                        <NavbarBrand className=\"mr-auto\" href=\"/\">" >> ./src/components/HeaderComponent.js
echo "                            <img src=\"image.png\" height=\"30\" width=\"41\" alt=\"Logo\" />" >> ./src/components/HeaderComponent.js
echo "                        </NavbarBrand>" >> ./src/components/HeaderComponent.js
echo "                        <Collapse isOpen={this.state.isNavOpen} navbar>" >> ./src/components/HeaderComponent.js
echo "                            <Nav navbar>" >> ./src/components/HeaderComponent.js
echo "                                <NavItem>" >> ./src/components/HeaderComponent.js
echo "                                    <NavLink className=\"nav-link\" to=\"/home\">" >> ./src/components/HeaderComponent.js
echo "                                        Link" >> ./src/components/HeaderComponent.js
echo "                                    </NavLink>" >> ./src/components/HeaderComponent.js
echo "                                </NavItem>" >> ./src/components/HeaderComponent.js
echo "                            </Nav>" >> ./src/components/HeaderComponent.js
echo "                            <Nav className="ml-auto" navbar>" >> ./src/components/HeaderComponent.js
echo "                                <NavItem>" >> ./src/components/HeaderComponent.js
echo "                                    <Button outline onClick={this.toggleModal}>" >> ./src/components/HeaderComponent.js
echo "                                        <span className=\"fa fa-sign-in fa-lg\"> Login</span>" >> ./src/components/HeaderComponent.js
echo "                                    </Button>" >> ./src/components/HeaderComponent.js
echo "                                </NavItem>" >> ./src/components/HeaderComponent.js
echo "                            </Nav>" >> ./src/components/HeaderComponent.js
echo "                        </Collapse>" >> ./src/components/HeaderComponent.js
echo "                    </div>" >> ./src/components/HeaderComponent.js
echo "                </Navbar>" >> ./src/components/HeaderComponent.js
echo "                <Jumbotron>" >> ./src/components/HeaderComponent.js
echo "                    <div className=\"container\">" >> ./src/components/HeaderComponent.js
echo "                        <div className=\"row row-header\">" >> ./src/components/HeaderComponent.js
echo "                            <div className=\"col-12 col-sm-6\">" >> ./src/components/HeaderComponent.js
echo "                                <h1>Jumbotron</h1>" >> ./src/components/HeaderComponent.js
echo "                                <p>Paragraph</p>" >> ./src/components/HeaderComponent.js
echo "                            </div>" >> ./src/components/HeaderComponent.js
echo "                        </div>" >> ./src/components/HeaderComponent.js
echo "                    </div>" >> ./src/components/HeaderComponent.js
echo "                </Jumbotron>" >> ./src/components/HeaderComponent.js
echo "                <Modal isOpen={this.state.isModalOpen} toggle={this.toggleModal}>" >> ./src/components/HeaderComponent.js
echo "                    <ModalHeader toggle={this.toggleModal}>Login</ModalHeader>" >> ./src/components/HeaderComponent.js
echo "                    <ModalBody>" >> ./src/components/HeaderComponent.js
echo "                        <Form onSubmit={this.handleLogin}>" >> ./src/components/HeaderComponent.js
echo "                            <FormGroup>" >> ./src/components/HeaderComponent.js
echo "                                <Label htmlFor='username'>Username</Label>" >> ./src/components/HeaderComponent.js
echo "                                <Input type=\"text\"" >> ./src/components/HeaderComponent.js
echo "                                       id=\"username\"" >> ./src/components/HeaderComponent.js
echo "                                       name=\"username\"" >> ./src/components/HeaderComponent.js
echo "                                       innerRef={(input) => this.username = input} />" >> ./src/components/HeaderComponent.js
echo "                            </FormGroup>" >> ./src/components/HeaderComponent.js
echo "                            <FormGroup>" >> ./src/components/HeaderComponent.js
echo "                                <Label htmlFor="password">Password</Label>" >> ./src/components/HeaderComponent.js
echo "                                <Input type=\"password\"" >> ./src/components/HeaderComponent.js
echo "                                       id=\"password\"" >> ./src/components/HeaderComponent.js
echo "                                       name=\"password\"" >> ./src/components/HeaderComponent.js
echo "                                       innerRef={(input) => this.password = input} />" >> ./src/components/HeaderComponent.js
echo "                            </FormGroup>" >> ./src/components/HeaderComponent.js
echo "                            <FormGroup check>" >> ./src/components/HeaderComponent.js
echo "                                <Label check>" >> ./src/components/HeaderComponent.js
echo "                                    <Input type="checkbox"" >> ./src/components/HeaderComponent.js
echo "                                           name=\"remember\"" >> ./src/components/HeaderComponent.js
echo "                                           innerRef={(input) => this.remember = input} /> Remember Me" >> ./src/components/HeaderComponent.js
echo "                                </Label>" >> ./src/components/HeaderComponent.js
echo "                            </FormGroup>" >> ./src/components/HeaderComponent.js
echo "                            <Button type="submit" value="submit" color="primary">Login</Button>" >> ./src/components/HeaderComponent.js
echo "                        </Form>" >> ./src/components/HeaderComponent.js
echo "                    </ModalBody>" >> ./src/components/HeaderComponent.js
echo "                </Modal>" >> ./src/components/HeaderComponent.js
echo "            </React.Fragment>" >> ./src/components/HeaderComponent.js
echo "        );" >> ./src/components/HeaderComponent.js
echo "    }" >> ./src/components/HeaderComponent.js
echo "}" >> ./src/components/HeaderComponent.js
echo "" >> ./src/components/HeaderComponent.js
echo "export default Header;" >> ./src/components/HeaderComponent.js

# create footer
echo "import React from 'react';" > ./src/components/FooterComponent.js
echo "import { Link } from 'react-router-dom';" >> ./src/components/FooterComponent.js
echo "" >> ./src/components/FooterComponent.js
echo "function Footer(props) {" >> ./src/components/FooterComponent.js
echo "    return(" >> ./src/components/FooterComponent.js
echo "        <div className=\"footer\">" >> ./src/components/FooterComponent.js
echo "            <div className=\"container\">" >> ./src/components/FooterComponent.js
echo "                <div className=\"row justify-content-center\">" >> ./src/components/FooterComponent.js
echo "                    <div className=\"col-4 offset-1 col-sm-2\">" >> ./src/components/FooterComponent.js
echo "                        <h5>Links</h5>" >> ./src/components/FooterComponent.js
echo "                        <ul className=\"list-unstyled\">" >> ./src/components/FooterComponent.js
echo "                            <li><Link to=\"/home\">Link</Link></li>" >> ./src/components/FooterComponent.js
echo "                        </ul>" >> ./src/components/FooterComponent.js
echo "                    </div>" >> ./src/components/FooterComponent.js
echo "                    <div className=\"col-7 col-sm-5\">" >> ./src/components/FooterComponent.js
echo "                        <h5>Address</h5>" >> ./src/components/FooterComponent.js
echo "                        <address>" >> ./src/components/FooterComponent.js
echo "                          address<br />" >> ./src/components/FooterComponent.js
echo "                          city, state zip<br />" >> ./src/components/FooterComponent.js
echo "                          country<br />" >> ./src/components/FooterComponent.js
echo "                          <i className=\"fa fa-phone fa-lg\"></i>: +852 1234 5678<br />" >> ./src/components/FooterComponent.js
echo "                          <i className=\"fa fa-fax fa-lg\"></i>: +852 8765 4321<br />" >> ./src/components/FooterComponent.js
echo "                          <i className=\"fa fa-envelope fa-lg\"></i>: <a href="mailto:confusion@food.net">" >> ./src/components/FooterComponent.js
echo "                             email</a>" >> ./src/components/FooterComponent.js
echo "                        </address>" >> ./src/components/FooterComponent.js
echo "                    </div>" >> ./src/components/FooterComponent.js
echo "                    <div className=\"col-12 col-sm-4 align-self-center\">" >> ./src/components/FooterComponent.js
echo "                        <div className=\"text-center\">" >> ./src/components/FooterComponent.js
echo "                            social media" >> ./src/components/FooterComponent.js
echo "                        </div>" >> ./src/components/FooterComponent.js
echo "                    </div>" >> ./src/components/FooterComponent.js
echo "                </div>" >> ./src/components/FooterComponent.js
echo "                <div className=\"row justify-content-center\">" >> ./src/components/FooterComponent.js
echo "                    <div className=\"col-auto\">" >> ./src/components/FooterComponent.js
echo "                        <p>© Copyright 2019 Corey O'Neill</p>" >> ./src/components/FooterComponent.js
echo "                    </div>" >> ./src/components/FooterComponent.js
echo "                </div>" >> ./src/components/FooterComponent.js
echo "            </div>" >> ./src/components/FooterComponent.js
echo "        </div>" >> ./src/components/FooterComponent.js
echo "    );" >> ./src/components/FooterComponent.js
echo "}" >> ./src/components/FooterComponent.js
echo "" >> ./src/components/FooterComponent.js
echo "export default Footer;" >> ./src/components/FooterComponent.js

# create main component
# imports
echo "import React, { Component } from 'react';" > ./src/components/MainComponent.js
echo "import { Switch, Route, Redirect, withRouter } from 'react-router-dom';" >> ./src/components/MainComponent.js
echo "import Header from './HeaderComponent';" >> ./src/components/MainComponent.js
echo "import Footer from './FooterComponent';" >> ./src/components/MainComponent.js
echo "" >> ./src/components/MainComponent.js

# create Main class
echo "class Main extends Component  {" >> ./src/components/MainComponent.js
echo "    constructor(props) {" >> ./src/components/MainComponent.js
echo "        super(props);" >> ./src/components/MainComponent.js
echo "    }" >> ./src/components/MainComponent.js
echo "" >> ./src/components/MainComponent.js
echo "    componentDidMount() {" >> ./src/components/MainComponent.js
echo "    }" >> ./src/components/MainComponent.js
echo "" >> ./src/components/MainComponent.js
echo "    render() {" >> ./src/components/MainComponent.js

# add header switch and footer
echo "        return (" >> ./src/components/MainComponent.js
echo "            <div>" >> ./src/components/MainComponent.js
echo "                <Header />" >> ./src/components/MainComponent.js
echo "                    <Switch>" >> ./src/components/MainComponent.js
echo "                    </Switch>" >> ./src/components/MainComponent.js
echo "                <Footer />" >> ./src/components/MainComponent.js
echo "            </div>" >> ./src/components/MainComponent.js
echo "        );" >> ./src/components/MainComponent.js
echo "    }" >> ./src/components/MainComponent.js
echo "}" >> ./src/components/MainComponent.js
echo "" >> ./src/components/MainComponent.js

# export main
echo "export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Main));" >> ./src/components/MainComponent.js


# seems to be a dependency for bootstrap.min.css
cmd.exe /c yarn add babel-loader@8.0.6



# need to fill in missing


# redux modules
cmd.exe /c yarn add redux@3.7.2
cmd.exe /c yarn add react-redux@5.0.7



# setup configure store file
cmd.exe /c echo "import { createStore } from 'redux';" > ./src/redux/configureStore.js
cmd.exe /c echo "import { Reducer, initialState } from './reducer';" >> ./src/redux/configureStore.js

# setup reducer file
cmd.exe /c echo "// reducer" > ./src/redux/reducer.js

# react-redux-form
cmd.exe /c yarn add react-redux-form@1.16.8

# redux thunk and logger
cmd.exe /c yarn add redux-thunk@2.2.0
cmd.exe /c yarn add redux-logger@3.0.6

# add support for fetch
cmd.exe /c yarn add cross-fetch@2.1.0

# react animations
cmd.exe /c yarn add react-transition-group@2.3.0
cmd.exe /c yarn add react-animation-components@3.0.0
cmd.exe /c yarn add prop-types@15.6.0
