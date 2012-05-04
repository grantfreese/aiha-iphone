//
//  VentilationManager.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import "VentilationManager.h"

static VentilationManager *theVentilationManager;

@implementation VentilationManager

@synthesize formulas = _formulas;
@synthesize selectedFormula = _selectedFormula;

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Ventilation" ofType:@"plist"];
        self.formulas= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}

+(VentilationManager*)sharedVentilationManager {
    @synchronized(self){
        if (theVentilationManager == nil) {
            theVentilationManager = [[VentilationManager alloc] init];
        }
    }
    return theVentilationManager;
}

@end
