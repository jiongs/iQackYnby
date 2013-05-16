//
//  QackLocale.m
//  iYnby
//
//  Created by ji yongshan on 13-5-10.
//
//

#import "QackLocale.h"

NSString* QackLocalizedString(NSString* key, NSString* comment) {
    static NSBundle* bundle = nil;
    if (nil == bundle) {
        NSString* path = [[[NSBundle mainBundle] resourcePath]
                          stringByAppendingPathComponent:@"Qack.bundle"];
        bundle = [[NSBundle bundleWithPath:path] retain];
    }
    
    return [bundle localizedStringForKey:key value:key table:nil];
}
