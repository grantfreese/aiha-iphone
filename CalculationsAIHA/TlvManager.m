//
//  TlvManager.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import "TlvManager.h"
static TlvManager *theTlvManager;

@implementation TlvManager;
@synthesize formulas = _formulas;
@synthesize selectedFormula = _selectedFormula;

+(TlvManager*)sharedTlvManager {
    @synchronized(self){
        if (theTlvManager == nil) {
            theTlvManager = [[TlvManager alloc] init];
        }
    }
    return theTlvManager;
}

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"TLV" ofType:@"plist"];
        self.formulas= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}
@end
