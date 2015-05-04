//
//  MCActivityButton.m
//  Pods
//
//  Created by Marcos Curvello on 4/24/15.
//
//

#define defaultActivityMargin 10
#define animationDuration 0.3



#import "MCActivityButton.h"

@implementation MCActivityButton

@synthesize activityIndicatorMargin = _activityIndicatorMargin;
@synthesize activityIndicator       = _activityIndicator;
@synthesize isAnimating             = _isAnimating;

#pragma mark - Initializer

- (instancetype)initWithFrame:(CGRect)frame {
    
    return [self initWithFrame:frame buttonStyle:MCActivityButtonStyleDefault];
}

- (instancetype)initWithFrame:(CGRect)frame buttonStyle:(MCActivityButtonStyle)style {
    
    if (self = [super initWithFrame:frame]) {
        
        _style       = style;
        _buttonFrame = frame;
        _isAnimating = NO;
        
        [self addTarget:self action:@selector(buttonTouchDown)     forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(buttonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];

        [self createButton];
    }
    
    return self;
}

#pragma mark Setters

- (void)setButtonColor:(UIColor *)buttonColor {
    
    _buttonColor = buttonColor;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    
    _buttonTitle = buttonTitle;
}

- (void)setButtonActionTitle:(NSString *)buttonActionTitle {
    
    _buttonActionTitle = buttonActionTitle;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    _cornerRadius = cornerRadius;
}


- (void)buttonTouchDown {
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)buttonTouchUpInside {
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)setHighlighted:(BOOL)highlighted {
    
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        
        if (self.isAnimating == NO) {
        
            [self hideText];
            
            _isAnimating = YES;


//            CGRect buttonFrame = self.frame;
//            CGRect labelFrame  = self.titleLabel.bounds;
//            
//            float buttonWidth  = buttonFrame.size.width;
//            float buttonHeight = buttonFrame.size.height;
//            float activityHeight = (buttonHeight / 2);
//        
//            _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//            _activityIndicator.transform       = CGAffineTransformMakeScale(1, 1);
//            _activityIndicator.backgroundColor = [UIColor orangeColor];
//            _activityIndicator.frame = CGRectMake(labelFrame.origin.x - self.activityIndicator.frame.size.width, labelFrame.origin.y, activityHeight, activityHeight);
//
//
//            NSLog(@"buttonWidth: %f buttonHeight: %f labelFrame: %@", buttonWidth, buttonHeight, NSStringFromCGRect(labelFrame));
//
//            [UIView animateWithDuration:0.5 animations:^{
//                
//                [self setTitle:_buttonActionTitle forState:UIControlStateNormal];
//                
//
//                NSLog(@"activityWidth: %f", activityHeight);
//                
//                
//                [self addSubview:_activityIndicator];
//                [_activityIndicator startAnimating];
//
//                
//            } completion:^(BOOL finished) {
//                _isAnimating = YES;
//
//            }];
            
            
        }
        
    
    }
    else {
        
        
        
        
    }
    
}

- (void)hideText {
    
    [UIView beginAnimations:@"fadeOutText" context:NULL];
    [UIView setAnimationDuration:animationDuration];
        self.titleLabel.alpha = 0.0f;
    [UIView commitAnimations];
    [NSTimer scheduledTimerWithTimeInterval:animationDuration
                                     target:self
                                   selector:@selector(changeButtonTitle)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)changeButtonTitle {
    
    [self setTitle:self.buttonActionTitle forState:UIControlStateNormal];
    [self.titleLabel setTextAlignment:NSTextAlignmentRight];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect labelFrame  = self.titleLabel.frame;
    CGRect labelBounds = self.titleLabel.bounds;
    
    float expectedWidth = [self.currentTitle boundingRectWithSize:labelFrame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size.width;
    
    float labelHeight = labelFrame.size.height;
    
    NSLog(@"labelBounds: %@ labelFrame: %@ expectedWidth: %f" , NSStringFromCGRect(labelBounds), NSStringFromCGRect(labelFrame), expectedWidth);
    NSLog(@"activityIndicatorMargin: %f", self.activityIndicatorMargin);
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityIndicator.transform       = CGAffineTransformMakeScale(0.9, 0.9);
    _activityIndicator.color           = self.activityIndicatorColor;
    _activityIndicator.backgroundColor = [UIColor orangeColor];
    
    _activityIndicator.frame = CGRectMake(labelFrame.origin.x - self.activityIndicator.frame.size.width - self.activityIndicatorMargin, labelFrame.origin.y, labelHeight, labelHeight);
    
    self.activityIndicator.alpha = 0.0f;
    [self addSubview:_activityIndicator];
    [_activityIndicator startAnimating];
    
    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(showText) userInfo:nil repeats:NO];
    
}

- (void)showText {
    
    [UIView beginAnimations:@"fadeInText" context:NULL];
    [UIView setAnimationDuration:animationDuration];
        self.titleLabel.alpha = 1.0f;
        self.activityIndicator.alpha = 1.0f;
    [UIView commitAnimations];

    
}

- (void)createButton {
    
    self.backgroundColor = self.buttonColor;
    
}

//- (UIActivityIndicatorView *)activityIndicator {
//    
//    if (!_activityIndicator) {
//        _activityIndicator = [[UIActivityIndicatorView alloc] init];
//    }
//    
//    return _activityIndicator;
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
