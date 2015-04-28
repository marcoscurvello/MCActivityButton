//
//  MCActivityButton.m
//  Pods
//
//  Created by Marcos Curvello on 4/24/15.
//
//

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
        
        [self addTarget:self action:@selector(buttonTouchDown) forControlEvents:UIControlEventTouchDown];
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
            
            [self setTitle:_buttonActionTitle forState:UIControlStateNormal];
            
            CGRect buttonFrame = self.frame;
            CGRect labelFrame  = self.titleLabel.frame;
            
            float buttonWidth  = buttonFrame.size.width;
            float buttonHeight = buttonFrame.size.height;
            
            NSLog(@"buttonWidth: %f buttonHeight: %f buttonFrame: %@", buttonWidth, buttonHeight, NSStringFromCGRect(labelFrame));
            
            float activityHeight = (buttonHeight / 2);
            
            
            _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            _activityIndicator.transform = CGAffineTransformMakeScale(1, 1);
            _activityIndicator.backgroundColor = [UIColor orangeColor];
            
            _activityIndicator.frame = CGRectMake(labelFrame.origin.x - 2 * activityHeight - 10, labelFrame.origin.y, activityHeight, activityHeight);
            
            NSLog(@"activityWidth: %f", activityHeight);
            
            
            [self addSubview:_activityIndicator];
            [_activityIndicator startAnimating];
            _isAnimating = YES;
            

        }
        
    
    }
    else {
        
        
        
        
    }
    
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
