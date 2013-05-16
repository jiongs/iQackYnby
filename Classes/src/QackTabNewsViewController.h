//
//  QackWebInfoViewController.h
//  iYnby
//
//  Created by ji yongshan on 13-5-8.
//
//

#import "QackTableViewController.h"

#import <Three20/Three20.h>

@interface QackTabNewsViewController : QackTableViewController{
    TTTabBar* _tableToolBar;
}

@property (readonly, nonatomic) TTTabBar* tableToolbar;

@end
