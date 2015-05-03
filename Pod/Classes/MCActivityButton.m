//
//  MCActivityButton.m
//  Pods
//
//  Created by Marcos Curvello on 4/24/15.
//
//

#define animationDuration 0.3

#import "MCActivityButton.h"

@implementation MCActivityButton

@synthesize activityIndicator = _activityIndicator;
@synthesize isAnimating       = _isAnimating;

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
            
            CGRect buttonFrame = self.frame;
            CGRect labelFrame  = self.titleLabel.frame;
        
            float buttonWidth  = buttonFrame.size.width;
            float buttonHeight = buttonFrame.size.height;
        
            float activityHeight = (buttonHeight / 2);
        
            _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            _activityIndicator.transform = CGAffineTransformMakeScale(1, 1);
            _activityIndicator.backgroundColor = [UIColor orangeColor];
            
            _activityIndicator.frame = CGRectMake(labelFrame.origin.x - self.activityIndicator.frame.size.width, labelFrame.origin.y, activityHeight, activityHeight);

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
            
            _isAnimating = YES;
            
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
                                   selector:@selector(changeLabelText)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)changeLabelText {
    
    [self setTitle:self.buttonActionTitle forState:UIControlStateNormal];

    CGRect labelFrame    = self.titleLabel.frame;
    float activityHeight = labelFrame.size.height;
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityIndicator.transform = CGAffineTransformMakeScale(1, 1);
    _activityIndicator.backgroundColor = [UIColor orangeColor];
    
    _activityIndicator.frame = CGRectMake(labelFrame.origin.x - activityHeight * 2, labelFrame.origin.y, activityHeight, activityHeight);
    
    self.activityIndicator.alpha = 0.0f;
    [self addSubview:_activityIndicator];
    [_activityIndicator startAnimating];
    
    [NSTimer scheduledTimerWithTimeInterval:0
                                     target:self
                                   selector:@selector(showText)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)showText {
    
    [UIView beginAnimations:@"fadeInText" context:NULL];
    [UIView setAnimationDuration:animationDuration];
        self.titleLabel.alpha = 1.0f;
        self.activityIndicator.alpha = 1.0f;
    
    [UIView commitAnimations];
//    [self animateActivityIndicator];

    
}

//- (void)animateActivityIndicator {
//    
//    CGRect buttonFrame = self.frame;
//    CGRect labelFrame  = self.titleLabel.frame;
//    
////    float buttonWidth    = buttonFrame.size.width;
////    float buttonHeight   = buttonFrame.size.height;
//    
//    float activityHeight = labelFrame.size.height;
//    
//    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//    _activityIndicator.transform = CGAffineTransformMakeScale(1, 1);
//    _activityIndicator.backgroundColor = [UIColor orangeColor];
//    
//    _activityIndicator.frame = CGRectMake(labelFrame.origin.x - self.activityIndicator.frame.size.width - 40 , labelFrame.origin.y, activityHeight, activityHeight);
//    
//    [self addSubview:_activityIndicator];
//    [_activityIndicator startAnimating];
//    
//}

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
