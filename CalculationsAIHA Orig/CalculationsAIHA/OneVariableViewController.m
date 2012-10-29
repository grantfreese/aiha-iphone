//
//  OneVariableView.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
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
@synthesize resultBar = _resultBar;
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
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//hides keyboard and linked to Calculate button so that keyboard disappears when Calculate button is pressed
-(IBAction) hideKeyboard
{
    [_textField1 resignFirstResponder];
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
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPhone Simulator"]||[deviceType isEqualToString:@"iPod touch"])
    {
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            _textField1.frame = CGRectMake(192, 110, 97, 31);
            _variable1.frame = CGRectMake(92, 120, 77, 21);
            _unit1.frame = CGRectMake(310, 120, 77, 21);
            _result.frame = CGRectMake(79, 175, 210, 31);
            _resultUnit.frame = CGRectMake(307, 186, 85, 21);
    
            _calcButton.frame = CGRectMake(404, 177, 75, 35);
            _clearButton.frame = CGRectMake(2, 177, 75, 35);
        }
        else
        {
            _textField1.frame = CGRectMake(112, 184, 97, 31);
            _variable1.frame = CGRectMake(12, 194, 77, 21);
            _unit1.frame = CGRectMake(230, 194, 77, 21);
            _result.frame = CGRectMake(11, 324 , 208, 31);
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
            _variable1.frame = CGRectMake(368, 85, 100, 40);
            _unit1.frame = CGRectMake(590, 85, 77, 40);
            _result.frame = CGRectMake(635, 345, 210, 45);
            _resultUnit.frame = CGRectMake(850, 355, 85, 45);
            _resultBar.frame = CGRectMake(0, 350, 1025, 50);
            
            _calcButton.frame = CGRectMake(850, 300, 107, 50);
            _clearButton.frame = CGRectMake(10, 300, 107, 50);
        }
        else
        { //Portrait Mode
            _textField1.frame = CGRectMake(345, 150, 97, 40);
            _variable1.frame = CGRectMake(240, 150, 100, 40);
            _unit1.frame = CGRectMake(465, 150, 77, 40);
            _result.frame = CGRectMake(360, 555 , 208, 45);
            _resultUnit.frame = CGRectMake(590, 563, 85, 45);
            _resultBar.frame = CGRectMake(0, 555, 768, 64);
    
            _calcButton.frame = CGRectMake(529, 500, 107, 50);
            _clearButton.frame = CGRectMake(123, 500, 107, 50);
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
        
    //NSString *formulaText = [chosenFormula objectForKey:@"formula"];
    NSString *resultUnitText = [chosenFormula objectForKey:@"resultUnit"];
    self.variable1.text = variable1Text;
    self.unit1.text = unit1Text;
    
    NSString *formulaText = [chosenFormula objectForKey:@"imageName"];
    self.formulaImage.image = [UIImage imageNamed:formulaText];
    
    /*
    //Get image for the screen (depending on device type)
    if([deviceType isEqualToString:@"iPad"]||[deviceType isEqualToString:@"iPad Simulator"])
    {
        formulaText = [chosenFormula objectForKey:@"imageNameIpad"];
    }
    else
    {
        formulaText = [chosenFormula objectForKey:@"imageName"];
    }
    self.formulaImage.image = [UIImage imageNamed:formulaText];
    */
    
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
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPhone Simulator"]||[deviceType isEqualToString:@"iPod touch"])
    {
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            _textField1.frame = CGRectMake(192, 110, 97, 31);
            _variable1.frame = CGRectMake(92, 120, 77, 21);
            _unit1.frame = CGRectMake(310, 120, 77, 21);
            _result.frame = CGRectMake(79, 175, 210, 31);
            _resultUnit.frame = CGRectMake(307, 186, 85, 21);
            
            _calcButton.frame = CGRectMake(404, 177, 75, 35);
            _clearButton.frame = CGRectMake(2, 177, 75, 35);
        }
        else
        {
            _textField1.frame = CGRectMake(112, 184, 97, 31);
            _variable1.frame = CGRectMake(12, 194, 77, 21);
            _unit1.frame = CGRectMake(230, 194, 77, 21);
            _result.frame = CGRectMake(11, 324 , 208, 31);
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
            _variable1.frame = CGRectMake(368, 85, 100, 40);
            _unit1.frame = CGRectMake(590, 85, 77, 40);
            _result.frame = CGRectMake(635, 345, 210, 45);
            _resultUnit.frame = CGRectMake(850, 355, 85, 45);
            _resultBar.frame = CGRectMake(0, 350, 1025, 50);
            
            _calcButton.frame = CGRectMake(850, 300, 107, 50);
            _clearButton.frame = CGRectMake(10, 300, 107, 50);
        }
        else
        { //Portrait Mode
            _textField1.frame = CGRectMake(345, 150, 97, 40);
            _variable1.frame = CGRectMake(240, 150, 100, 40);
            _unit1.frame = CGRectMake(465, 150, 77, 40);
            _result.frame = CGRectMake(360, 555 , 208, 45);
            _resultUnit.frame = CGRectMake(590, 563, 85, 45);
            _resultBar.frame = CGRectMake(0, 555, 768, 64);
            
            _calcButton.frame = CGRectMake(529, 500, 107, 50);
            _clearButton.frame = CGRectMake(123, 500, 107, 50);
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
