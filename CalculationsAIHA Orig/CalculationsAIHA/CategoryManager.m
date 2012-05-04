//
//  CategoryManager.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
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
