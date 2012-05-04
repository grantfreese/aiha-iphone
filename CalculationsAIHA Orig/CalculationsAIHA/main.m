//
//  main.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AIHAAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        @try {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AIHAAppDelegate class]));
        }
        @catch (NSException *exception) {
            NSLog(@"Crashed with %@", exception);
            return -1;
        }

        
    }
}
