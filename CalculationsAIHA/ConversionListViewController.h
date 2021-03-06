//
//  ConversionListViewController.h
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConversionListViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *VolumeButton;
@property (nonatomic, strong) IBOutlet UIButton *DistanceButton;
@property (nonatomic, strong) IBOutlet UIButton *PressureButton;
@property (nonatomic, strong) IBOutlet UIButton *MassButton;
@property (nonatomic, strong) IBOutlet UIButton *FlowRateButton;
@property (nonatomic, strong) IBOutlet UIButton *TemperatureButton;
@property (nonatomic, strong) IBOutlet UIButton *ConcentrationButton;
@property (nonatomic, strong) IBOutlet UIButton *AreaButton;
@property (nonatomic, strong) IBOutlet UIButton *TLVButton;
@property (nonatomic, strong) IBOutlet UIButton *ConstantsButton;
@property (nonatomic, strong) IBOutlet UILabel *ConversionsLabel;
@property (nonatomic, strong) IBOutlet UIImageView *logoImage;


@end
