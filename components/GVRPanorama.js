import React, { Component, PropTypes } from 'react'
import { requireNativeComponent, Image } from 'react-native'


class PanoramaView extends Component {
  render() {
    return <RCTPanoramaView {...this.props} />
  }
}

PanoramaView.propTypes = {
  image: Image.propTypes.source,
  imageUrl: PropTypes.string,
  displayMode: PropTypes.string,
  enableFullscreenButton: PropTypes.bool,
  enableCardboardButton: PropTypes.bool,
  enableInfoButton: PropTypes.bool,
  enableTouchTracking: PropTypes.bool,
  hidesTransitionView: PropTypes.bool,
}



// requireNativeComponent automatically resolves this to "PanoramaManager"
var RCTPanoramaView = requireNativeComponent('Panorama', PanoramaView);
export default PanoramaView;
