
//  Copyright © 2015 Kuhme. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Token : NSObject 
{
    
}
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *expiresIn;
@property (nonatomic, strong) NSString *token_type;

@end
