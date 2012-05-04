//
//  ExposureManager.h
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstantsManager : NSObject

@property (nonatomic, strong) NSArray *constants;

+(ConstantsManager*)sharedConstantsManager;
-(id)init;

@end
