//
//  ExposureManager.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import "ExposureManager.h"
static ExposureManager *theExposureManager;

@implementation ExposureManager
@synthesize formulas = _formulas;
@synthesize selectedFormula = _selectedFormula;

+(ExposureManager*)sharedExposureManager {
    @synchronized(self){
        if (theExposureManager == nil) {
            theExposureManager = [[ExposureManager alloc] init];
        }
    }
    return theExposureManager;
}

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"ExposureList" ofType:@"plist"];
        self.formulas= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}
@end
