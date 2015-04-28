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
    
    _activityButton = [[MCActivityButton alloc] initWithFrame:CGRectMake(50, 200, 200, 40) buttonStyle:MCActivityButtonStyleDefault];
    
    _activityButton.titleLabel.textColor       = [UIColor whiteColor];
    _activityButton.titleLabel.backgroundColor = [UIColor purpleColor];
    _activityButton.backgroundColor            = [UIColor blueColor];
    
    [self.activityButton setButtonActionTitle:@"Logging In..."];
    [self.activityButton setTitle:@"Sign In" forState:UIControlStateNormal];
    
    
    [self.view addSubview:self.activityButton];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
