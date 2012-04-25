//
//  FourVariableViewController.m
//  CalculationsAIHA
//
//  Created by asuuser on 2/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FourVariableViewController.h"
#import "CategoryManager.h"
#import <QuartzCore/QuartzCore.h> 

#define NOISE 1
#define HEATSTRESS 2
#define VENTILATION 3
#define EXPOSUREASSESSMENT 4
#define PRESSURE 7
#define MASS 8
#define TEMPERATURE 9

@implementation FourVariableViewController
@synthesize textField1 = _textField1;
@synthesize textField2 = _textField2;
@synthesize textField3 = _textField3;
@synthesize textField4 = _textField4;
@synthesize variable1 = _variable1;
@synthesize variable2 = _variable2;
@synthesize variable3 = _variable3;
@synthesize variable4 = _variable4;
@synthesize unit1 = _unit1;
@synthesize unit2 = _unit2;
@synthesize unit3 = _unit3;
@synthesize unit4 = _unit4;
@synthesize result = _result;
@synthesize formula = _formula;
@synthesize resultUnit = _resultUnit;
@synthesize formulaImage = _formulaImage;
@synthesize calcButton = _calcButton;
@synthesize clearButton = _clearButton;
- (IBAction) calculateButtonPressed{
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];    
    int check = catManager.category;
    
    bool var1 = false;
    bool var2 = false;
    bool var3 = false;
    bool var4 = false;
    if( [_textField1.text isEqualToString:@""])
    {
        var1=true;
    }
    if( [_textField2.text isEqualToString:@""])
    {
        var2=true;
    }
    if( [_textField3.text isEqualToString:@""])
    {
        var3=true;
    }
    if( [_textField4.text isEqualToString:@""])
    {
        var4=true;
    }
    float variable1 = [_textField1.text floatValue]; //reads value of first text field and stores as a float value
    float variable2 = [_textField2.text floatValue]; //reads value of second text field and stores as a float value
    float variable3 = [_textField3.text floatValue];
    float variable4 = [_textField4.text floatValue];//reads value of third text field and stores as a float value
    
    if(check == MASS)
    {
        if (variable2 != 0)
        {
            variable1 = variable2/453.59237;
        }
        else if (variable3 != 0)
        {
            variable1 = variable3/7000;
        }
        else if (variable4 != 0)
        {
            variable1 = variable4/16;
        }
        
        variable2 = variable1*453.59237;
        variable3 = variable1*7000;
        variable4 = variable1*16;
        
        self.textField1.text = [NSString stringWithFormat:@"%.4f",variable1];
        self.textField2.text = [NSString stringWithFormat:@"%.4f",variable2];
        self.textField3.text = [NSString stringWithFormat:@"%.4f",variable3];
        self.textField4.text = [NSString stringWithFormat:@"%.4f",variable4];
    }
    else if(check == PRESSURE)
    {
        if (variable2 != 0)
        {
            variable1 = variable2/14.7;
        }
        else if (variable3 != 0)
        {
            variable1 = variable3/760;
        }
        else if (variable4 != 0)
        {
            variable1 = variable4/33.93;
        }
        
        variable2 = variable1*14.7;
        variable3 = variable1*760;
        variable4 = variable1*33.93;
        
        self.textField1.text = [NSString stringWithFormat:@"%.4f",variable1];
        self.textField2.text = [NSString stringWithFormat:@"%.4f",variable2];
        self.textField3.text = [NSString stringWithFormat:@"%.4f",variable3];
        self.textField4.text = [NSString stringWithFormat:@"%.4f",variable4];
    }
    else if(check == TEMPERATURE)
    {
        if (var1 == false)
        {
            variable2 = (variable1-32)*(.555555);
            variable3 = variable1+460;
            variable4 = variable2+273;
        }            
        else if (!var2)
        {
            variable1 = (variable2*(1.8))+32;
            variable3 = variable1+460;
            variable4 = variable2+273;
        }
        else if (!var3)
        {
            variable1 = variable3-460;
            variable2 = (variable1-32)*(.555555);
            variable4 =((variable1-32)*(.555555))+273;
        }
        else if (!var4)
        {
            variable2 = variable4 - 273;
            variable1 = (variable2*(1.8))+32;
            variable3 = variable1+460;
        }            
            
        self.textField1.text = [NSString stringWithFormat:@"%.4f",variable1];
        self.textField2.text = [NSString stringWithFormat:@"%.4f",variable2];
        self.textField3.text = [NSString stringWithFormat:@"%.4f",variable3];
        self.textField4.text = [NSString stringWithFormat:@"%.4f",variable4];   
    }
    
    
    else 
    {
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
                                      numAndArgs:4, (double)variable1, (double)variable2, (double)variable3, (double)variable4];
    }
    
    else if (check == NOISE)
    {
        chosenFormula = noiseManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:4, (double)variable1, (double)variable2, (double)variable3, (double)variable4];
    }
    
    else if (check == EXPOSUREASSESSMENT)
    {
        chosenFormula = exposureManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:4, (double)variable1, (double)variable2, (double)variable3, (double)variable4];
    }
    else if (check == VENTILATION)
    {
        chosenFormula = ventilationManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:4, (double)variable1, (double)variable2, (double)variable3, (double)variable4];
    }
    
    calculationResult = calculationResult * 100.0;
    calculationResult = roundf(calculationResult);
    calculationResult = calculationResult/100.0;
    
    // don't forget to unbox calculationResult, or the pointer will be printed as a float :)
    self.result.text = [NSString stringWithFormat:@"%.2f", calculationResult]; //outputs calculation result
    self.resultUnit.text = [chosenFormula objectForKey:@"resultUnit"];
    }
}

- (IBAction)clearButtonPressed{
    self.textField1.text = [NSString stringWithFormat:@""];
    self.textField2.text = [NSString stringWithFormat:@""];
    self.textField3.text = [NSString stringWithFormat:@""];
    self.textField4.text = [NSString stringWithFormat:@""];
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
    
    _textField1.frame = CGRectMake(80, 85, 97, 31);
    _variable1.frame = CGRectMake(1, 95, 76, 21);
    _unit1.frame = CGRectMake(182, 95, 62, 21);
    
    _textField2.frame = CGRectMake(80, 125, 97, 31);
    _variable2.frame = CGRectMake(1, 135, 76, 21);
    _unit2.frame = CGRectMake(182, 135, 62, 21);
    
    _textField3.frame = CGRectMake(303, 85, 97, 31);
    _variable3.frame = CGRectMake(245, 95, 55, 21);
    _unit3.frame = CGRectMake(405, 95, 75, 21);
    
    _textField4.frame = CGRectMake(303, 125, 97, 31);
    _variable4.frame = CGRectMake(245, 135, 55, 21);
    _unit4.frame = CGRectMake(405, 135, 75, 21);

    
    _result.frame = CGRectMake(79, 175, 207, 29);
    _resultUnit.frame = CGRectMake(307, 186, 85, 21);
    
    _calcButton.frame = CGRectMake(404, 177, 75, 35);
    _clearButton.frame = CGRectMake(2, 177, 75, 35);
    
}
else
{
    _textField1.frame = CGRectMake(112, 94, 97, 31);
    _variable1.frame = CGRectMake(1, 104, 103, 21);
    _unit1.frame = CGRectMake(220, 104, 99, 21);
    
    _textField2.frame = CGRectMake(112, 134, 97, 31);
    _variable2.frame = CGRectMake(1, 144, 103, 21);
    _unit2.frame = CGRectMake(220, 144, 99, 21);
    
    _textField3.frame = CGRectMake(112, 174, 97, 31);
    _variable3.frame = CGRectMake(1, 184, 103, 21);
    _unit3.frame = CGRectMake(220, 184, 99, 21);
    
    _textField4.frame = CGRectMake(112, 214, 97, 31);
    _variable4.frame = CGRectMake(1, 224, 103, 21);
    _unit4.frame = CGRectMake(220, 224, 99, 21);
    
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];    
    int check = catManager.category;
    if (check == MASS)
    {
        self.variable1.text = @" ";
        self.variable2.text = @" ";
        self.variable3.text = @" ";
        self.variable4.text = @" ";
        self.unit1.text = @"pounds"; 
        self.unit2.text = @"grams";
        self.unit3.text = @"grains";
        self.unit4.text = @"ounces";
        self.resultUnit.text = @" ";
        self.result.text = @" ";
        self.formula.text = @"Mass Conversions";
        
    }
    else if (check == PRESSURE)
    {
        self.variable1.text = @" ";
        self.variable2.text = @" ";
        self.variable3.text = @" ";
        self.variable4.text = @" ";
        self.unit1.text = @"atm"; 
        self.unit2.text = @"psi";
        self.unit3.text = @"mm Hg";
        self.unit4.text = @"ft water";
        self.resultUnit.text = @" ";
        self.result.text = @" ";
        self.formula.text = @"Pressure Conversions";
        
    }
    else if (check == TEMPERATURE)
    {
        self.variable1.text = @" ";
        self.variable2.text = @" ";
        self.variable3.text = @" ";
        self.variable4.text = @" ";
        self.unit1.text = @"Farenheit"; 
        self.unit2.text = @"Celsius";
        self.unit3.text = @"Rankine";
        self.unit4.text = @"Kelvin";
        self.resultUnit.text = @" ";
        self.result.text = @" ";
        self.formula.text = @"Pressure Conversions";
        
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
    NSString *unit1Text = [chosenFormula objectForKey:@"unit1"];
    NSString *unit2Text = [chosenFormula objectForKey:@"unit2"];
    NSString *unit3Text = [chosenFormula objectForKey:@"unit3"];
    NSString *unit4Text = [chosenFormula objectForKey:@"unit4"];
    NSString *formulaText = [chosenFormula objectForKey:@"imageName"];   
    //NSString *formulaText = [chosenFormula objectForKey:@"formula"];
    NSString *resultUnitText = [chosenFormula objectForKey:@"resultUnit"];
    self.variable1.text = variable1Text;
    self.variable2.text = variable2Text;
    self.variable3.text = variable3Text;
    self.variable4.text = variable4Text;
    self.unit1.text = unit1Text; 
    self.unit2.text = unit2Text;
    self.unit3.text = unit3Text;
    self.unit4.text = unit4Text;
    self.formulaImage.image = [UIImage imageNamed:formulaText];
    //self.formula.text = formulaText;
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
        
        _textField1.frame = CGRectMake(80, 85, 97, 31);
        _variable1.frame = CGRectMake(1, 95, 76, 21);
        _unit1.frame = CGRectMake(182, 95, 62, 21);
        
        _textField2.frame = CGRectMake(80, 125, 97, 31);
        _variable2.frame = CGRectMake(1, 135, 76, 21);
        _unit2.frame = CGRectMake(182, 135, 62, 21);
        
        _textField3.frame = CGRectMake(303, 85, 97, 31);
        _variable3.frame = CGRectMake(245, 95, 55, 21);
        _unit3.frame = CGRectMake(405, 95, 75, 21);
        
        _textField4.frame = CGRectMake(303, 125, 97, 31);
        _variable4.frame = CGRectMake(245, 135, 55, 21);
        _unit4.frame = CGRectMake(405, 135, 75, 21);
        
        _result.frame = CGRectMake(79, 175, 207, 29);
        _resultUnit.frame = CGRectMake(307, 186, 85, 21);
        
        _calcButton.frame = CGRectMake(404, 177, 75, 35);
        _clearButton.frame = CGRectMake(2, 177, 75, 35);
        
    }
    else
    {
        _textField1.frame = CGRectMake(112, 94, 97, 31);
        _variable1.frame = CGRectMake(1, 104, 103, 21);
        _unit1.frame = CGRectMake(220, 104, 99, 21);
        
        _textField2.frame = CGRectMake(112, 134, 97, 31);
        _variable2.frame = CGRectMake(1, 144, 103, 21);
        _unit2.frame = CGRectMake(220, 144, 99, 21);
        
        _textField3.frame = CGRectMake(112, 174, 97, 31);
        _variable3.frame = CGRectMake(1, 184, 103, 21);
        _unit3.frame = CGRectMake(220, 184, 99, 21);
        
        _textField4.frame = CGRectMake(112, 214, 97, 31);
        _variable4.frame = CGRectMake(1, 224, 103, 21);
        _unit4.frame = CGRectMake(220, 224, 99, 21);
        
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
