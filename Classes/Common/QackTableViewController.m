
#import "QackStyleSheet.h"
#import "QackTableViewController.h"

@interface QackTableViewController ()

@end

@implementation QackTableViewController

@synthesize tableToolbarView = _tableToolbarView;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_tableToolbarView);
    
    [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutToolbarView {
    if (_tableToolbarView) {
        _tableToolbarView.frame = [self rectForToolbarView];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadView {
    [super loadView];
    
    // If this view was unloaded and is now being reloaded, and it was previously
    // showing a table toolbar, then redisplay that toolbar now.
    if (_tableToolbarView) {
        UIView* savedTableToolbarView = [_tableToolbarView retain];
        [self setTableToolbarView:nil animated:NO];
        [self setTableToolbarView:savedTableToolbarView animated:NO];
        [savedTableToolbarView release];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTableView:(UITableView*)tableView {
    if (tableView != _tableView) {
        [_tableView release];
        _tableView = [tableView retain];
        if (!_tableView) {
            self.tableBannerView = nil;
            self.tableToolbarView = nil;
            self.tableOverlayView = nil;
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTableToolbarView:(UIView*)tableToolbarView {
    [self setTableToolbarView:tableToolbarView animated:NO];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addSubviewTopTableView:(UIView*)view {
    NSInteger tableIndex = [_tableView.superview.subviews indexOfObject:_tableView];
    if (NSNotFound != tableIndex) {
        CGRect tableRect = _tableView.frame;
        
        [_tableView.superview insertSubview:view belowSubview:_tableView];
        
        //调整tableView的位置：移动tableView到toolbarView的下面。
        _tableView.frame = CGRectMake(tableRect.origin.x, tableRect.origin.y + view.frame.size.height, tableRect.size.width, tableRect.size.height - view.frame.size.height);
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTableToolbarView:(UIView*)tableToolbarView animated:(BOOL)animated {
    if (tableToolbarView != _tableToolbarView) {
        if (_tableToolbarView) {
            //if (animated) {
            //    [self fadeOutView:_tableToolbarView];
            //} else {
                [_tableToolbarView removeFromSuperview];
            //}
            
            // 调整tableView的位置：恢复tableView到toolbarView原来的位置。
            CGRect tableRect = _tableView.frame;
            _tableView.frame = CGRectMake(tableRect.origin.x, tableRect.origin.y - _tableToolbarView.frame.size.height, tableRect.size.width,  tableRect.size.height + _tableToolbarView.frame.size.height);
        }
        
        [_tableToolbarView release];
        _tableToolbarView = [tableToolbarView retain];
        
        if (_tableToolbarView) {
            //self.tableView.contentInset = UIEdgeInsetsMake(0, 0, TTSTYLEVAR(tableToolbarViewHeight), 0);
            //self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
            _tableToolbarView.frame = [self rectForToolbarView];
            //_tableToolbarView.autoresizingMask = (UIViewAutoresizingFlexibleWidth
             //                                    | UIViewAutoresizingFlexibleTopMargin);
            
            //添加toolbarView到tableView的上面
            [self addSubviewTopTableView:_tableToolbarView];
            
            
            //if (animated) {
                //_tableToolbarView.top += TTSTYLEVAR(tableToolbarViewHeight);
                //[UIView beginAnimations:nil context:nil];
                //[UIView setAnimationDuration:TT_TRANSITION_DURATION];
                //[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                //_tableToolbarView.top -= TTSTYLEVAR(tableToolbarViewHeight);
                //[UIView commitAnimations];
            //}
            
        } else {
            self.tableView.contentInset = UIEdgeInsetsZero;
            self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)rectForToolbarView {
    CGRect tableFrame = [_tableView frame];
    const CGFloat toolbarHeight = TTSTYLEVAR(toolbarViewHeight);
    return CGRectMake(tableFrame.origin.x,
                      tableFrame.origin.y,
                      tableFrame.size.width, toolbarHeight);
}


@end
