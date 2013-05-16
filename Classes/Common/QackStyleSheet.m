//
//  QackDefaultStyleSheet.m
//  iYnby
//
//  Created by Ji Yongshan on 13-5-8.
//  Copyright (c) 2013年 Ji Yongshan. All rights reserved.
//

#import "QackStyleSheet.h"

NSString* kQackCSSPath = @"Qack.bundle/Styles/Default.css";

@implementation QackStyleSheet

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
	self = [super init];
    
    [self addStyleSheetFromDisk:TTPathForBundleResource(kQackCSSPath)];

    return self;
}

- (CGFloat) toolbarViewHeight {
    return 30;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTStyle*)toolbarRound:(UIControlState)state {
    if (state == UIControlStateSelected) {
        return
        [TTShapeStyle styleWithShape:[TTRoundedRectangleShape shapeWithRadius:2.0] next:
         [TTInsetStyle styleWithInset:UIEdgeInsetsMake(6, 1, 5, 1) next:
          [TTShadowStyle styleWithColor:RGBACOLOR(255,255,255,0.8) blur:0 offset:CGSizeMake(0, 1) next:
           [TTReflectiveFillStyle styleWithColor:TTSTYLEVAR(tabBarTintColor) next:
            [TTInnerShadowStyle styleWithColor:RGBACOLOR(0,0,0,0.3) blur:1 offset:CGSizeMake(1, 1) next:
             [TTInsetStyle styleWithInset:UIEdgeInsetsMake(-1, -1, -1, -1) next:
              [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(0, 10, 0, 10) next:
               [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:13]  color:[UIColor whiteColor]
                          minimumFontSize:8 shadowColor:[UIColor colorWithWhite:0 alpha:0.5]
                             shadowOffset:CGSizeMake(0, -1) next:nil]]]]]]]];
        
    } else {
        return
        [TTBoxStyle styleWithPadding:UIEdgeInsetsMake(0, 10, 0, 10) next:
         [TTTextStyle styleWithFont:[UIFont boldSystemFontOfSize:13]  color:self.linkTextColor
                    minimumFontSize:8 shadowColor:[UIColor colorWithWhite:1 alpha:0.9]
                       shadowOffset:CGSizeMake(0, -1) next:nil]];
    }
}

@end
