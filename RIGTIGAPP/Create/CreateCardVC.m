
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import "CreateCardVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "SSKeychain.h"

@interface CreateCardVC ()

@end

@implementation CreateCardVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnCreateCard:(id)sender
{
    NSString *fName = _fNameCC.text;
    NSString *lName = _lNameCC.text;
    NSString *phone = _phoneCC.text;
    NSString *fax = _faxCC.text;
    NSString *email = _emailCC.text;
    NSString *company = _companyCC.text;
    NSString *position = _positionCC.text;
    
    NSString *access_token = [SSKeychain passwordForService:@"Access_token" account:@"com.kuhme.Create"];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",access_token] forHTTPHeaderField:@"Authorization"];
    NSDictionary *parameters = @{@"fname": fName, @"lname": lName, @"phone": phone, @"fax": fax, @"email": email, @"company": company, @"position": position};
    [manager POST:@"http://42345.9220.ovh/api/card/CreateCard" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
         
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
         NSLog(@"Error: %@", error);
         if (operation.responseObject)
         {
             NSLog(@"responseObject = %@", operation.responseObject);
         }
         else
         {
             NSLog(@"responseString = %@", operation.responseString);
         }
     }];

}



//Close keyboard when touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
