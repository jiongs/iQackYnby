//
//  QackWebInfoViewController.m
//  iYnby
//
//  Created by ji yongshan on 13-5-8.
//
//

#import "QackTabNewsViewController.h"
#import "QackNewsDataSource.h"
#import "QackLocale.h"

@interface QackTabNewsViewController ()

@end

@implementation QackTabNewsViewController


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initTab];
    }
    
    //self.variableHeightRows = TRUE;
    
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init{
    if (self = [super init]) {
        [self initTab];
    }
    return self;
}

- (NSString*)tabTitle{
    return QackLocalizedString(@"News", @"新闻");
}

- (UIImage*)tabImage {
    return [UIImage imageNamed:@"news.png"];
}

- (NSArray*)toolbarItems{
            return [NSArray arrayWithObjects:
                    [[[TTTabItem alloc] initWithTitle:QackLocalizedString(@"NewsZX", @"资讯")] autorelease],
                    [[[TTTabItem alloc] initWithTitle:QackLocalizedString(@"NewsGG", @"公告")] autorelease],
                    [[[TTTabItem alloc] initWithTitle:QackLocalizedString(@"NewsMT", @"媒体")] autorelease],
                    [[[TTTabItem alloc] initWithTitle:QackLocalizedString(@"NewsFT", @"访谈")] autorelease],
                    [[[TTTabItem alloc] initWithTitle:QackLocalizedString(@"NewsTP", @"图片")] autorelease],
                    [[[TTTabItem alloc] initWithTitle:QackLocalizedString(@"NewsGD", @"更多")] autorelease],
                    nil];
    
}

- (void) initTab {    
    //设置Tab项标题
    self.title = [self tabTitle];
    
    //设置菜单图片
    self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:[self tabImage] tag:0] autorelease];
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)createModel {
    self.dataSource = [[[QackNewsDataSource alloc]
                        initWithSearchQuery:@"catalog=sy01"] autorelease];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id<UITableViewDelegate>)createDelegate {
    return [[[TTTableViewDragRefreshDelegate alloc] initWithController:self] autorelease];
}

- (void) viewDidLoad{    
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    
    //设置子菜单
    TTTabStrip *toolbar = [[TTTabStrip alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    //TTTabBar* toolbar = [[TTTabBar alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    [toolbar setTabStyle:@"toolbarRound:"];
    toolbar.tabItems = [self toolbarItems];
    
    [self setTableToolbarView:toolbar];
}

- (void)dealloc {
    TT_RELEASE_SAFELY(_tableToolbarView);
    
    [super dealloc];
}


@end
