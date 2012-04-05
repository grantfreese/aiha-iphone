//
//  AIHAViewController.m
//  CalculationsAIHA
//
//  Created by asuuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConversionListViewController.h"
#import "NoiseManager.h"
#import "HeatStressManager.h"
#import "ExposureManager.h"
#import "VentilationManager.h"
#import "FiveVariableViewController.h"
#import "FourVariableViewController.h"
#import "CategoryManager.h"

@implementation ConversionListViewController

@synthesize VolumeButton = _VolumeButton;
@synthesize DistanceButton = _DistanceButton;
@synthesize PressureButton = _PressureButton;
@synthesize MassButton = _MassButton;
@synthesize FlowRateButton = _FlowRateButton;
@synthesize TemperatureButton = _TemperatureButton;
@synthesize ConcentrationButton = _ConcentrationButton;
@synthesize ConstantsButton = _ConstantsButton;
@synthesize TLVButton = _TLVButton;
@synthesize AreaButton = _AreaButton;
@synthesize ConversionsLabel = _ConversionsLabel;

- (IBAction)VolumeButtonPressed
{
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    catManager.category = 5;
}
- (IBAction)DistanceButtonPressed
{
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    catManager.category = 6;
}
- (IBAction)PressureButtonPressed
{
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    catManager.category = 7;
}
- (IBAction)MassButtonPressed
{
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    catManager.category = 8;
}
- (IBAction)TemperatureButtonPressed
{
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    catManager.category = 9;
}
- (IBAction)AreaButtonPressed
{
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    catManager.category = 10;
}

/*- (IBAction)HeatStressButtonPressed
 {
 NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
 noiseManager = nil;
 VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
 ventilationManager = nil;
 ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
 exposureManager = nil;
 }
 
 - (IBAction)VentilationButtonPressed
 {
 HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
 heatManager = nil;
 NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
 noiseManager = nil;
 ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
 exposureManager = nil;
 }
 
 - (IBAction)ExposureAsseessmentPressed
 {
 HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
 heatManager = nil;
 VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
 ventilationManager = nil;
 NoiseManager *noiseManager = [NoiseManager sharedNoiseManager];
 noiseManager = nil;
 } */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{  if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
       self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
{
  
    _VolumeButton.frame = CGRectMake(30, 31, 127, 37);
    _DistanceButton.frame = CGRectMake(176, 31, 127, 37);
    _PressureButton.frame = CGRectMake(323, 31, 127, 37);
    _MassButton.frame = CGRectMake(30, 78, 127, 37);
    _TemperatureButton.frame = CGRectMake(176, 78, 127, 37);
    _AreaButton.frame = CGRectMake(323, 78, 127, 37);
    _TLVButton.frame = CGRectMake(30, 125, 127, 37);
    _ConcentrationButton.frame = CGRectMake(176, 125, 127, 37);
    _FlowRateButton.frame = CGRectMake(323, 125, 127, 37);
    _ConstantsButton.frame = CGRectMake(176, 172, 127, 37);
    _ConversionsLabel.frame = CGRectMake(171, -5, 138, 32);
}
else
{
    _VolumeButton.frame = CGRectMake(20, 71, 127, 37);
    _DistanceButton.frame = CGRectMake(173, 71, 127, 37);
    _PressureButton.frame = CGRectMake(20, 121, 127, 37);
    _MassButton.frame = CGRectMake(173, 121, 127, 37);
    _TemperatureButton.frame = CGRectMake(20, 171, 127, 37);
    _AreaButton.frame = CGRectMake(173, 171, 127, 37);
    _TLVButton.frame = CGRectMake(20, 221, 127, 37);
    _ConcentrationButton.frame = CGRectMake(173, 221, 127, 37);
    _FlowRateButton.frame = CGRectMake(20, 271, 127, 37);
    _ConstantsButton.frame = CGRectMake(173, 271, 127, 37);
    _ConversionsLabel.frame = CGRectMake(91, 22, 138, 32);
}
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation 
 duration:(NSTimeInterval)duration
 {
 if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
 toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
 {
     _VolumeButton.frame = CGRectMake(30, 31, 127, 37);
     _DistanceButton.frame = CGRectMake(176, 31, 127, 37);
     _PressureButton.frame = CGRectMake(323, 31, 127, 37);
     _MassButton.frame = CGRectMake(30, 78, 127, 37);
     _TemperatureButton.frame = CGRectMake(176, 78, 127, 37);
     _AreaButton.frame = CGRectMake(323, 78, 127, 37);
     _TLVButton.frame = CGRectMake(30, 125, 127, 37);
     _ConcentrationButton.frame = CGRectMake(176, 125, 127, 37);
     _FlowRateButton.frame = CGRectMake(323, 125, 127, 37);
     _ConstantsButton.frame = CGRectMake(176, 172, 127, 37);
     _ConversionsLabel.frame = CGRectMake(171, -5, 138, 32);
 
 }
 else
 {
     _VolumeButton.frame = CGRectMake(20, 71, 127, 37);
     _DistanceButton.frame = CGRectMake(173, 71, 127, 37);
     _PressureButton.frame = CGRectMake(20, 121, 127, 37);
     _MassButton.frame = CGRectMake(173, 121, 127, 37);
     _TemperatureButton.frame = CGRectMake(20, 171, 127, 37);
     _AreaButton.frame = CGRectMake(173, 171, 127, 37);
     _TLVButton.frame = CGRectMake(20, 221, 127, 37);
     _ConcentrationButton.frame = CGRectMake(173, 221, 127, 37);
     _FlowRateButton.frame = CGRectMake(20, 271, 127, 37);
     _ConstantsButton.frame = CGRectMake(173, 271, 127, 37);
     _ConversionsLabel.frame = CGRectMake(91, 22, 138, 32);
 }
 }
/* - (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
 recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
 recognizer.scale = 1;
 } */

@end
