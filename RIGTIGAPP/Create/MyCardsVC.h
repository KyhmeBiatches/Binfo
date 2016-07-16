
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCardsVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableViewObject;


@end
