//
//  IdentityHelper.m
//  flego
//
//  Created by Boris Vigman on 7/23/14.
//  Copyright (c) 2014 Boris Vigman. All rights reserved.
//

#import "IdentityHelper.h"
#include <stdlib.h>
@implementation IdentityHelper
+ (id)sharedManager{
    static IdentityHelper *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc]init];
    });
    return sharedMyManager;
}
-(NSString*) generateIdentity{
    int r = arc4random();
    NSMutableString* st=[[NSMutableString alloc] initWithString:[[NSNumber numberWithInt:r]stringValue ]];
    [st appendString:[[NSDate date] description]];
    return st;
}
- (id)init{
    if (self = [super init]) {
    }
    return self;
}
@end
