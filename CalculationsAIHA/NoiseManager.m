//
//  NoiseManager.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import "NoiseManager.h"
static NoiseManager *theNoiseManager;

@implementation NoiseManager
@synthesize formulas = _formulas;
@synthesize selectedFormula = _selectedFormula;

+(NoiseManager*)sharedNoiseManager {
    @synchronized(self){
        if (theNoiseManager == nil) {
            theNoiseManager = [[NoiseManager alloc] init];
        }
    }
    return theNoiseManager;
}

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"NoiseEquations" ofType:@"plist"];
        self.formulas= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}



@end
