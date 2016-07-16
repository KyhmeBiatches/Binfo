
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import "MyCardsVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "CreateCardVC.h"
#import "SeeCardVC.h"

#import "SSKeychain.h"

@interface MyCardsVC ()

@end

@implementation MyCardsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSString *access_token = [SSKeychain passwordForService:@"Access_token" account:@"com.kuhme.Create"];
    NSString *urlString = @"http://42345.9220.ovh/api/card/MyCards";
    //NSURL *url = [NSURL URLWithString:urlString];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
 
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",access_token] forHTTPHeaderField:@"Authorization"];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"Info: %@", responseObject);
        dataArray = [[NSArray alloc]initWithObjects:responseObject, nil];
        
        
        self.tableViewObject.dataSource = self;
        self.tableViewObject.delegate = self;
        
       // [self.tableViewObject reloadData];
        
        NSLog(@"TableView: %@", _tableViewObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}


@end
