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
    MCActivityButtonStyleAnimatedCircle,
    MCActivityButtonStyleAnimatedMessage
};

typedef NS_ENUM(NSInteger, MCActivityButtonAnimationStyle) {
    MCActivityButtonAnimationStyleLeft,
    MCActivityButtonAnimationStyleRight
};

@interface MCActivityButton : UIButton

@property (nonatomic, readwrite) MCActivityButtonStyle style;

@property (nonatomic, readwrite) MCActivityButtonAnimationStyle animationStyle;

@property (nonatomic, readwrite) CGRect buttonFrame;

@property (nonatomic, readwrite) CGFloat cornerRadius UI_APPEARANCE_SELECTOR;

@property (nonatomic, readwrite) CGFloat activityIndicatorMargin;

@property (nonatomic, strong) UIColor *buttonColor UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) UIColor *activityIndicatorColor UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) NSString *buttonTitle;

@property (nonatomic, strong) NSString *buttonActionTitle;

@property (nonatomic) BOOL isAnimating;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

#pragma instancetypes

- (instancetype)initWithFrame:(CGRect)frame;

- (instancetype)initWithFrame:(CGRect)frame buttonStyle:(MCActivityButtonStyle)style;

#pragma mark Setters

- (void)setButtonColor:(UIColor *)buttonColor;

- (void)setButtonTitle:(NSString *)buttonTitle;

- (void)setCornerRadius:(CGFloat)cornerRadius;


@end
