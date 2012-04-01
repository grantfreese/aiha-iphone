//
//  ThreeVariableViewController.m
//  CalculationsAIHA
//
//  Created by asuuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThreeVariableViewController.h"
#import "CategoryManager.h"

#define NOISE 1
#define HEATSTRESS 2
#define VENTILATION 3
#define EXPOSUREASSESSMENT 4

@implementation ThreeVariableViewController

@synthesize textField1 = _textField1;
@synthesize textField2 = _textField2;
@synthesize textField3 = _textField3;
@synthesize variable1 = _variable1;
@synthesize variable2 = _variable2;
@synthesize variable3 = _variable3;
@synthesize unit1 = _unit1;
@synthesize unit2 = _unit2;
@synthesize unit3 = _unit3;
@synthesize result = _result;
@synthesize formula = _formula;
@synthesize resultUnit = _resultUnit;
@synthesize formulaImage = _formulaImage;
@synthesize theUselessFormulas = _theUselessFormulas;
@synthesize calcButton = _calcButton;
@synthesize clearButton = _clearButton;

- (IBAction) calculateButtonPressed{
    float variable1 = [_textField1.text floatValue]; //reads value of first text field and stores as a float value
    float variable2 = [_textField2.text floatValue]; //reads value of second text field and stores as a float value
    float variable3 = [_textField3.text floatValue]; //reads value of third text field and stores as a float value
    
    float calculationResult;
    
    HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
    NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
    ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
    VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
    
    NSDictionary *chosenFormula;
    
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    
    int check = catManager.category;
    
    if (check == HEATSTRESS)
    {
        chosenFormula = heatManager.selectedFormula;
        
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:3, (double)variable1, (double)variable2, (double)variable3]; 
    }
    
    else if (check == NOISE) //(noiseManager != nil)
    {
        chosenFormula = noiseManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:3, (double)variable1, (double)variable2, (double)variable3]; 
     }
   
    else if (check == EXPOSUREASSESSMENT)//(exposureManager != nil)
    {
        chosenFormula = exposureManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:3, (double)variable1, (double)variable2, (double)variable3]; 
    }
    else if (check == VENTILATION)//(ventilationManager != nil)
    {
        chosenFormula = ventilationManager.selectedFormula;
        calculationResult =[formulas runFunction:[chosenFormula objectForKey:@"method"]
                                      numAndArgs:3, (double)variable1, (double)variable2, (double)variable3]; 
    }
    
    self.result.text = [NSString stringWithFormat:@"%.2f", calculationResult]; //outputs calculation result
    self.resultUnit.text = [chosenFormula objectForKey:@"resultUnit"];
}

- (IBAction)clearButtonPressed{
    self.textField1.text = [NSString stringWithFormat:@""];
    self.textField2.text = [NSString stringWithFormat:@""];
    self.textField3.text = [NSString stringWithFormat:@""];
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
{  if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
       self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
{
    
    _textField1.frame = CGRectMake(192, 65, 97, 31);
    _variable1.frame = CGRectMake(98, 75, 90, 21);
    _unit1.frame = CGRectMake(294, 75, 99, 21);
    
    _textField2.frame = CGRectMake(192, 105, 97, 31);
    _variable2.frame = CGRectMake(98, 115, 90, 21);
    _unit2.frame = CGRectMake(294, 115, 99, 21);
    
    _textField3.frame = CGRectMake(192, 145, 97, 31);
    _variable3.frame = CGRectMake(98, 155, 90, 21);
    _unit3.frame = CGRectMake(294, 155, 99, 21);
    
    _result.frame = CGRectMake(92, 186, 210, 21);
    _resultUnit.frame = CGRectMake(315, 188, 85, 21);
    
    _calcButton.frame = CGRectMake(415, 162, 55, 55);
    _clearButton.frame = CGRectMake(10, 162, 55, 55);
    
}
else
{
    
    _textField1.frame = CGRectMake(112, 134, 97, 31);
    _variable1.frame = CGRectMake(1, 144, 103, 21);
    _unit1.frame = CGRectMake(220, 144, 99, 21);
    
    _textField2.frame = CGRectMake(112, 174, 97, 31);
    _variable2.frame = CGRectMake(1, 184, 103, 21);
    _unit2.frame = CGRectMake(220, 184, 99, 21);
    
    _textField3.frame = CGRectMake(112, 214, 97, 31);
    _variable3.frame = CGRectMake(1, 224, 103, 21);
    _unit3.frame = CGRectMake(220, 224, 99, 21);
    
    _result.frame = CGRectMake(12, 333, 210, 21);
    _resultUnit.frame = CGRectMake(238, 335, 85, 21);
    
    _calcButton.frame = CGRectMake(253, 271, 55, 55);
    _clearButton.frame = CGRectMake(12, 271, 55, 55);
}
    [super viewWillAppear:animated];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
    NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
    ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
    VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
    
    NSDictionary *chosenFormula;
    
    self.theUselessFormulas = [[formulas alloc] init];
    
    
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    
    int check = catManager.category;
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
    NSString *unit1Text = [chosenFormula objectForKey:@"unit1"];
    NSString *unit2Text = [chosenFormula objectForKey:@"unit2"];
    NSString *unit3Text = [chosenFormula objectForKey:@"unit3"];
    NSString *formulaText = [chosenFormula objectForKey:@"imageName"];
    //NSString *formulaText = [chosenFormula objectForKey:@"formula"];
    NSString *resultUnitText = [chosenFormula objectForKey:@"resultUnit"];
    self.variable1.text = variable1Text;
    self.variable2.text = variable2Text;
    self.variable3.text = variable3Text;
    self.unit1.text = unit1Text; 
    self.unit2.text = unit2Text;
    self.unit3.text = unit3Text;
    self.formulaImage.image = [UIImage imageNamed:formulaText];
    //self.formula.text = formulaText;
    self.resultUnit.text = resultUnitText;
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
        
        _textField1.frame = CGRectMake(192, 65, 97, 31);
        _variable1.frame = CGRectMake(98, 75, 90, 21);
        _unit1.frame = CGRectMake(294, 75, 99, 21);
        
        _textField2.frame = CGRectMake(192, 105, 97, 31);
        _variable2.frame = CGRectMake(98, 115, 90, 21);
        _unit2.frame = CGRectMake(294, 115, 99, 21);
        
        _textField3.frame = CGRectMake(192, 145, 97, 31);
        _variable3.frame = CGRectMake(98, 155, 90, 21);
        _unit3.frame = CGRectMake(294, 155, 99, 21);
        
        _result.frame = CGRectMake(92, 186, 210, 21);
        _resultUnit.frame = CGRectMake(315, 188, 85, 21);
        
        _calcButton.frame = CGRectMake(415, 162, 55, 55);
        _clearButton.frame = CGRectMake(10, 162, 55, 55);
        
    }
    else
    {
        
        _textField1.frame = CGRectMake(112, 134, 97, 31);
        _variable1.frame = CGRectMake(1, 144, 103, 21);
        _unit1.frame = CGRectMake(220, 144, 99, 21);
        
        _textField2.frame = CGRectMake(112, 174, 97, 31);
        _variable2.frame = CGRectMake(1, 184, 103, 21);
        _unit2.frame = CGRectMake(220, 184, 99, 21);
        
        _textField3.frame = CGRectMake(112, 214, 97, 31);
        _variable3.frame = CGRectMake(1, 224, 103, 21);
        _unit3.frame = CGRectMake(220, 224, 99, 21);
        
        
        
        _result.frame = CGRectMake(12, 333, 210, 21);
        _resultUnit.frame = CGRectMake(238, 335, 85, 21);
        
        _calcButton.frame = CGRectMake(253, 271, 55, 55);
        _clearButton.frame = CGRectMake(12, 271, 55, 55);
    }
}
@end
