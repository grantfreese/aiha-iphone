//
//  HeatStressManager.h
//  CAlculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeatStressManager : NSObject

@property (nonatomic, strong) NSArray *formulas;
@property (nonatomic, strong) NSDictionary *selectedFormula;

+(HeatStressManager*)sharedHeatStressManager;
-(id)init;

@end
