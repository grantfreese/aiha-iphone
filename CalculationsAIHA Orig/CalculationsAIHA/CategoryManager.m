//
//  CategoryManager.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CategoryManager.h"

static CategoryManager *theCategoryManager;

@implementation CategoryManager

@synthesize category = _category;

+(CategoryManager*)sharedCategoryManager {
    @synchronized(self){
        if (theCategoryManager == nil) {
            theCategoryManager = [[CategoryManager alloc] init];
        }
    }
    return theCategoryManager;
}


@end
