
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCardsTVC : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArray;
    NSDictionary *fName;
}

@property (strong, nonatomic) IBOutlet UITableView *tableViewObject;

@end
