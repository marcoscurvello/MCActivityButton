# MCActivityButton

[![CI Status](http://img.shields.io/travis/marcoscurvello/MCActivityButton.svg?style=flat)](https://travis-ci.org/marcoscurvello/MCActivityButton)
[![Version](https://img.shields.io/cocoapods/v/MCActivityButton.svg?style=flat)](http://cocoapods.org/pods/MCActivityButton)
[![license MIT](http://img.shields.io/badge/license-MIT-orange.png)][mitLink]

`MCActivityButton` is an objective-c `UIButton` subclass that animates a standard iOS activity indicator with a custom title when tapped.

This is currently a work in progress and has not been thoroughly tested. Use at your own risk.

![Demo][demo]


## Requirements
* ARC

## Installation

From [CocoaPods](http://cocoapods.org):

#### Podfile
```ruby
pod "MCActivityButton"
```

## Usage

```objc
#import <MCActivityButton/MCActivityButton.h>
```

Create a `MCActivityButton` object and customize it.

```objc
MCActivityButton *button = [MCActivityButton alloc] initWithFrame:CGRectMake()];

```

Once you have your button object customize it like so:

```objc
// Default UIButton customization
[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
button.titleLabel.font      = [UIFont fontWithName:@"HelveticaNeue" size:14];
button.backgroundColor      = [UIColor colorWithRed:0.000 green:0.294 blue:0.624 alpha:1.000];

// Initial and Action Button Title
button.initialTitle  = @"Login";
button.activityTitle = @"Logging in...";

// Locks Subsequent Button Clicks
button.lockTaps = YES;

// Button title animation duration
button.buttonAnimationDuration = 0.5;

// Optional Rounded Edges
button.layer.cornerRadius = 5;
button.clipsToBounds = YES;

// Customize Activity Indicator
button.activityIndicatorColor  = [UIColor whiteColor];
button.activityIndicatorMargin = 6;
button.activityIndicatorScale  = 0.8;

// Then Add Your Button to the view
[self.view addSubview:button];

// Force button to return to it's initial state
[button stopAnimating];

```

## To-do's

* Fully implement view tests.
* Dynamic frame calculations.
* Different animation styles.
* Different activity indicator styles.
* Background and title color change.
* Swift version is underway, with all the above mentioned to-do's.

## Author

Marcos Curvello, mrcurvello@gmail.com

## License

`MCActivityButton` is available under the [MIT License][mitLink]. See the [LICENSE][license] file for more info.

[mitLink]:http://opensource.org/licenses/MIT
[license]:https://github.com/marcoscurvello/MCActivityButton/blob/master/LICENSE
[demo]:https://raw.githubusercontent.com/marcoscurvello/MCActivityButton/master/Screenshots/demo.gif
