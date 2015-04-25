//
//  MCActivityButton.m
//  Pods
//
//  Created by Marcos Curvello on 4/24/15.
//
//

#import "MCActivityButton.h"

@implementation MCActivityButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    return [self initWithFrame:frame buttonStyle:MCActivityButtonStyleDefault];
}

- (instancetype)initWithFrame:(CGRect)frame buttonStyle:(MCActivityButtonStyle)style {
    
    if (self = [super initWithFrame:frame]) {
        
        _style       = style;
        _buttonFrame = frame;
        
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


- (void)setHighlighted:(BOOL)highlighted {
    
    if (highlighted) {
    
        CGRect buttonFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        
        float buttonWidth  = buttonFrame.size.width;
        float buttonHeight = buttonFrame.size.height;
        
        NSLog(@"buttonWidth: %f buttonHeight: %f buttonFrame: %@", buttonWidth, buttonHeight, NSStringFromCGRect(buttonFrame));
        
        float activityWidth = fmodf(buttonWidth, 2);
        
        
        
        
//        CGRect activityFrame = CGRectMake(buttonSize.origin.x, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        
        
        double buttomWidth  = self.frame.size.width;
        double buttomHeight = self.frame.size.height;
        
        
        

        
        CGRect activityFrame = CGRectMake(self.buttonFrame.origin.x, self.buttonFrame.origin.y, 20, 20);
        
        _activityIndicator = [[UIActivityIndicatorView alloc] init];
        
    }
    
    else {
        
        
        
        
    }
    
}


- (void)createButton {
    
    self.backgroundColor = self.buttonColor;
    
    
    
}


- (UIActivityIndicatorView *)activityIndicator {
    
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc] init];
    }
    
    return _activityIndicator;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
