//
//  OneVariableView.h
//  CalculationsAIHA
//
//  Created by asuuser on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeatStressManager.h"
#import "NoiseManager.h"
#import "ExposureManager.h"
#import "VentilationManager.h"
#import "formulas.h"
#import "UIView+FindFirstResponder.h"

@interface OneVariableViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) IBOutlet UITextField *textField1;
@property (nonatomic, strong) IBOutlet UILabel *variable1;
@property (nonatomic, strong) IBOutlet UILabel *unit1;
@property (nonatomic, strong) IBOutlet UITextView *result;
@property (nonatomic, strong) IBOutlet UILabel *formula;
@property (nonatomic, strong) IBOutlet UILabel *resultUnit;
@property (nonatomic, strong) IBOutlet UIImageView *formulaImage;
@property (nonatomic, strong) IBOutlet UIButton *calcButton;
@property (nonatomic, strong) IBOutlet UIButton *clearButton;
-(BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
