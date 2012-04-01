//
//  FlowRateManager.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlowRateManager.h"
static FlowRateManager *theFlowRateManager;

@implementation FlowRateManager;
@synthesize formulas = _formulas;
@synthesize selectedFormula = _selectedFormula;

+(FlowRateManager*)sharedFlowRateManager {
    @synchronized(self){
        if (theFlowRateManager == nil) {
            theFlowRateManager = [[FlowRateManager alloc] init];
        }
    }
    return theFlowRateManager;
}

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"FlowRate" ofType:@"plist"];
        self.formulas= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}
@end
