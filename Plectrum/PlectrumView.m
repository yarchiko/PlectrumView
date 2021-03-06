//
//  PlectrumView.m
//  Plectrum
//
//  Created by Manuel Meyer on 12.10.12.
//  Copyright (c) 2012 bit.fritze. All rights reserved.
//

#import "PlectrumView.h"

@implementation PlectrumView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


-(void) drawPlectrumWithPercentage:(CGFloat) percentage color:(UIColor *)color
{
    static const CGFloat pi = 3.141592653589793;
    static const CGFloat radius100percentSquared = 2500.0;
    
    static CGFloat area100percent;
    static CGFloat threeFouthPi;
    static CGFloat threeFouthPiPlusOne;
    threeFouthPi = pi*(3.0/4.0);
    threeFouthPiPlusOne = 1 + threeFouthPi;

    area100percent= radius100percentSquared * threeFouthPi + radius100percentSquared;
    CGFloat area = area100percent * percentage;
    CGFloat newRadius = sqrt(area / threeFouthPiPlusOne);
    percentage = newRadius/ 50.0;
    CGFloat factor = self.frame.size.width ;
    percentage*=factor;
    UIBezierPath* plectrum = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, factor - percentage, percentage,percentage)
                                                   byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight
                                                         cornerRadii: CGSizeMake(percentage/2, percentage/2)];
    [color setFill];
    [plectrum fill];
}


- (void)drawRect:(CGRect)rect
{
    [self drawPlectrumWithPercentage:1.0 color: [UIColor colorWithWhite:.9 alpha:1]];
    [self drawPlectrumWithPercentage:.75 color:[UIColor colorWithRed:245.0/255.0 green:134.0/255.0 blue:122.0/255.0 alpha:1]];
    [self drawPlectrumWithPercentage:.61 color:[UIColor colorWithRed:171.0/255.0 green:212.0/255.0 blue:105.0/255.0 alpha:1]];
}

@end
