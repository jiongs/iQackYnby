
#import <Three20/Three20.h>

@interface QackTableViewController : TTTableViewController{
    UIView* _tableToolbarView;
}

@property(retain, nonatomic) UIView* tableToolbarView;

/**
 * Sets the view that is displayed at the top of the table view with an optional animation.
 */
- (void)setTableToolbarView:(UIView*)tableTableView animated:(BOOL)animated;

@end
