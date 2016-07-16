
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tfFName;

@property (weak, nonatomic) IBOutlet UITextField *tfLName;

@property (weak, nonatomic) IBOutlet UIButton *btnSaveUser;

- (IBAction)saveUser:(id)sender;

@end
