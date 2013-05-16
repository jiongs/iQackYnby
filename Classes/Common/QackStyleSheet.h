//
//  QackDefaultStyleSheet.h
//  iYnby
//
//  Created by Ji Yongshan on 13-5-8.
//  Copyright (c) 2013年 Ji Yongshan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QackStyleSheet : TTDefaultCSSStyleSheet

- (CGFloat) toolbarViewHeight;

- (TTStyle*)toolbarRound:(UIControlState)state;

@end
