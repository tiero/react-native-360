//
//  PanoramaView.h
//  panorama
//
//  Created by Marco Argentieri on 28/12/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTView.h>
#import "GVRVideoView.h"

@interface VideoView : RCTView <GVRVideoViewDelegate>


@property (nonatomic, assign) float volume;
@property (nonatomic, assign) NSDictionary* video;
@property (nonatomic, assign) NSString* displayMode;
@property (nonatomic, assign) BOOL enableFullscreenButton;
@property (nonatomic, assign) BOOL enableCardboardButton;
@property (nonatomic, assign) BOOL enableInfoButton;
@property (nonatomic, assign) BOOL hidesTransitionView;
@property (nonatomic, assign) BOOL enableTouchTracking;

@end
