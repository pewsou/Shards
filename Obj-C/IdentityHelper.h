//
//  IdentityHelper.h
//  flego
//
//  Created by Boris Vigman on 7/23/14.
//  Copyright (c) 2014 Boris Vigman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IdentityHelper : NSObject
+ (id)sharedManager;
-(NSString*) generateIdentity;
@end
