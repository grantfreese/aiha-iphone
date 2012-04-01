//
//  TLVManager.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TLVManager.h"
static TLVManager *theTLVManager;

@implementation TLVManager;
@synthesize formulas = _formulas;
@synthesize selectedFormula = _selectedFormula;

+(TLVManager*)sharedTLVManager {
    @synchronized(self){
        if (theTLVManager == nil) {
            theTLVManager = [[TLVManager alloc] init];
        }
    }
    return theTLVManager;
}

-(id)init{
    if(self = [super init]) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"TLV" ofType:@"plist"];
        self.formulas= [NSArray arrayWithContentsOfFile:filepath];
    }
    return self;
}
@end
