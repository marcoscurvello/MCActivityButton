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
    
    // Allocate an instance of MCActivityButton
    _activityButton = [[MCActivityButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, self.view.frame.size.height / 2 - 80, 100, 40)];
    
    // Default UIButton customization
    [_activityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _activityButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    _activityButton.backgroundColor = [UIColor darkGrayColor];
    
    // Initial and Action Button Title
    _activityButton.initialTitle  = @"Dowload File";
    _activityButton.activityTitle = @"Downloading...";
    
    // Locks subsequent button clicks
    _activityButton.lockTaps = NO;
    
    // Button title animation duration
    _activityButton.buttonAnimationDuration = 0.5;
    
    // Optional Rounded Edges
    _activityButton.layer.cornerRadius  = 5;
    _activityButton.clipsToBounds = YES;
    
    //Customize activity indicator
    _activityButton.activityIndicatorColor  = [UIColor whiteColor];
    _activityButton.activityIndicatorMargin = 0;
    _activityButton.activityIndicatorScale  = 0.8;
    
    
    // Allocate an instance of MCActivityButton
    MCActivityButton *button = [[MCActivityButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, self.view.frame.size.height / 2 - 20, 80, 40)];
    
    // Default UIButton customization
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    button.backgroundColor = [UIColor colorWithRed:0.000 green:0.294 blue:0.624 alpha:1.000];
    
    // Initial and Action Button Title
    button.initialTitle  = @"Login";
    button.activityTitle = @"Logging in...";
    
    // Locks subsequent button clicks
    button.lockTaps = NO;
    
    // Button title animation duration
    button.buttonAnimationDuration = 0.5;
    
    // Optional Rounded Edges
    button.layer.cornerRadius = 20;
    button.clipsToBounds      = YES;
    
    // Customize activity indicator color
    button.activityIndicatorColor  = [UIColor whiteColor];
    button.activityIndicatorMargin = 7;
    
    // Customize the scale factor of the activity indicator
    button.activityIndicatorScale  = 0.8;
    
    // Add Buttons to the view
    [self.view addSubview:button];
    [self.view addSubview:self.activityButton];
    
    
    // Simulate button click
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        [self.activityButton setHighlighted:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            
            // Stop button animation
            [self.activityButton stopAnimating];
            
        });
        
    });
    
    // Simulate button click
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        [button setHighlighted:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            
            // Stop button animation
            [button stopAnimating];
        
        });
    
    });
        
}


@end
