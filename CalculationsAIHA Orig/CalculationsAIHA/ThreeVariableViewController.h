//
//  ThreeVariableViewController.h
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeatStressManager.h"
#import "NoiseManager.h"
#import "ExposureManager.h"
#import "VentilationManager.h"
#import "formulas.h"
#import "UIView+FindFirstResponder.h"

@interface ThreeVariableViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField1;
@property (nonatomic, strong) IBOutlet UITextField *textField2;
@property (nonatomic, strong) IBOutlet UITextField *textField3;
@property (nonatomic, strong) IBOutlet UILabel *variable1;
@property (nonatomic, strong) IBOutlet UILabel *variable2;
@property (nonatomic, strong) IBOutlet UILabel *variable3;
@property (nonatomic, strong) IBOutlet UILabel *unit1;
@property (nonatomic, strong) IBOutlet UILabel *unit2;
@property (nonatomic, strong) IBOutlet UILabel *unit3;
@property (nonatomic, strong) IBOutlet UITextView *result;
@property (nonatomic, strong) IBOutlet UILabel *formula;
@property (nonatomic, strong) IBOutlet UILabel *resultUnit;
@property (nonatomic, strong) IBOutlet UIImageView *formulaImage;
@property (nonatomic, strong) IBOutlet UIImageView *resultBar;
@property (nonatomic, strong) formulas *theUselessFormulas;
@property (nonatomic, strong) IBOutlet UIButton *calcButton;
@property (nonatomic, strong) IBOutlet UIButton *clearButton;

- (BOOL) textFieldShouldReturn:(UITextField *)textField;
-(IBAction) hideKeyboard;

@end
