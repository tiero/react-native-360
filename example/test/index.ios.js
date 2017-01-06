/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';
import { PanoramaView } from 'react-native-360'

export default class test extends Component {
  render() {
    return <PanoramaView 
                style={{height:200,width:300}}
                image={require('./andes.jpg')}
                displayMode={'embedded'}
                enableFullscreenButton
                enableCardboardButton
                enableTouchTracking
                hidesTransitionView
                enableInfoButton={false}              
            /> 
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('test', () => test);
