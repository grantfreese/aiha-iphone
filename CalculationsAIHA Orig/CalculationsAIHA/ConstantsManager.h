//
//  ExposureManager.h
//  CalculationsAIHA
//
//  Created by asuuser on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstantsManager : NSObject

@property (nonatomic, strong) NSArray *constants;

+(ConstantsManager*)sharedConstantsManager;
-(id)init;

@end
