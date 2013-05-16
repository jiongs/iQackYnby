#import "QackMenuController.h"

@implementation QackMenuController

@synthesize page = _page;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithMenu:(NSUInteger)page {
    if (self = [super init]) {
        self.page = page;
    }
    return self;
}

- (NSString*)nameForMenuPage:(NSUInteger)page {
    switch (page) {
        case 1:
            return @"新闻";
        case 2:
            return @"产品";
        case 3:
            return @"论坛";
        case 4:
            return @"会员";
        case 5:
            return @"更多";
        default:
            return @"";
    }
}

- (UIImage*)imgForMenuPage:(NSUInteger)page {
    switch (page) {
        case 1:
            return [UIImage imageNamed:@"news.png"];
        case 2:
            return [UIImage imageNamed:@"product.png"];
        case 3:
            return [UIImage imageNamed:@"bbs.png"];
        case 4:
            return [UIImage imageNamed:@"office.png"];
        case 5:
            return [UIImage imageNamed:@"other.png"];
        default:
            return nil;
    }
}

- (void) setPage:(NSUInteger)page {
    _page = page;
    
    //设置Tab标题
    self.title = [self nameForMenuPage:page];
    
    //设置Tab图片
    UIImage* image = [self imgForMenuPage:page];
    self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
    
}

- (void) viewDidLoad{
    
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
}

@end
