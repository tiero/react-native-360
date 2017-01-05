/*
 * @Author: tiero 
 * @Date: 2017-01-05 17:39:15 
 * @Last Modified by: tiero
 * @Last Modified time: 2017-01-05 17:40:04
 */
import React, { Component, PropTypes } from 'react'
import { requireNativeComponent } from 'react-native'

class VideoView extends Component {
  render() {
    return <RCTViedoView {...this.props} />
  }
}

VideoView.propTypes = {
  video: PropTypes.shape({
    uri: PropTypes.string.isRequired,
    type: PropTypes.string.isRequired,
  }).isRequired,
  videoType: PropTypes.string,
  volume: PropTypes.number,
  displayMode: PropTypes.string,
  enableFullscreenButton: PropTypes.bool,
  enableCardboardButton: PropTypes.bool,
  enableInfoButton: PropTypes.bool,
  enableTouchTracking: PropTypes.bool,
  hidesTransitionView: PropTypes.bool,
}

// requireNativeComponent automatically resolves this to "VideoManager"
var RCTViedoView = requireNativeComponent('Video', VideoView);
export default VideoView;
