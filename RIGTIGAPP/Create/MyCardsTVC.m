
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import "MyCardsTVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "CreateCardVC.h"
#import "SeeCardVC.h"

#import "SSKeychain.h"

@interface MyCardsTVC ()

@end

@implementation MyCardsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *access_token = [SSKeychain passwordForService:@"Access_token" account:@"com.kuhme.Create"];
    NSString *urlString = @"http://42345.9220.ovh/api/card/MyCards";
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",access_token] forHTTPHeaderField:@"Authorization"];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dataArray = [[NSArray alloc]initWithObjects:responseObject, nil];
        
        
        self.tableViewObject.dataSource = self;
        self.tableViewObject.delegate = self;
        
         [self.tableViewObject reloadData];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    NSDictionary *objectDict = [dataArray objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"Det her kort", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *objectDict = [dataArray objectAtIndex:indexPath.row];
    NSLog(@"Info: %@", objectDict);
 
    
    
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    
    SeeCardVC *controller = [storyboard instantiateViewControllerWithIdentifier:@"SeeCardVC"];
    controller.data = objectDict;
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
    
    
}




@end
