
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SeeCardVC : UIViewController

@property(nonatomic) BOOL *isSomethingEnabled;

@property (strong, nonatomic) NSArray *data;

@property (weak, nonatomic) IBOutlet UITextField *tfFname;

@property (weak, nonatomic) IBOutlet UITextField *tfLname;

@property (weak, nonatomic) IBOutlet UITextField *tfPhone;

@property (weak, nonatomic) IBOutlet UITextField *tfEmail;

@property (weak, nonatomic) IBOutlet UITextField *tfCompany;

@property (weak, nonatomic) IBOutlet UITextField *tfFax;

@property (weak, nonatomic) IBOutlet UITextField *tfPosition;

- (IBAction)btnSave:(id)sender;


@end
