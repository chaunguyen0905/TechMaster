//
//  RunningLED.m
//  TechMaster
//
//  Created by TaiND on 11/13/15.
//  Copyright (c) 2015 ChauNguyen. All rights reserved.
//

#import "RunningLED.h"

@interface RunningLED ()

@end

@implementation RunningLED
{
    CGFloat _margin;//>ball radius
    int _numberOfBall;
    CGFloat _space;//>ball diameter
    CGFloat _ballDiameter;
    NSTimer* _timer;
    int lastONLED;
    int x_lastONLED;
    int y_lastONLED;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGRect frame = self.view.frame;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    self.view.frame = frame;
    
    _ballDiameter = [self getDiameterOfBall:@"lightBall"];
    _margin = _ballDiameter;
    
    x_lastONLED = -1;
    y_lastONLED = -1;
    
    _numberOfBall = [self getMaxNumberOfBall];
    
    [self drawBall: _numberOfBall];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLed) userInfo:nil repeats:true];
}

- (void)runningLed
{
    if(lastONLED != -1){
        [self turnOFFLed:lastONLED];
    }
    
    if (lastONLED != _numberOfBall) {
        lastONLED++;
    }else{
        lastONLED = 0;
    }
    [self turnONLed:lastONLED];
}

- (void)turnONLed:(int)index
{
    UIView* view = [self.view viewWithTag:index+100];
    if(view && [view isMemberOfClass:[UIImageView class]]){
        UIImageView* ball = (UIImageView*)view;
        ball.image = [UIImage imageNamed:@"lightBall"];
    }
}

- (void)turnOFFLed:(int)index
{
    UIView* view = [self.view viewWithTag:index+100];
    if(view && [view isMemberOfClass:[UIImageView class]]){
        UIImageView* ball = (UIImageView*)view;
        ball.image = [UIImage imageNamed:@"darkBall"];
    }
}

- (void)placeLightBallAtX: (CGFloat) x
                     andY: (CGFloat) y
                  withTag: (int) tag
{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"darkBall"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [self.view addSubview: ball];
}

- (CGFloat)getSpaceWhenNumberOfBallIsKnown: (int) n
{
    NSLog(@"%f",self.view.bounds.size.width);
    return (self.view.bounds.size.width - 2*_margin)/(n-1);
}

- (void) drawBall:(int)numberBall
{
    CGFloat space = [self getSpaceWhenNumberOfBallIsKnown:numberBall];
    for (int i = 0; i < numberBall; i++) {
        [self placeLightBallAtX:_margin + i*space
                           andY:140
                        withTag:i+100];
    }
}

- (int) getMaxNumberOfBall
{
    bool stop = false;
    int n = 3;
    while (!stop) {
        CGFloat space = [self getSpaceWhenNumberOfBallIsKnown: n];
        if(space <= 2*_ballDiameter)
            stop = true;
        else
            NSLog(@"ball: %d, space: %3.0f",n,space);
        n++;
    }
    return n-1;
}

- (CGFloat) getDiameterOfBall:(NSString *)nameOfBall
{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:nameOfBall]];
    return ball.bounds.size.width;
}

@end