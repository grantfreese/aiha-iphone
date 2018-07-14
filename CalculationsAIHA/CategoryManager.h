//
//  CategoryManager.h
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryManager : NSObject

@property int category;


+(CategoryManager*)sharedCategoryManager;


@end
