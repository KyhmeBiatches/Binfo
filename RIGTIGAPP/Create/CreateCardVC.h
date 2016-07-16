
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateCardVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fNameCC;

@property (weak, nonatomic) IBOutlet UITextField *lNameCC;

@property (weak, nonatomic) IBOutlet UITextField *phoneCC;

@property (weak, nonatomic) IBOutlet UITextField *faxCC;

@property (weak, nonatomic) IBOutlet UITextField *emailCC;

@property (weak, nonatomic) IBOutlet UITextField *companyCC;

@property (weak, nonatomic) IBOutlet UITextField *positionCC;

@property (weak, nonatomic) IBOutlet UIButton *createCardCC;

- (IBAction)btnCreateCard:(id)sender;
@end
