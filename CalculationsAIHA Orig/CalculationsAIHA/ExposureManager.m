//
//  ExposureManager.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
