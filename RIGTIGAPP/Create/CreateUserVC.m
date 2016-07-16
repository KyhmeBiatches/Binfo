
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import "CreateUserVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"

@interface CreateUserVC ()



@end

@implementation CreateUserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Set stars on Password
    self.tfPassword.secureTextEntry = YES;
    
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    if(![defaults boolForKey:@"registered"])
    {
        NSLog(@"No user registered");
        _btnUserLogin.hidden = YES;
    }
    else
    {
        NSLog(@"User is registered");
        _tfRePassword.hidden = YES;
        _btnCreateUser.hidden = YES;
    }
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)createUser:(id)sender
{
     [self checkPasswords];
    
    NSString *username = _tfUsername.text;
    NSString *password = _tfPassword.text;
   
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"username": username, @"password": password, @"email": _tfEmail.text};
    [manager POST:@"http://42345.9220.ovh/api/Account/register" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (operation.responseObject) {
            NSLog(@"responseObject = %@", operation.responseObject);
        } else {
            NSLog(@"responseString = %@", operation.responseString);
        }
    }];
    
    
}

- (IBAction)userLogin:(id)sender {
    

}

- (void) checkPasswords
{
    if([_tfPassword.text isEqualToString:_tfRePassword.text])
    {
        NSLog(@"Det matcher!!");
    }
    else
    {
        NSLog(@"Det matcher sq ikke!");
    }
    
}


//Close keyboard when touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end













