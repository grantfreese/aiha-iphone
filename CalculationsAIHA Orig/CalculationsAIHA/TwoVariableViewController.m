//
//  TwoVariableViewController.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import "TwoVariableViewController.h"
#import "CategoryManager.h"
#import <QuartzCore/QuartzCore.h> 

#define NOISE 1
#define HEATSTRESS 2
#define VENTILATION 3
#define EXPOSUREASSESSMENT 4
#define CONCENTRATION 11
#define TLV 12
#define FLOWRATE 13

@implementation TwoVariableViewController

@synthesize textField1 = _textField1;
@synthesize textField2 = _textField2;
@synthesize variable1 = _variable1;
@synthesize variable2 = _variable2;
@synthesize unit1 = _unit1;
@synthesize unit2 = _unit2;
@synthesize result = _result;
@synthesize formula = _formula;
@synthesize resultUnit = _resultUnit;
@synthesize formulaImage = _formulaImage;
@synthesize calcButton = _calcButton;
@synthesize clearButton = _clearButton;
- (IBAction) calculateButtonPressed{
    float variable1 = [_textField1.text floatValue]; //reads value of first text field and stores as a float value
    float variable2 = [_textField2.text floatValue]; //reads value of second text field and stores as a float value
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];    
    int check = catManager.category;
    
    if (check == FLOWRATE)
    {
        if (variable1 != 0)
        {
            variable2 = variable1*.47;
        }
        else if(variable2 != 0)
        {
            variable1 = variable2/.47;
        }
        
        self.textField1.text = [NSString stringWithFormat:@"%.4f", variable1];
        self.textField2.text = [NSString stringWithFormat:@"%.4f", variable2];
    }
    
    else
    {    
        NSNumber * calculationResult;
        
        HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
        NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
        ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
        VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
        TlvManager *tlvManager = [TlvManager sharedTlvManager];
        ConcentrationManager *concentrationManager = [ConcentrationManager sharedConcentrationManager];
        
        
        NSDictionary *chosenFormula;
        
        CategoryManager *catManager = [CategoryManager sharedCategoryManager];    
        int check = catManager.category;
        
        if (check == HEATSTRESS)
        {
            chosenFormula = heatManager.selectedFormula;
            
            SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
            // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
            // to call it.  The implementation of this function should take two NSNumbers and return an
            // NSNumber.
            calculationResult = [formulas performSelector:method 
                                               withObject:[NSNumber numberWithFloat: variable1] 
                                               withObject:[NSNumber numberWithFloat: variable2]];
        }
        else if (check == NOISE)
        {
            chosenFormula = noiseManager.selectedFormula;
            SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
            // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
            // to call it.  The implementation of this function should take two NSNumbers and return an
            // NSNumber.
            calculationResult = [formulas performSelector:method 
                                               withObject:[NSNumber numberWithFloat: variable1] 
                                               withObject:[NSNumber numberWithFloat: variable2]];
            
        }
        else if (check == EXPOSUREASSESSMENT)
        {
            chosenFormula = exposureManager.selectedFormula;
            SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
            // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
            // to call it.  The implementation of this function should take two NSNumbers and return an
            // NSNumber.
            calculationResult = [formulas performSelector:method 
                                               withObject:[NSNumber numberWithFloat: variable1] 
                                               withObject:[NSNumber numberWithFloat: variable2]];        
        }
        else if (check == VENTILATION)
        {
            chosenFormula = ventilationManager.selectedFormula;
            SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
            // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
            // to call it.  The implementation of this function should take two NSNumbers and return an
            // NSNumber.
            calculationResult = [formulas performSelector:method 
                                               withObject:[NSNumber numberWithFloat: variable1] 
                                               withObject:[NSNumber numberWithFloat: variable2]];        
        }
        else if (check == TLV)
        {
            chosenFormula = tlvManager.selectedFormula;
            SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
            // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
            // to call it.  The implementation of this function should take two NSNumbers and return an
            // NSNumber.
            calculationResult = [formulas performSelector:method 
                                               withObject:[NSNumber numberWithFloat: variable1] 
                                               withObject:[NSNumber numberWithFloat: variable2]];
            
        }
        else if (check == CONCENTRATION)
        {
            chosenFormula = concentrationManager.selectedFormula;
            NSString *methodText = [chosenFormula objectForKey:@"method"];
            int checkNum = [methodText intValue];
            if(checkNum == 1)
            {
                if(variable1 != 0)
                {
                    variable2 = 2.29*variable1;
                }
                else if(variable2 != 0)
                {
                    variable1 = variable2/2.29;
                }
            }
            else 
            {
                if(variable1 != 0)
                {
                    variable2 = 35.3*variable1;
                }
                else if(variable2 != 0)
                {
                    variable1 = variable2/35.3;
                }
            }                
            
            
        }
        
        
        
        // don't forget to unbox calculationResult, or the pointer will be printed as a float :)
        if (check == CONCENTRATION)
        {
            self.textField1.text = [NSString stringWithFormat:@"%.4f", variable1];
            self.textField2.text = [NSString stringWithFormat:@"%.4f", variable2];
        }
        else
        {
            float result = [calculationResult floatValue];
            result = result * 100.0;
            result = roundf(result);
            result = result/100.0;
            
            self.result.text = [NSString stringWithFormat:@"%.2f", result]; //outputs calculation result
            self.resultUnit.text = [chosenFormula objectForKey:@"resultUnit"];
        }
    }
}

- (IBAction)clearButtonPressed{
    self.textField1.text = [NSString stringWithFormat:@""];
    self.textField2.text = [NSString stringWithFormat:@""];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewWillAppear:(BOOL)animated
{  
    [super viewWillAppear:animated];
    
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
       self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
{
    _textField1.frame = CGRectMake(192, 80, 97, 31);
    _variable1.frame = CGRectMake(92, 90, 77, 21);
    _unit1.frame = CGRectMake(310, 90, 77, 21);
    
    _textField2.frame = CGRectMake(192, 130, 97, 31);
    _variable2.frame = CGRectMake(92, 140, 77, 21);
    _unit2.frame = CGRectMake(310, 140, 77, 21);
    
    _result.frame = CGRectMake(79, 173, 207, 31);
    _resultUnit.frame = CGRectMake(307, 186, 85, 21);
    
    _calcButton.frame = CGRectMake(404, 177, 75, 35);
    _clearButton.frame = CGRectMake(2, 177, 75, 35);
    
}
else
{
    _textField1.frame = CGRectMake(112, 144, 97, 31);
    _variable1.frame = CGRectMake(1, 154, 103, 21);
    _unit1.frame = CGRectMake(220, 154, 99, 21);
    
    _textField2.frame = CGRectMake(112, 194, 97, 31);
    _variable2.frame = CGRectMake(1, 204, 103, 21);
    _unit2.frame = CGRectMake(220, 204, 99, 21);
    
    _result.frame = CGRectMake(11, 322, 208, 31);
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    int check = catManager.category;
    
    if (check == FLOWRATE)
    {
        self.variable1.text = @" ";
        self.variable2.text = @" ";
        self.unit1.text = @"cubic feet/hr"; 
        self.unit2.text = @"liters/min";
        self.formula.text = @"Flow Rate Conversions";
        self.resultUnit.text = @" ";
        self.result.text = @" ";
    }
    
    else
    {
        HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
        NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
        ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
        VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
        TlvManager *tlvManager = [TlvManager sharedTlvManager];
        ConcentrationManager *concentrationManager = [ConcentrationManager sharedConcentrationManager];
        
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
        else if (check == 12)
        {
            chosenFormula = tlvManager.selectedFormula;
        }
        else if (check == 11)
        {
            chosenFormula = concentrationManager.selectedFormula;
        }
        
        NSString *variable1Text = [chosenFormula objectForKey:@"variable1"];
        NSString *variable2Text = [chosenFormula objectForKey:@"variable2"];
        NSString *unit1Text = [chosenFormula objectForKey:@"unit1"];
        NSString *unit2Text = [chosenFormula objectForKey:@"unit2"];
        if (check == 12||check == 11)
        {
            NSString *formulaText = [chosenFormula objectForKey:@"formula"];
            NSString *resultText = [chosenFormula objectForKey:@"result"];
            self.formula.text = formulaText;
            self.result.text = resultText;
        }
        else
        {
            NSString *formulaText = [chosenFormula objectForKey:@"imageName"];
            self.formulaImage.image = [UIImage imageNamed:formulaText];
        
        }
        NSString *resultUnitText = [chosenFormula objectForKey:@"resultUnit"];
        self.variable1.text = variable1Text;
        self.variable2.text = variable2Text;
        self.unit1.text = unit1Text; 
        self.unit2.text = unit2Text;                
        self.resultUnit.text = resultUnitText;
    }
    
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
        _textField1.frame = CGRectMake(192, 80, 97, 31);
        _variable1.frame = CGRectMake(92, 90, 77, 21);
        _unit1.frame = CGRectMake(310, 90, 77, 21);
        
        _textField2.frame = CGRectMake(192, 130, 97, 31);
        _variable2.frame = CGRectMake(92, 140, 77, 21);
        _unit2.frame = CGRectMake(310, 140, 77, 21);
        
        _result.frame = CGRectMake(79, 175, 207, 35);
        _resultUnit.frame = CGRectMake(307, 186, 85, 21);
        
        _calcButton.frame = CGRectMake(404, 177, 75, 35);
        _clearButton.frame = CGRectMake(2, 177, 75, 35);
        
    }
    else
    {
        _textField1.frame = CGRectMake(112, 144, 97, 31);
        _variable1.frame = CGRectMake(1, 154, 103, 21);
        _unit1.frame = CGRectMake(220, 154, 99, 21);
        
        _textField2.frame = CGRectMake(112, 194, 97, 31);
        _variable2.frame = CGRectMake(1, 204, 103, 21);
        _unit2.frame = CGRectMake(220, 204, 99, 21);
        
        _result.frame = CGRectMake(11, 324, 208, 35);
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
