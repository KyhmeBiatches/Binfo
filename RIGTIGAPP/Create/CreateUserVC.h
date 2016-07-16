
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateUserVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tfUsername;

@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@property (weak, nonatomic) IBOutlet UITextField *tfEmail;

@property (weak, nonatomic) IBOutlet UITextField *tfRePassword;

@property (weak, nonatomic) IBOutlet UIButton *btnCreateUser;

@property (weak, nonatomic) IBOutlet UIButton *btnUserLogin;


- (IBAction)createUser:(id)sender;
- (IBAction)userLogin:(id)sender;


@end
