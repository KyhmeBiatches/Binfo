
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import "LoginVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "Token.h"
#import <Foundation/Foundation.h>
#import "CreateUserVC.h"
#import "SSKeychain.h"  
#import "AppDelegate.h"
#import "MainMenuVC.h"





@interface LoginVC () 





@end


@implementation LoginVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Get as strings
    NSString *username = [SSKeychain passwordForService:@"UserUsername" account:@"com.kuhme.Create"];
    NSString *password = [SSKeychain passwordForService:@"UserPassword" account:@"com.kuhme.Create"];
    NSString *access_token = [SSKeychain passwordForService:@"Access_token" account:@"com.kuhme.Create"];
    
    NSLog(@"Username: %@", username);
    NSLog(@"Password: %@", password);
    NSLog(@"Access_token: %@", access_token);
    
    //Set login to the last logged in
    _tfUsernameLogin.text = username;
    _tfPasswordLogin.text = password;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)UserLogin:(id)sender
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"grant_type": @"password", @"username": _tfUsernameLogin.text, @"password": _tfPasswordLogin.text};
    //NSString *password = [SSKeychain passwordForService:@"UserLogin" account:self.tfUsernameLogin.text];
    
    /*[SSKeychain setPassword:parameters[@"password"]
                forService:@"com.kuhme.Create"
                account:parameters[@"username"]]; */
    
    [manager POST:@"http://42345.9220.ovh/token" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSString *token = responseObject[@"access_token"];
         
         NSString *expires = responseObject[@"expires_in"];
         
         NSString *type = responseObject[@"token_type"];
         
         
         
         [SSKeychain setPassword:_tfUsernameLogin.text forService:@"UserUsername" account:@"com.kuhme.Create"];
         [SSKeychain setPassword:_tfPasswordLogin.text forService:@"UserPassword" account:@"com.kuhme.Create"];
         [SSKeychain setPassword:token forService:@"Access_token" account:@"com.kuhme.Create"];
         
         
         
         // Set access_token
         Token *at = [[Token alloc]init];
         [at setAccessToken:token];
         
         // Set expires_in
         Token *ep = [[Token alloc]init];
         [ep setExpiresIn:expires];
         
         // Set token_type
         Token *tt = [[Token alloc]init];
         [tt setToken_type:type];
        
         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
         UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
         [self presentViewController:vc animated:YES completion:nil];
         
         
        
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
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
