//
//  NoiseManager.h
//  CalculationsAIHA
//
//  Created by asuuser on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoiseManager : NSObject

@property (nonatomic, strong) NSArray *formulas;
@property (nonatomic, strong) NSDictionary *selectedFormula;

+(NoiseManager*)sharedNoiseManager;
-(id)init;

@end
