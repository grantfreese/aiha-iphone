//
//  FiveVariableViewController.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FiveVariableViewController.h"
#import "CategoryManager.h"
#import <QuartzCore/QuartzCore.h> 

#define NOISE 1
#define HEATSTRESS 2
#define VENTILATION 3
#define EXPOSUREASSESSMENT 4
#define VOLUME 5
#define DISTANCE 6
#define MASS 8

@implementation FiveVariableViewController
@synthesize textField1 = _textField1;
@synthesize textField2 = _textField2;
@synthesize textField3 = _textField3;
@synthesize textField4 = _textField4;
@synthesize textField5 = _textField5;
@synthesize variable1 = _variable1;
@synthesize variable2 = _variable2;
@synthesize variable3 = _variable3;
@synthesize variable4 = _variable4;
@synthesize variable5 = _variable5;
@synthesize unit1 = _unit1;
@synthesize unit2 = _unit2;
@synthesize unit3 = _unit3;
@synthesize unit4 = _unit4;
@synthesize unit5 = _unit5;
@synthesize result = _result;
@synthesize formula = _formula;
@synthesize resultUnit = _resultUnit;
@synthesize formulaImage = _formulaImage;
@synthesize calcButton = _calcButton;
@synthesize clearButton = _clearButton;

- (IBAction) calculateButtonPressed{
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];    
    int check = catManager.category;
        
    float variable1 = [_textField1.text floatValue]; //reads value of first text field and stores as a float value
    float variable2 = [_textField2.text floatValue]; //reads value of second text field and stores as a float value
    float variable3 = [_textField3.text floatValue]; //reads value of third text field and stores as a float value
    float variable4 = [_textField4.text floatValue]; //reads value of fourth text field and stores as a float value
    float variable5 = [_textField5.text floatValue]; //reads value of fifth text field and stores as a float value
    
    
    if(check == MASS)
    {
        if (variable2 != 0)
        {
            variable1 = variable2/.45359;
        }
        else if (variable3 != 0)
        {
            variable1 = variable3/453.59237;
        }
        else if (variable4 != 0)
        {
            variable1 = variable4/7000;
        }
        else if (variable5 != 0)
        {
            variable1 = variable5/16;
        }

        
        variable2 = variable1*.45359;
        variable3 = variable1*453.59237;
        variable4 = variable1*7000;
        variable5 = variable1*16;
        
        
        self.textField1.text = [NSString stringWithFormat:@"%.4f",variable1];
        self.textField2.text = [NSString stringWithFormat:@"%.4f",variable2];
        self.textField3.text = [NSString stringWithFormat:@"%.4f",variable3];
        self.textField4.text = [NSString stringWithFormat:@"%.4f",variable4];
        self.textField5.text = [NSString stringWithFormat:@"%.4f",variable5];
        self.result.text = @" ";
    }
    else if (check == VOLUME)
    {
        if (variable2 != 0)
        {
            variable1 = variable2/28300;
        }
        else if (variable3 != 0)
        {
            variable1 = variable3/1728;
        }
        else if (variable4 != 0)
        {
            variable1 = variable4/28.31686;
        }        
        else if (variable5 != 0)
        {
            variable1 = variable5/29.92208;
        }
        
        variable2 = variable1*28300;
        variable3 = variable1*1728;
        variable4 = variable1*28.31686;        
        variable5 = variable1*29.92208;
        
        self.textField1.text = [NSString stringWithFormat:@"%.4f",variable1];
        self.textField2.text = [NSString stringWithFormat:@"%.4f",variable2];
        self.textField3.text = [NSString stringWithFormat:@"%.4f",variable3];
        self.textField4.text = [NSString stringWithFormat:@"%.4f",variable4];
        self.textField5.text = [NSString stringWithFormat:@"%.4f",variable5];
        self.result.text = @" ";
        
    }
    else if (check == DISTANCE)
    {
        if (variable2 != 0)
        {
            variable1 = variable2/12;
        }
        else if (variable3 != 0)
        {
            variable1 = variable3*5280;
        }
        else if (variable4 != 0)
        {
            variable1 = variable4/30.48;
        }        
        else if (variable5 != 0)
        {
            variable1 = variable5*3.2808399;
        }
        
        variable2 = variable1*12;
        variable3 = variable1/5280;
        variable4 = variable1*30.48;        
        variable5 = variable1/3.2808399;
        
        self.textField1.text = [NSString stringWithFormat:@"%.4f",variable1];
        self.textField2.text = [NSString stringWithFormat:@"%.4f",variable2];
        self.textField3.text = [NSString stringWithFormat:@"%.4f",variable3];
        self.textField4.text = [NSString stringWithFormat:@"%.4f",variable4];
        self.textField5.text = [NSString stringWithFormat:@"%.4f",variable5];
        
    }
    
    else 
    {
        bool print = true;

    float calculationResult;
    
    HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
    NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
    ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
    VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
    
    NSDictionary *chosenFormula;
        
    if (check == HEATSTRESS)
    {
        chosenFormula = heatManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:5, (double)variable1, (double)variable2, (double)variable3, (double)variable4, (double)variable5];
    }
    
    else if (check == NOISE)
    {
        chosenFormula = noiseManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:5, (double)variable1, (double)variable2, (double)variable3, (double)variable4, (double)variable5];
    }
    
    else if (check == EXPOSUREASSESSMENT)
    {
        chosenFormula = exposureManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:5, (double)variable1, (double)variable2, (double)variable3, (double)variable4, (double)variable5];
    }
    else if (check == VENTILATION)
    {
        chosenFormula = ventilationManager.selectedFormula;
        
        if ([[chosenFormula objectForKey:@"name"] isEqualToString:@"Dilution to Control Evaporation"])
        {
            double result = [formulas dilution:(double)variable1 To:(double)variable2 Control:(double)variable3 Evaporation:(double)variable4 Formula:(double)variable5];
            result = result * 100.0;
            result = round(result);
            result = result/100.0;    
            
            // don't forget to unbox calculationResult, or the pointer will be printed as a float :)
            self.result.text = [NSString stringWithFormat:@"%.2lf", result]; //outputs calculation result
            self.resultUnit.text = [chosenFormula objectForKey:@"resultUnit"];
            print = false;
        }
        
        else
        {
            calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:5, (double)variable1, (double)variable2, (double)variable3, (double)variable4, (double)variable5];
        }
    }
        
    if (print)
        
    {
        calculationResult = calculationResult * 100.0;
        calculationResult = roundf(calculationResult);
        calculationResult = calculationResult/100.0;    
    
        // don't forget to unbox calculationResult, or the pointer will be printed as a float :)
        self.result.text = [NSString stringWithFormat:@"%.2f", calculationResult]; //outputs calculation result
        self.resultUnit.text = [chosenFormula objectForKey:@"resultUnit"];
        print = true;
    }
    }
}

- (IBAction)clearButtonPressed{
    self.textField1.text = [NSString stringWithFormat:@""];
    self.textField2.text = [NSString stringWithFormat:@""];
    self.textField3.text = [NSString stringWithFormat:@""];
    self.textField4.text = [NSString stringWithFormat:@""];
    self.textField5.text = [NSString stringWithFormat:@""];
}

//removes keyboard when return is pressed
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewWillAppear:(BOOL)animated
{  
    [super viewWillAppear:animated];

    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
       self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
{
    _textField1.frame = CGRectMake(80, 65, 97, 31);
    _variable1.frame = CGRectMake(1, 75, 76, 21);
    _unit1.frame = CGRectMake(182, 75, 62, 21);
    
    _textField2.frame = CGRectMake(80, 105, 97, 31);
    _variable2.frame = CGRectMake(1, 115, 76, 21);
    _unit2.frame = CGRectMake(182, 115, 62, 21);
    
    _textField3.frame = CGRectMake(303, 65, 97, 31);
    _variable3.frame = CGRectMake(245, 75, 55, 21);
    _unit3.frame = CGRectMake(405, 75, 75, 21);
    
    _textField4.frame = CGRectMake(303, 105, 97, 31);
    _variable4.frame = CGRectMake(245, 115, 55, 21);
    _unit4.frame = CGRectMake(405, 115, 75, 21);

    
    _textField5.frame = CGRectMake(192, 145, 97, 31);
    _variable5.frame = CGRectMake(98, 155, 90, 21);
    _unit5.frame = CGRectMake(294, 155, 99, 21);
    
    _result.frame = CGRectMake(79, 175, 207, 29);
    _resultUnit.frame = CGRectMake(307, 186, 85, 21);
    
    _calcButton.frame = CGRectMake(404, 177, 75, 35);
    _clearButton.frame = CGRectMake(2, 177, 75, 35);
    
}
else
{
    _textField1.frame = CGRectMake(112, 74, 97, 31);
    _variable1.frame = CGRectMake(1, 84, 103, 21);
    _unit1.frame = CGRectMake(220, 84, 99, 21);
    
    _textField2.frame = CGRectMake(112, 114, 97, 31);
    _variable2.frame = CGRectMake(1, 124, 103, 21);
    _unit2.frame = CGRectMake(220, 124, 99, 21);
    
    _textField3.frame = CGRectMake(112, 154, 97, 31);
    _variable3.frame = CGRectMake(1, 164, 103, 21);
    _unit3.frame = CGRectMake(220, 164, 99, 21);
    
    _textField4.frame = CGRectMake(112, 194, 97, 31);
    _variable4.frame = CGRectMake(1, 204, 103, 21);
    _unit4.frame = CGRectMake(220, 204, 99, 21);
    
    _textField5.frame = CGRectMake(112, 234, 97, 31);
    _variable5.frame = CGRectMake(1, 244, 103, 21);
    _unit5.frame = CGRectMake(220, 244, 99, 21);
    
    _result.frame = CGRectMake(11, 324, 208, 29);
    _resultUnit.frame = CGRectMake(227, 334, 85, 21);
    
    _calcButton.frame = CGRectMake(180, 285, 75, 35);
    _clearButton.frame = CGRectMake(65, 285, 75, 35);
}

    [_result.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_result.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
    [_result.layer setShadowOpacity:1.0];
    [_result.layer setShadowRadius:0.3];
    
    [_resultUnit.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_resultUnit.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
    [_resultUnit.layer setShadowOpacity:1.0];
    [_resultUnit.layer setShadowRadius:0.3];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];    
    int check = catManager.category;
    
    if (check == MASS)
    {
        self.variable1.text = @" ";
        self.variable2.text = @" ";
        self.variable3.text = @" ";
        self.variable4.text = @" ";
        self.variable5.text = @" ";
        self.unit1.text = @"pounds";
        self.unit2.text = @"kilograms";
        self.unit3.text = @"grams";
        self.unit4.text = @"grains";
        self.unit5.text = @"ounces";
        
        self.resultUnit.text = @" ";
        self.result.text = @" ";
        self.formula.text = @"Mass Conversions";
        
    }
    else if (check == VOLUME)
    {
        self.variable1.text = @" ";
        self.variable2.text = @" ";
        self.variable3.text = @" ";
        self.variable4.text = @" ";
        self.variable5.text = @" ";
        self.unit1.text = @"cubic feet"; 
        self.unit2.text = @"cubic cm";
        self.unit3.text = @"cubic inches";
        self.unit4.text = @"liters";
        self.unit5.text = @"quartz";
        self.resultUnit.text = @" ";
        self.result.text = @" ";
        self.formula.text = @"Volume Conversions";
        
        
    }
    else if (check == DISTANCE)
    {
        self.variable1.text = @" ";
        self.variable2.text = @" ";
        self.variable3.text = @" ";
        self.variable4.text = @" ";
        self.variable5.text = @" ";
        self.unit1.text = @"feet"; 
        self.unit2.text = @"inches";
        self.unit3.text = @"miles";
        self.unit4.text = @"centimeters";
        self.unit5.text = @"meters";
        self.resultUnit.text = @" ";
        self.result.text = @" ";
        self.formula.text = @"Distance Conversions";
        
        
    }
    
    else 
    {
        HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
        NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
        ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
        VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
    
        NSDictionary *chosenFormula;
    
    
    
        if (check == 2)
        {
            chosenFormula = heatManager.selectedFormula;
        }
        else if (check == 1)
        {
            chosenFormula = noiseManager.selectedFormula;
        }
        else if (check == 4)
        {
            chosenFormula = exposureManager.selectedFormula;
        }
        else if (check == 3)
        {
            chosenFormula = ventilationManager.selectedFormula;
        }
    
        NSString *variable1Text = [chosenFormula objectForKey:@"variable1"];
        NSString *variable2Text = [chosenFormula objectForKey:@"variable2"];
        NSString *variable3Text = [chosenFormula objectForKey:@"variable3"];
        NSString *variable4Text = [chosenFormula objectForKey:@"variable4"];
        NSString *variable5Text = [chosenFormula objectForKey:@"variable5"];
        NSString *unit1Text = [chosenFormula objectForKey:@"unit1"];
        NSString *unit2Text = [chosenFormula objectForKey:@"unit2"];
        NSString *unit3Text = [chosenFormula objectForKey:@"unit3"];
        NSString *unit4Text = [chosenFormula objectForKey:@"unit4"];
        NSString *unit5Text = [chosenFormula objectForKey:@"unit5"];
        NSString *formulaText = [chosenFormula objectForKey:@"imageName"];       
        NSString *resultUnitText = [chosenFormula objectForKey:@"resultUnit"];
        self.variable1.text = variable1Text;
        self.variable2.text = variable2Text;
        self.variable3.text = variable3Text;
        self.variable4.text = variable4Text;
        self.variable5.text = variable5Text;
        self.unit1.text = unit1Text; 
        self.unit2.text = unit2Text;
        self.unit3.text = unit3Text;
        self.unit4.text = unit4Text;
        self.unit5.text = unit5Text;
        self.formulaImage.image = [UIImage imageNamed:formulaText];    
        self.resultUnit.text = resultUnitText;
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self.view findFirstResponder] resignFirstResponder];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation 
                                         duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        _textField1.frame = CGRectMake(80, 65, 97, 31);
        _variable1.frame = CGRectMake(1, 75, 76, 21);
        _unit1.frame = CGRectMake(182, 75, 62, 21);
        
        _textField2.frame = CGRectMake(80, 105, 97, 31);
        _variable2.frame = CGRectMake(1, 115, 76, 21);
        _unit2.frame = CGRectMake(182, 115, 62, 21);
        
        _textField3.frame = CGRectMake(303, 65, 97, 31);
        _variable3.frame = CGRectMake(245, 75, 55, 21);
        _unit3.frame = CGRectMake(405, 75, 75, 21);
        
        _textField4.frame = CGRectMake(303, 105, 97, 31);
        _variable4.frame = CGRectMake(245, 115, 55, 21);
        _unit4.frame = CGRectMake(405, 115, 75, 21);

        
        _textField5.frame = CGRectMake(192, 145, 97, 31);
        _variable5.frame = CGRectMake(98, 155, 90, 21);
        _unit5.frame = CGRectMake(294, 155, 99, 21);
        
        _result.frame = CGRectMake(79, 175, 207, 29);
        _resultUnit.frame = CGRectMake(307, 186, 85, 21);
        
        _calcButton.frame = CGRectMake(404, 177, 75, 35);
        _clearButton.frame = CGRectMake(2, 177, 75, 35);
        
    }
    else
    {
        _textField1.frame = CGRectMake(112, 74, 97, 31);
        _variable1.frame = CGRectMake(1, 84, 103, 21);
        _unit1.frame = CGRectMake(220, 84, 99, 21);
        
        _textField2.frame = CGRectMake(112, 114, 97, 31);
        _variable2.frame = CGRectMake(1, 124, 103, 21);
        _unit2.frame = CGRectMake(220, 124, 99, 21);
        
        _textField3.frame = CGRectMake(112, 154, 97, 31);
        _variable3.frame = CGRectMake(1, 164, 103, 21);
        _unit3.frame = CGRectMake(220, 164, 99, 21);
        
        _textField4.frame = CGRectMake(112, 194, 97, 31);
        _variable4.frame = CGRectMake(1, 204, 103, 21);
        _unit4.frame = CGRectMake(220, 204, 99, 21);
        
        _textField5.frame = CGRectMake(112, 234, 97, 31);
        _variable5.frame = CGRectMake(1, 244, 103, 21);
        _unit5.frame = CGRectMake(220, 244, 99, 21);
        
        _result.frame = CGRectMake(11, 324, 208, 29);
        _resultUnit.frame = CGRectMake(227, 334, 85, 21);
        
        _calcButton.frame = CGRectMake(180, 285, 75, 35);
        _clearButton.frame = CGRectMake(65, 285, 75, 35);
    }
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string 
{
    if(string.length == 0)
    {
        return YES;
    }
    
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    for (int i = 0; i < [string length]; i++) 
    {
        unichar c = [string characterAtIndex:i];
        if ([myCharSet characterIsMember:c]) 
        {
            return YES;
        }
    }
    
    return NO;
} 
@end
