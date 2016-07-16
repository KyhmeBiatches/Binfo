
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import "SeeCardVC.h"


@interface SeeCardVC ()

@end

@implementation SeeCardVC
@synthesize data;
@synthesize tfFname;
@synthesize tfLname;
@synthesize tfEmail;
@synthesize tfPhone;
@synthesize tfCompany;
@synthesize tfFax;
@synthesize tfPosition;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Det her: %@", data[0][@"phone"]);
    tfFname.text = data[0][@"fName"];
    tfLname.text = data[0][@"lName"];
    tfEmail.text = data[0][@"email"];
    tfPhone.text = data[0][@"phone"];
    tfCompany.text = data[0][@"company"];
    tfFax.text = data[0][@"fax"];
    tfPosition.text = data[0][@"position"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSave:(id)sender
{
    
    
}
@end
