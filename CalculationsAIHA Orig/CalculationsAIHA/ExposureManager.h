//
//  ExposureManager.h
//  CalculationsAIHA
//
//  Created by asuuser on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExposureManager : NSObject

@property (nonatomic, strong) NSArray *formulas;
@property (nonatomic, strong) NSDictionary *selectedFormula;

+(ExposureManager*)sharedExposureManager;
-(id)init;

@end
