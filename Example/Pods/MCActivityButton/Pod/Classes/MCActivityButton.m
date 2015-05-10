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

@synthesize isAnimating             = _isAnimating;
@synthesize initialFrame            = _initialFrame;
@synthesize activityFrame           = _activityFrame;
@synthesize initialTitle            = _initialTitle;
@synthesize activityTitle           = _activityTitle;
@synthesize buttonClickLock         = _buttonClickLock;
@synthesize activityIndicator       = _activityIndicator;
@synthesize activityIndicatorScale  = _activityIndicatorScale;
@synthesize activityIndicatorMargin = _activityIndicatorMargin;
@synthesize buttonAnimationDuration = _buttonAnimationDuration;


#pragma mark - Initializer

- (instancetype)initWithFrame:(CGRect)frame {
    
    return [self initWithFrame:frame buttonStyle:MCActivityButtonStyleDefault];
}

- (instancetype)initWithFrame:(CGRect)frame buttonStyle:(MCActivityButtonStyle)style {
    
    if (self = [super initWithFrame:frame]) {

        _style        = style;
        _isAnimating  = NO;
        _initialFrame = frame;
        _activityFrame = CGRectMake(self.initialFrame.origin.x, self.initialFrame.origin.y, self.initialFrame.size.width + 60, self.initialFrame.size.height);

    }
    
    return self;
}

#pragma mark - Setters

- (void)setInitialTitle:(NSString *)initialTitle {
    
    _initialTitle = initialTitle;
    [self setTitle:self.initialTitle forState:UIControlStateNormal];
}

- (void)setActivityTitle:(NSString *)activityTitle {
    
    _activityTitle = activityTitle;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    
    [super setTitle:title forState:state];
    
}

- (void)setHighlighted:(BOOL)highlighted {
    
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        if (!self.isAnimating) {

            [self startAnimating];
        }
        else {
            if (!self.buttonClickLock) {
                [self stopAnimating];
            }
            
        }
    }
    
}

- (void)startAnimating {
    
    [UIView beginAnimations:@"fadeOutText" context:NULL];
    [UIView setAnimationDuration:self.buttonAnimationDuration];
    self.titleLabel.alpha = 0.0f;
    self.activityIndicator.alpha = 0.0f;
    [UIView commitAnimations];
    [NSTimer scheduledTimerWithTimeInterval:self.buttonAnimationDuration
                                     target:self
                                   selector:@selector(animateButton)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)stopAnimating {
    
    [self startAnimating];
}

- (void)animateButton {

    if (!self.isAnimating) {
        
        [self setTitle:self.activityTitle forState:UIControlStateNormal];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 20.0f, 0.0f, 0.0f)];
    }
    else {
        [self setTitle:self.initialTitle forState:UIControlStateNormal];
        [self setTitleEdgeInsets:UIEdgeInsetsZero];
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    if (!_activityIndicator) {
        
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _activityIndicator.frame = CGRectMake(self.titleLabel.frame.origin.x - self.activityIndicatorMargin, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.height, self.titleLabel.frame.size.height);
        _activityIndicator.hidesWhenStopped = YES;
        _activityIndicator.transform        = CGAffineTransformMakeScale(self.activityIndicatorScale, self.activityIndicatorScale);
        _activityIndicator.color            = self.activityIndicatorColor;

        [self addSubview:_activityIndicator];
        
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(showText) userInfo:nil repeats:NO];
}

- (void)showText {
    
    [UIView beginAnimations:@"transformButton" context:NULL];
    [UIView setAnimationDuration:self.buttonAnimationDuration];

    if (!self.isAnimating) {
        
        self.isAnimating = YES;
        self.frame = self.activityFrame;
        self.titleLabel.alpha = 1.0f;
        self.activityIndicator.alpha = 1.0f;
        [self.activityIndicator startAnimating];
    }
    else {
        
        self.isAnimating = NO;
        self.frame = self.initialFrame;
        self.titleLabel.alpha = 1.0f;
        self.activityIndicator.alpha = 0.0f;
        [self.activityIndicator stopAnimating];
    }

    [UIView commitAnimations];
}

@end
