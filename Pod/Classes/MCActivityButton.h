//
//  MCActivityButton.h
//  Pods
//
//  Created by Marcos Curvello on 4/24/15.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MCActivityButtonStyle) {
    MCActivityButtonStyleDefault,
    MCActivityButtonStyleIncrease,
    MCActivityButtonStyleDecrease
};

@interface MCActivityButton : UIButton

/**
 *  Activity Indicator View
 */
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

/**
 *  Defines Different Animation Styles for MCActivityButton
 */
@property (nonatomic, readwrite) MCActivityButtonStyle style;

/**
 *  Margin Between Button Title and  Activity Indicator
 */
@property (nonatomic, readwrite) CGFloat activityIndicatorMargin;

/**
 *  MCActivityButton initial frame
 */
@property (nonatomic, readwrite) CGRect initialFrame;

/**
 *  MCActivityButton animate to frame
 */
@property (nonatomic, readwrite) CGRect activityFrame;

/**
 *  Activity Indicator color
 */
@property (nonatomic, strong) UIColor *activityIndicatorColor UI_APPEARANCE_SELECTOR;

/**
 *  Initial Button Title
 */
@property (nonatomic, strong) NSString *initialTitle;

/**
 * Animate to Button Title
 */
@property (nonatomic, strong) NSString *activityTitle;

/**
 *  Track button animation status
 */
@property (nonatomic) BOOL isAnimating;

/**
 *  Locks subsequent button clicks
 */
@property (nonatomic) BOOL lockTaps;

/**
 *  Activity Indicator size
 */
@property float activityIndicatorScale;

/**
 *  Duration for button title switch
 */
@property float buttonAnimationDuration;

/**
 *  Initializer
 *
 *  @param frame MCActivityButton frame
 *
 *  @return MCActivityButton instance
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 *
 *  TO DO implement new button styles
 */
//- (instancetype)initWithFrame:(CGRect)frame buttonStyle:(MCActivityButtonStyle)style;

/**
 *  Revert button to initial state
 */
- (void)stopAnimating;



@end
