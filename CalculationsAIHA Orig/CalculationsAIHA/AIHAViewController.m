//
//  AIHAViewController.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
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
@synthesize TitleLabel = _TitleLabel;
@synthesize logoButton = _logoButton;

- (IBAction)logoButtonPressed
{
    UIApplication *sharedApp = [UIApplication sharedApplication];
    [sharedApp  openURL:[NSURL URLWithString:@"http://www.aiha.org"]];
}

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
{
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPad"]||[deviceType isEqualToString:@"iPad Simulator"])
    {
        
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            _NoiseButton.frame = CGRectMake(400, 245, 250, 80);
            _HeatStressButton.frame = CGRectMake(400, 345, 250, 80);
            _VentilationButton.frame = CGRectMake(400, 445, 250, 80);
            _ExposureAssessmentButton.frame = CGRectMake(400, 545, 250, 80);
            _TitleLabel.frame = CGRectMake(370,145,327,120);
            _logoImage.frame = CGRectMake(0, 0, 1024, 160);
        }
        else
        {
            _NoiseButton.frame = CGRectMake(250, 328, 250, 80);
            _HeatStressButton.frame = CGRectMake(250, 452, 250, 80);
            _VentilationButton.frame = CGRectMake(250, 576, 250, 80);
            _ExposureAssessmentButton.frame = CGRectMake(250, 700, 250, 80);
            _TitleLabel.frame = CGRectMake(219,200,327,120);
            _logoImage.frame = CGRectMake(-111, 0, 1024, 160);
        }
    }
    else
    {
        
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            _NoiseButton.frame = CGRectMake(30, 114, 185, 40);
            _HeatStressButton.frame = CGRectMake(30, 164, 185, 40);
            _VentilationButton.frame = CGRectMake(265, 114, 185, 40);
            _ExposureAssessmentButton.frame = CGRectMake(265, 164, 185, 40);
            _TitleLabel.frame = CGRectMake(171,71,138,32);
        }
        else
        {
            _NoiseButton.frame = CGRectMake(65, 154, 185, 40);
            _HeatStressButton.frame = CGRectMake(65, 204, 185, 40);
            _VentilationButton.frame = CGRectMake(65, 254, 185, 40);
            _ExposureAssessmentButton.frame = CGRectMake(65, 304, 185, 40);
            _TitleLabel.frame = CGRectMake(91,110,138,32);
        }
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
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPad"]||[deviceType isEqualToString:@"iPad Simulator"])
    {
        
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            _NoiseButton.frame = CGRectMake(400, 245, 250, 80);
            _HeatStressButton.frame = CGRectMake(400, 345, 250, 80);
            _VentilationButton.frame = CGRectMake(400, 445, 250, 80);
            _ExposureAssessmentButton.frame = CGRectMake(400, 545, 250, 80);
            _TitleLabel.frame = CGRectMake(370,145,327,120);
            _logoImage.frame = CGRectMake(0, 0, 1024, 160);
            
        }
        else
        {
            _NoiseButton.frame = CGRectMake(250, 328, 250, 80);
            _HeatStressButton.frame = CGRectMake(250, 452, 250, 80);
            _VentilationButton.frame = CGRectMake(250, 576, 250, 80);
            _ExposureAssessmentButton.frame = CGRectMake(250, 700, 250, 80);
            _TitleLabel.frame = CGRectMake(219,200,327,120);
            _logoImage.frame = CGRectMake(-111, 0, 1024, 160);
        }
    }
    else
    {
        
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            _NoiseButton.frame = CGRectMake(30, 114, 185, 40);
            _HeatStressButton.frame = CGRectMake(30, 164, 185, 40);
            _VentilationButton.frame = CGRectMake(265, 114, 185, 40);
            _ExposureAssessmentButton.frame = CGRectMake(265, 164, 185, 40);
            _TitleLabel.frame = CGRectMake(171,71,138,32);
            
        }
        else
        {
            _NoiseButton.frame = CGRectMake(65, 154, 185, 40);
            _HeatStressButton.frame = CGRectMake(65, 204, 185, 40);
            _VentilationButton.frame = CGRectMake(65, 254, 185, 40);
            _ExposureAssessmentButton.frame = CGRectMake(65, 304, 185, 40);
            _TitleLabel.frame = CGRectMake(91,110,138,32);
        }
    }
}
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

@end
