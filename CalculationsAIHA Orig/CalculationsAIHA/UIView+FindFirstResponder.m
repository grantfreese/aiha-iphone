//
//  UIView+FindFirstResponder.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIView+FindFirstResponder.h"

@implementation UIView (FindFirstResponder)
- (UIView *)findFirstResponder
{
    if (self.isFirstResponder) {        
        return self;     
    }
    
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    
    return nil;
}
@end
