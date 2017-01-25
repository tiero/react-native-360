# react-native-360
 A React Native wrapper for [Google VR Cardboard SDK](https://developers.google.com/vr/). 
 
 > The Android wrapper is still in progress, stay tuned 
 
## Index

1. [Description](#1-description)
2. [Installation](#2-installation)
3. [Usage](#3-usage)
4. [Credits](#4-credits)
5. [Roadmap](#5-changelog)
6. [License](#6-license)



### 1. Description

**React Native 360** exploits [Google VR Cardboard SDK](https://developers.google.com/vr/) to load and display 360-degree panoramic photos and to define a view that renders a 360 video using OpenGL

> The iOS Google VR SDK works only with a real device [#3](https://github.com/tiero/react-native-360/issues/3) 

### 2. Installation

You can pull in react-native-360 via npm:

```shell
npm install react-native-360 --save
```

in ios folder create a **Podfile**

```shell
target 'myProject' do
  pod 'GVRSDK/GVRView'
  pod 'React', :path => ‘../node_modules/react-native', :subspecs => [
  'Core',
  'RCTImage',
  'RCTNetwork',
  'RCTText',
  'RCTWebSocket',
  ]
end

```

Still in ios folder install pods locally

```shell
pod install 
pod update
```

- Open `myProject.xcworkspace` and under `myProject` > `Build Settings` under `Build Options` set **ENABLE BITCODE** to **NO**
- Drag the folder `RNGoogleVR` from `node_modules/react-native-360/ios` under your `myProject` and be sure to check `Copy items if needed` and `Create groups`


### 3. Usage 

**Video Example**

```js
import { VideoView } from 'react-native-360';
```

```js
<VideoView 
    style={{height:200,width:width}}
    video={{ uri:'https://raw.githubusercontent.com/googlevr/gvr-ios-sdk/master/Samples/VideoWidgetDemo/resources/congo.mp4',
             type: 'stereo'}}
    displayMode={'embedded'}
    volume={1}
    enableFullscreenButton
    enableCardboardButton
    enableTouchTracking
    hidesTransitionView
    enableInfoButton={false}              
/>            
```

**Panorama Example**

```js
import { PanoramaView } from 'react-native-360';
```

```js
<PanoramaView 
    style={{height:200,width:width}}
    image={require('./andes.jpg')}
    displayMode={'embedded'}
    enableFullscreenButton
    enableCardboardButton
    enableTouchTracking
    hidesTransitionView
    enableInfoButton={false}              
/>   
```

### API



## VideoView

| Prop | Type | Description | Values
|---|---|---|---|
| `volume` | number  | Defines a volume multiplier between 0.0f and 1.0f on the media audio playback | 1
| `video` | object | Load a local or remote video from a url and start playing | {uri:'https://uri-example.com', type: 'stereo','mono'}
| `enableFullscreenButton` | bool  | Displays a button that allows the user to transition to fullscreen mode. |
| `enableCardboardButton` | bool | Displays a button that allows the user to transition to fullscreen Cardboard VR mode.|
| `enableTouchTracking`  | bool | Enables touch gesture detection for manual heading control. |
| `enableInfoButton`  | bool | Displays a button that allows the user to get more information about VRView |
| `hidesTransitionView`  | bool | Hides the transition view when entering VR mode |
| `displayMode`  | string | Controls the current GVRWidgetDisplayMode of the widget view | 'fullscreen','cardboard', 'embedded' 


## PanoramaView

| Prop | Type | Description | Values
|---|---|---|---|
| `image` | Image.propTypes.source | Load a 360-Panorama image from UIImage of type stereo. | require('./image360.jpg')
| `enableFullscreenButton` | bool  | Displays a button that allows the user to transition to fullscreen mode. | 
| `enableCardboardButton` | bool | Displays a button that allows the user to transition to fullscreen Cardboard VR mode. |
| `enableTouchTracking`  | bool | Enables touch gesture detection for manual heading control. |
| `enableInfoButton`  | bool | Displays a button that allows the user to get more information about VRView |
| `hidesTransitionView`  | bool | Hides the transition view when entering VR mode |
| `displayMode`  | string | Controls the current GVRWidgetDisplayMode of the widget view | 'fullscreen','cardboard', 'embedded'


### 4. Credits

This Native UI component leverages the [Google VR Android SDK](https://developers.google.com/vr/android) and the [Google VR iOS SDK](https://developers.google.com/vr/ios) for all the heavy liftings.

### 5. Roadmap
- [x] **iOS**
    - [x] **PanoramaView**
    - [x] **VideoView**
- [ ] Android 
    - [ ] PanoramaView
    - [ ] VideoView

**TODO**
- [ ] [iOS] Load 360 image from network

### 6. License

MIT License

Copyright (c) 2017 Marco Argentieri

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
