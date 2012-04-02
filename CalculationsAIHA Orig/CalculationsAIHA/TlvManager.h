//
//  TlvManager.h
//  CalculationsAIHA
//
//  Created by Jared Kraemer on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CategoryManager.h"

@interface TlvManager : NSObject

@property (nonatomic, strong) NSArray *formulas;
@property (nonatomic, strong) NSDictionary *selectedFormula;

+(TlvManager*)sharedTlvManager;
-(id)init;

@end
