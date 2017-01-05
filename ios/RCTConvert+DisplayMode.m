//
//  RCTConvert+DisplayMode.m
//  panorama
//
//  Created by Marco Argentieri on 04/01/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "RCTConvert+DisplayMode.h"
#import "GVRWidgetView.h"

@implementation RCTConvert (GVRWidgetDisplayMode)

RCT_ENUM_CONVERTER(GVRWidgetDisplayMode, (@{
                                            @"fullscreen": @(kGVRWidgetDisplayModeFullscreen),
                                            @"embedded": @(kGVRWidgetDisplayModeEmbedded),
                                            @"cardboard": @(kGVRWidgetDisplayModeFullscreenVR),
                                            }), NSNotFound, integerValue)

@end
