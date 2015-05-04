//
//  MCActivityButtonViewController.m
//  MCActivityButton
//
//  Created by Marcos Curvello on 04/24/2015.
//  Copyright (c) 2014 Marcos Curvello. All rights reserved.
//

#import "MCActivityButtonViewController.h"


@interface MCActivityButtonViewController ()

@end

@implementation MCActivityButtonViewController

@synthesize activityButton = _activityButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //Select the preferred MCActivityButtonStyle
    _activityButton = [[MCActivityButton alloc] initWithFrame:CGRectMake(40, 200, 140, 40) buttonStyle:MCActivityButtonStyleAnimatedMessage];
    
    _activityButton.titleLabel.textColor = [UIColor whiteColor];
    _activityButton.backgroundColor      = [UIColor colorWithRed:0.000 green:0.294 blue:0.624 alpha:1.000];

    _activityButton.activityIndicatorMargin = 5;
    _activityButton.activityIndicatorColor  = [UIColor whiteColor];
    
    _activityButton.buttonActionTitle = @"Logging In...";
    [self.activityButton setTitle:@"Sign In" forState:UIControlStateNormal];
    
    _activityButton.titleLabel.backgroundColor = [UIColor purpleColor];
    
    _activityButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    
    
    // Rounded Edges Setting
    _activityButton.layer.cornerRadius  = 5;
    _activityButton.clipsToBounds = YES;
    
    [self.view addSubview:self.activityButton];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
