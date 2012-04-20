//
//  OneVariableView.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OneVariableViewController.h"
#import "CategoryManager.h"
#import <QuartzCore/QuartzCore.h> 

#define NOISE 1
#define HEATSTRESS 2
#define VENTILATION 3
#define EXPOSUREASSESSMENT 4

@implementation OneVariableViewController
@synthesize textField1 = _textField1;
@synthesize variable1 = _variable1;
@synthesize unit1 = _unit1;
@synthesize result = _result;
@synthesize formula = _formula;
@synthesize resultUnit = _resultUnit;
@synthesize formulaImage = _formulaImage;
@synthesize calcButton = _calcButton;
@synthesize clearButton = _clearButton;
- (IBAction) calculateButtonPressed{
    float variable1 = [_textField1.text floatValue]; //reads value of first text field and stores as a float value
    NSNumber * calculationResult;
    
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
        
        SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
        // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
        // to call it.  The implementation of this function should take two NSNumbers and return an
        // NSNumber.
        calculationResult = [formulas performSelector:method 
                                           withObject:[NSNumber numberWithFloat: variable1]];
    }
    else if (check == NOISE)
    {
        chosenFormula = noiseManager.selectedFormula;
        SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
        // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
        // to call it.  The implementation of this function should take two NSNumbers and return an
        // NSNumber.
        calculationResult = [formulas performSelector:method 
                                           withObject:[NSNumber numberWithFloat: variable1]];
        
    }
    else if (check == EXPOSUREASSESSMENT)
    {
        chosenFormula = exposureManager.selectedFormula;
        SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
        // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
        // to call it.  The implementation of this function should take two NSNumbers and return an
        // NSNumber.
        calculationResult = [formulas performSelector:method 
                                           withObject:[NSNumber numberWithFloat: variable1]];        
    }
    else if (check == VENTILATION)
    {
        chosenFormula = ventilationManager.selectedFormula;
        SEL method = NSSelectorFromString([chosenFormula objectForKey:@"method"]);
        // box the two parameters to be NSNumbers so we can use performSelector:withObject:withObject
        // to call it.  The implementation of this function should take two NSNumbers and return an
        // NSNumber.
        calculationResult = [formulas performSelector:method 
                                           withObject:[NSNumber numberWithFloat: variable1]];        
    }
    
    float result = [calculationResult floatValue];
    result = result * 100.0;
    result = roundf(result);
    result = result/100.0;
    
    // don't forget to unbox calculationResult, or the pointer will be printed as a float :)
    self.result.text = [NSString stringWithFormat:@"%.2f", result]; //outputs calculation result
    self.resultUnit.text = [chosenFormula objectForKey:@"resultUnit"];
}

- (IBAction)clearButtonPressed{
    self.textField1.text = [NSString stringWithFormat:@""];
}

//removes keyboard when return is pressed
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"before call");
    [textField resignFirstResponder];
    NSLog(@"after call");
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
    _textField1.frame = CGRectMake(192, 110, 97, 31);
    _variable1.frame = CGRectMake(92, 120, 77, 21);
    _unit1.frame = CGRectMake(310, 120, 77, 21);
    _result.frame = CGRectMake(92, 186, 210, 21);
    _resultUnit.frame = CGRectMake(310, 188, 85, 21);
    
    _calcButton.frame = CGRectMake(404, 177, 75, 35);
    _clearButton.frame = CGRectMake(2, 177, 75, 35);
    
}
else
{
    _textField1.frame = CGRectMake(112, 184, 97, 31);
    _variable1.frame = CGRectMake(12, 194, 77, 21);
    _unit1.frame = CGRectMake(230, 194, 77, 21);
    _result.frame = CGRectMake(12, 333 , 210, 21);
    _resultUnit.frame = CGRectMake(233, 335, 85, 21);
        
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
    
    [_result scrollRectToVisible:CGRectMake(1, 0, 240, 28) 
                            animated:NO];
    [super viewWillAppear:animated];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
    NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
    ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
    VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
    
    NSDictionary *chosenFormula;
    
    
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
    NSString *unit1Text = [chosenFormula objectForKey:@"unit1"];
    NSString *formulaText = [chosenFormula objectForKey:@"imageName"];    
    //NSString *formulaText = [chosenFormula objectForKey:@"formula"];
    NSString *resultUnitText = [chosenFormula objectForKey:@"resultUnit"];
    self.variable1.text = variable1Text;
    self.unit1.text = unit1Text; 
    self.formulaImage.image = [UIImage imageNamed:formulaText];
    //self.formula.text = formulaText;
    self.resultUnit.text = resultUnitText;
    
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
        _textField1.frame = CGRectMake(192, 110, 97, 31);
        _variable1.frame = CGRectMake(92, 120, 77, 21);
        _unit1.frame = CGRectMake(310, 120, 77, 21);
        _result.frame = CGRectMake(92, 186, 210, 21);
        _resultUnit.frame = CGRectMake(310, 188, 85, 21);
        
        _calcButton.frame = CGRectMake(404, 177, 75, 35);
        _clearButton.frame = CGRectMake(2, 177, 75, 35);
        
    }
    else
    {
        _textField1.frame = CGRectMake(112, 184, 97, 31);
        _variable1.frame = CGRectMake(12, 194, 77, 21);
        _unit1.frame = CGRectMake(230, 194, 77, 21);
        _result.frame = CGRectMake(12, 333, 210, 21);
        _resultUnit.frame = CGRectMake(233, 335, 85, 21);
        
        _calcButton.frame = CGRectMake(180, 285, 75, 35);
        _clearButton.frame = CGRectMake(65, 285, 75, 35);
    }
}




@end
