//
//  NoiseManager.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
