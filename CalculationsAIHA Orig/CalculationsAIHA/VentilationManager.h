//
//  HeatStressManager.h
//  ASUMaps
//
//  Created by asuuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VentilationManager : NSObject

@property (nonatomic, strong) NSArray *formulas;
@property (nonatomic, strong) NSDictionary *selectedFormula;

+(VentilationManager*)sharedVentilationManager;
-(id)init;

@end
