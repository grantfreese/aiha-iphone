//
//  ConstantsManager.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import "ConstantsManager.h"
static ConstantsManager *theConstantsManager;

@implementation ConstantsManager
@synthesize constants = _constants;

+(ConstantsManager*)sharedConstantsManager {
    @synchronized(self){
        if (theConstantsManager == nil) {
            theConstantsManager = [[ConstantsManager alloc] init];
        }
    }
    return theConstantsManager;
}

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Constants" ofType:@"plist"];
        self.constants= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}
@end
