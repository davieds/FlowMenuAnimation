//
//  StartBtn.m
//  FlowMenuAnimation
//
//  Created by Bear on 16/7/3.
//  Copyright © 2016年 Bear. All rights reserved.
//

#import "StartBtn.h"
#import "ArrowAnimationView.h"



@interface StartBtn ()
{
    CAShapeLayer    *_bgShapeLayer;
    UIBezierPath    *_bgBezierPath;
    ArrowAnimationView  *_arrowAnimationView;
}

@end

@implementation StartBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = redDark;
        
        _bgBezierPath = [UIBezierPath bezierPath];
        [_bgBezierPath moveToPoint:CGPointMake(0, 0)];
        [_bgBezierPath addArcWithCenter:CGPointMake(self.width, 0) radius:self.width startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
        [_bgBezierPath addLineToPoint:CGPointMake(self.width, 0)];
        [_bgBezierPath closePath];
        
        _bgShapeLayer = [CAShapeLayer layer];
        _bgShapeLayer.fillColor = redDark.CGColor;
        _bgShapeLayer.path = _bgBezierPath.CGPath;
        self.layer.mask = _bgShapeLayer;
        
        CGFloat _arrow_width = 30;
        CGFloat _arrow_height = 15;
        _arrowAnimationView = [[ArrowAnimationView alloc] initWithFrame:CGRectMake(self.width - _arrow_width - 15, 20, _arrow_width, _arrow_height)];
        _arrowAnimationView.backgroundColor = [UIColor blueColor];
        [self addSubview:_arrowAnimationView];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected
{
    _arrowAnimationView.open = !selected;
}

@end
