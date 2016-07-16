
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property (nonatomic)NSInteger *id;
@property (nonatomic, strong)NSString *fName;
@property (nonatomic, strong)NSString *lName;
@property (nonatomic, strong)NSString *email;
@property (nonatomic, strong)NSString *apiKey;

@end
