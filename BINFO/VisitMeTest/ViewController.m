//
//  ViewController.m
//  VisitMeTest
//
//  Created by Marck Jensen on 03/11/15.
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"

static NSString * const BaseURLString = @"http://42345.9220.ovh/api/contact";

@interface ViewController ()

@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://42345.9220.ovh/api/contact" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSLog(@"JSON: %@", responseObject);
        
        self.data = responseObject;
        
        NSLog(@"data: %@", self.data);
        
        //print from index 0
        NSString  *index0 = [self.data objectAtIndex:0];
        
        NSLog(@"index0: %@", [ index0 valueForKey:@"Phone"]); 
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
