//
//  ConcentrationManager.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import "ConcentrationManager.h"
static ConcentrationManager *theConcentrationManager;

@implementation ConcentrationManager;
@synthesize formulas = _formulas;
@synthesize selectedFormula = _selectedFormula;

+(ConcentrationManager*)sharedConcentrationManager {
    @synchronized(self){
        if (theConcentrationManager == nil) {
            theConcentrationManager = [[ConcentrationManager alloc] init];
        }
    }
    return theConcentrationManager;
}

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Concentration" ofType:@"plist"];
        self.formulas= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}
@end
