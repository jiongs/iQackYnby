
#import "QackTabBarController.h"

@interface QackTabBarController ()

@end

@implementation QackTabBarController

- (void)viewDidLoad {
    [self setTabURLs:[NSArray arrayWithObjects:@"tt://tabNews",
                      @"tt://menu/2",
                      @"tt://menu/3",
                      @"tt://menu/4",
                      @"tt://menu/5",
                      nil]];
    
}

@end
