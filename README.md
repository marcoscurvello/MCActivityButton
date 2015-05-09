# MCActivityButton

[![CI Status](http://img.shields.io/travis/Marcos Curvello/MCActivityButton.svg?style=flat)](https://travis-ci.org/Marcos Curvello/MCActivityButton)
[![Version](https://img.shields.io/cocoapods/v/MCActivityButton.svg?style=flat)](http://cocoapods.org/pods/MCActivityButton)
[![License](https://img.shields.io/cocoapods/l/MCActivityButton.svg?style=flat)](http://cocoapods.org/pods/MCActivityButton)
[![Platform](https://img.shields.io/cocoapods/p/MCActivityButton.svg?style=flat)](http://cocoapods.org/pods/MCActivityButton)

## Requirements
* ARC

## Installation

From [CocoaPods](http://cocoapods.org):

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
button.titleLabel.textColor = [UIColor whiteColor];
button.titleLabel.font      = [UIFont fontWithName:@"HelveticaNeue" size:14];
button.backgroundColor      = [UIColor colorWithRed:0.000 green:0.294 blue:0.624 alpha:1.000];

// Initial and Action Button Title
button.initialTitle  = @"Login";
button.activityTitle = @"Logging in...";

// Locks Subsequent Button Clicks
button.buttonClickLock = YES;

// Button title animation duration
button.buttonAnimationDuration = 0.5;

// Optional Rounded Edges
button.layer.cornerRadius      = 5;
button.clipsToBounds           = YES;

// Customize Activity Indicator
button.activityIndicatorColor  = [UIColor whiteColor];
button.activityIndicatorMargin = 6;
button.activityIndicatorScale  = 0.8;

// Then Add Your Button to the view
[self.view addSubview:button];

```

## Author

Marcos Curvello, mrcurvello@gmail.com

## License

`MCActivityButton` is available under the MIT License][mitLink]. See the LICENSE file for more info.

[mitLink]:http://opensource.org/licenses/MIT
