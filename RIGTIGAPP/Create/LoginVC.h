
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController
@property (weak, nonatomic)IBOutlet UITextField *tfUsernameLogin;
@property (weak, nonatomic)IBOutlet UITextField *tfPasswordLogin;
@property (weak, nonatomic)IBOutlet UIButton *btnLoginLogin;
@property (weak, nonatomic)IBOutlet NSString *username;




- (IBAction)UserLogin:(id)sender;
@end
