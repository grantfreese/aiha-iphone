//
//  FiveVariableViewController.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
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
#define TEMPERATURE 9

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
@synthesize resultBar = _resultBar;
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
    
    bool var1 = false;
    bool var2 = false;
    bool var3 = false;
    bool var4 = false;
    bool var5 = false;
    
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
    if( [_textField5.text isEqualToString:@""])
    {
        var5=true;
    }
    
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
    else if(check == TEMPERATURE)
    {
        if (!var1) //If Celsius
        {
            variable2 = (variable1*(1.8))+32;
            variable3 = variable1+273.15;
            variable4 = variable2+459.67;
            variable5 = variable1*.8;
        }
        else if (!var2) //If Farenheit
        {
            variable1 = (variable2-32)*(.555555);
            variable3 = variable1+273.15;
            variable4 = variable2+459.67;
            variable5 = (variable2-32)*(.444444);
        }
        else if (!var3) //If Kelvin
        {
            variable1 = variable3 - 273.15;
            variable2 = (variable1*(1.8))+32;
            variable4 = variable2+459.67;
            variable5 = variable1*(.8);
        }       
        else if (!var4) //If Rankine
        {
            variable1 = (variable4-491.67)*.555555;
            variable2 = variable4 - 459.67;
            variable3 = variable4*.555555;
            variable5 = variable1*.8;
        }
        else if (!var5) //If Reaumur
        {
            variable1 = variable5*1.25;
            variable2 = (variable1*(1.8))+32;
            variable3 = variable1+273.15;
            variable4 = variable2+459.67;
        }
        
        self.textField1.text = [NSString stringWithFormat:@"%.2f",variable1];
        self.textField2.text = [NSString stringWithFormat:@"%.2f",variable2];
        self.textField3.text = [NSString stringWithFormat:@"%.2f",variable3];
        self.textField4.text = [NSString stringWithFormat:@"%.2f",variable4];  
        self.textField5.text = [NSString stringWithFormat:@"%.2f",variable5];  
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

- (IBAction)clearButtonPressed
{
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
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPhone Simulator"])
    {
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
    }

    if([deviceType isEqualToString:@"iPad"]||[deviceType isEqualToString:@"iPad Simulator"])
    {
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        { //Landscape Mode
            _textField1.frame = CGRectMake(472, 85, 97, 40);
            _variable1.frame = CGRectMake(372, 85, 77, 40);
            _unit1.frame = CGRectMake(590, 85, 77, 40);
            
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
            
            _result.frame = CGRectMake(635, 345, 210, 45);
            _resultUnit.frame = CGRectMake(850, 355, 85, 45);
            _resultBar.frame = CGRectMake(0, 350, 1025, 50);
            
            _calcButton.frame = CGRectMake(850, 275, 150, 70);
            _clearButton.frame = CGRectMake(10, 275, 150, 70);
        }
        else
        { //Portrait Mode
            _textField1.frame = CGRectMake(345, 150, 97, 40);
            _variable1.frame = CGRectMake(250, 150, 77, 40);
            _unit1.frame = CGRectMake(465, 150, 77, 40);
            
            _textField2.frame = CGRectMake(345, 210, 97, 40);
            _variable2.frame = CGRectMake(250, 210, 77, 40);
            _unit2.frame = CGRectMake(465, 210, 77, 40);
            
            _textField3.frame = CGRectMake(345, 270, 97, 40);
            _variable3.frame = CGRectMake(250, 270, 77, 40);
            _unit3.frame = CGRectMake(465, 270, 77, 40);
            
            _textField4.frame = CGRectMake(345, 330, 97, 40);
            _variable4.frame = CGRectMake(250, 330, 77, 40);
            _unit4.frame = CGRectMake(465, 330, 77, 40);
            
            _textField5.frame = CGRectMake(345, 390, 97, 40);
            _variable5.frame = CGRectMake(250, 390, 77, 40);
            _unit5.frame = CGRectMake(465, 390, 77, 40);
            
            _result.frame = CGRectMake(360, 555 , 208, 45);
            _resultUnit.frame = CGRectMake(590, 563, 85, 45);
            _resultBar.frame = CGRectMake(0, 555, 768, 64);
            
            _calcButton.frame = CGRectMake(529, 468, 150, 70);
            _clearButton.frame = CGRectMake(123, 468, 150, 70);
        }
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
        self.unit5.text = @"quarts";
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
    else if (check == TEMPERATURE)
    {
        self.variable1.text = @" ";
        self.variable2.text = @" ";
        self.variable3.text = @" ";
        self.variable4.text = @" ";
        self.variable5.text = @" ";
        self.unit1.text = @"Celsius";
        self.unit2.text = @"Farenheit";
        self.unit3.text = @"Kelvin";
        self.unit4.text = @"Rankine";
        self.unit5.text = @"Reaumur";
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
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPhone Simulator"])
    {
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
    }
    
    if([deviceType isEqualToString:@"iPad"]||[deviceType isEqualToString:@"iPad Simulator"])
    {
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        { //Landscape Mode
            _textField1.frame = CGRectMake(472, 85, 97, 40);
            _variable1.frame = CGRectMake(372, 85, 77, 40);
            _unit1.frame = CGRectMake(590, 85, 77, 40);
            
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
            
            _result.frame = CGRectMake(635, 345, 210, 45);
            _resultUnit.frame = CGRectMake(850, 355, 85, 45);
            _resultBar.frame = CGRectMake(0, 350, 1025, 50);
            
            _calcButton.frame = CGRectMake(850, 275, 150, 70);
            _clearButton.frame = CGRectMake(10, 275, 150, 70);
        }
        else
        { //Portrait Mode
            _textField1.frame = CGRectMake(345, 150, 97, 40);
            _variable1.frame = CGRectMake(250, 150, 77, 40);
            _unit1.frame = CGRectMake(465, 150, 77, 40);
            
            _textField2.frame = CGRectMake(345, 210, 97, 40);
            _variable2.frame = CGRectMake(250, 210, 77, 40);
            _unit2.frame = CGRectMake(465, 210, 77, 40);
            
            _textField3.frame = CGRectMake(345, 270, 97, 40);
            _variable3.frame = CGRectMake(250, 270, 77, 40);
            _unit3.frame = CGRectMake(465, 270, 77, 40);
            
            _textField4.frame = CGRectMake(345, 330, 97, 40);
            _variable4.frame = CGRectMake(250, 330, 77, 40);
            _unit4.frame = CGRectMake(465, 330, 77, 40);
            
            _textField5.frame = CGRectMake(345, 390, 97, 40);
            _variable5.frame = CGRectMake(250, 390, 77, 40);
            _unit5.frame = CGRectMake(465, 390, 77, 40);
            
            _result.frame = CGRectMake(360, 555 , 208, 45);
            _resultUnit.frame = CGRectMake(590, 563, 85, 45);
            _resultBar.frame = CGRectMake(0, 555, 768, 64);
            
            _calcButton.frame = CGRectMake(529, 468, 150, 70);
            _clearButton.frame = CGRectMake(123, 468, 150, 70);
        }
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
