//
//  PanoramaView.m
//  panorama
//
//  Created by Marco Argentieri on 28/12/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "PanoramaView.h"
#import <React/RCTImageLoader.h>



@implementation RCTConvert (GVRWidgetDisplayMode)

RCT_ENUM_CONVERTER(GVRWidgetDisplayMode, (@{
                                            @"fullscreen": @(kGVRWidgetDisplayModeFullscreen),
                                            @"embedded": @(kGVRWidgetDisplayModeEmbedded),
                                            @"cardboard": @(kGVRWidgetDisplayModeFullscreenVR),
                                            }), NSNotFound, integerValue)

@end


@implementation PanoramaView {
  UIImage *_image;
  NSString *__imageType;
  GVRPanoramaView *_panoView;
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  _panoView = [[GVRPanoramaView alloc] init];
  _panoView.delegate = self;
  [self addSubview:_panoView];
  
  return self;
}

- (void)layoutSubviews
{
  float rootViewWidth = self.frame.size.width;
  float rootViewHeight = self.frame.size.height;
  [_panoView setFrame:CGRectMake(0, 0, rootViewWidth, rootViewHeight)];

}


-(void)setImageUrl:(NSString *)imageUrl
{
  NSURL *url = [NSURL URLWithString:imageUrl];
  NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
  
  if (imageUrl) {
    RCTImageLoader *loader = [[RCTImageLoader alloc] init];
    
    __weak PanoramaView *weakSelf = self;
    
    [loader loadImageWithURLRequest:request callback:^(NSError *error, UIImage *networkImage) {
      
      if (!error) {
        [[self getPanoramaView]  loadImage:networkImage ofType:kGVRPanoramaImageTypeStereoOverUnder];
      } else {
        RCTLogWarn(@"[PanoramaView] Could not fetch image.");
      }
      
      dispatch_async([weakSelf methodQueue], ^{
        RCTLogInfo(@"Image on disk");
        [[self getPanoramaView] loadImage:networkImage ofType:kGVRPanoramaImageTypeStereoOverUnder];

      });
    }];
  }
}

- (void)setImage:(UIImage *)image
{
  // Load the image
  [_panoView loadImage:image ofType:kGVRPanoramaImageTypeStereoOverUnder];

}

- (void)setDisplayMode:(NSString *)displayMode
{
  //Display mode default Embedded
  _panoView.displayMode = [RCTConvert GVRWidgetDisplayMode:displayMode];
}


- (void)setEnableFullscreenButton:(BOOL)enableFullscreenButton
{
  _panoView.enableFullscreenButton = enableFullscreenButton;
}

-(void)setEnableInfoButton:(BOOL)enableInfoButton
{
  _panoView.enableInfoButton = enableInfoButton;
}

-(void)setEnableTouchTracking:(BOOL)enableTouchTracking
{
  _panoView.enableTouchTracking = enableTouchTracking;
}

-(void)setHidesTransitionView:(BOOL)hidesTransitionView
{
  _panoView.hidesTransitionView = hidesTransitionView;
}

-(void)setEnableCardboardButton:(BOOL)enableCardboardButton
{
  _panoView.enableCardboardButton = enableCardboardButton;
}


#pragma mark - GVRWidgetViewDelegate

- (void)widgetView:(GVRWidgetView *)widgetView didLoadContent:(id)content {
  RCTLogInfo(@"Loaded panorama image");
}
- (void)widgetView:(GVRWidgetView *)widgetView didFailToLoadContent:(id)content withErrorMessage:(NSString *)errorMessage {
  RCTLogInfo(@"Error : %@",errorMessage);
}
- (void)widgetView:(GVRWidgetView *)widgetView didChangeDisplayMode:(GVRWidgetDisplayMode)displayMode  {
  RCTLogInfo(@"Changed Display");
}
- (void)widgetViewDidTap {
  RCTLogInfo(@"Widget view did tapped");
}



- (GVRPanoramaView *)getPanoramaView {
  return _panoView;
}


          
@end
