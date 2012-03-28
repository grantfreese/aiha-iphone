//
//  AIHAViewController.m
//  CalculationsAIHA
//
//  Created by asuuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AIHAViewController.h"
#import "NoiseManager.h"
#import "HeatStressManager.h"
#import "ExposureManager.h"
#import "VentilationManager.h"

@implementation AIHAViewController

@synthesize NoiseButton = _NoiseButton;
@synthesize HeatStressButton = _HeatStressButton;
@synthesize VentilationButton = _VentilationButton;
@synthesize ExposureAssessmentButton = _ExposureAssessmentButton;

- (IBAction)NoiseButtonPressed
{
    HeatStressManager *heatManager = [HeatStressManager sharedHeatStressManager];
    heatManager = nil;
    VentilationManager *ventilationManager = [VentilationManager sharedVentilationManager];
    ventilationManager = nil;
    ExposureManager *exposureManager = [ExposureManager sharedExposureManager];
    exposureManager = nil;
}

- (IBAction)HeatStressButtonPressed
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
}

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
    _NoiseButton.frame = CGRectMake(30, 114, 185, 40);
    _HeatStressButton.frame = CGRectMake(30, 164, 185, 40);
    _VentilationButton.frame = CGRectMake(265, 114, 185, 40);
    _ExposureAssessmentButton.frame = CGRectMake(265, 164, 185, 40);
    
}
else
{
    _NoiseButton.frame = CGRectMake(65, 154, 185, 40);
    _HeatStressButton.frame = CGRectMake(65, 204, 185, 40);
    _VentilationButton.frame = CGRectMake(65, 254, 185, 40);
    _ExposureAssessmentButton.frame = CGRectMake(65, 304, 185, 40);
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
        _NoiseButton.frame = CGRectMake(30, 114, 185, 40);
        _HeatStressButton.frame = CGRectMake(30, 164, 185, 40);
        _VentilationButton.frame = CGRectMake(265, 114, 185, 40);
        _ExposureAssessmentButton.frame = CGRectMake(265, 164, 185, 40);

    }
    else
    {
        _NoiseButton.frame = CGRectMake(65, 154, 185, 40);
        _HeatStressButton.frame = CGRectMake(65, 204, 185, 40);
        _VentilationButton.frame = CGRectMake(65, 254, 185, 40);
        _ExposureAssessmentButton.frame = CGRectMake(65, 304, 185, 40);
    }
}
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

@end