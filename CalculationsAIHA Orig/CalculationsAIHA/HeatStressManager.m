//
//  HeatStressManager.m
//  ASUMaps
//
//  Created by asuuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HeatStressManager.h"

static HeatStressManager *theHeatStressManager;

@implementation HeatStressManager

@synthesize formulas = _formulas;
@synthesize selectedFormula = _selectedFormula;

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"HeatStress" ofType:@"plist"];
        self.formulas= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}

+(HeatStressManager*)sharedHeatStressManager {
    @synchronized(self){
        if (theHeatStressManager == nil) {
            theHeatStressManager = [[HeatStressManager alloc] init];
        }
    }
    return theHeatStressManager;
}

@end
