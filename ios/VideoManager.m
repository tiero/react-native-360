//
//  PanoramaManager.m
//  panorama
//
//  Created by Marco Argentieri on 28/12/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "VideoManager.h"

#import "VideoView.h"
#import <UIKit/UIKit.h>

@implementation VideoManager

RCT_EXPORT_MODULE();

- (UIView *)view
{
  return [VideoView new];
}

RCT_EXPORT_VIEW_PROPERTY(enableFullscreenButton, BOOL);
RCT_EXPORT_VIEW_PROPERTY(enableCardboardButton, BOOL);
RCT_EXPORT_VIEW_PROPERTY(enableTouchTracking, BOOL);
RCT_EXPORT_VIEW_PROPERTY(hidesTransitionView, BOOL);
RCT_EXPORT_VIEW_PROPERTY(enableInfoButton, BOOL);
RCT_EXPORT_VIEW_PROPERTY(displayMode, NSString);
RCT_EXPORT_VIEW_PROPERTY(video, NSDictionary);
RCT_EXPORT_VIEW_PROPERTY(volume, float)



@end
