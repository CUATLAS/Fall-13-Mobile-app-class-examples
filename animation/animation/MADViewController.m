//
//  MADViewController.m
//  animation
//
//  Created by Aileen Pierce on 11/12/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController {
    CGPoint delta; //specifies how many points the image must move every time the timer fires
    NSTimer *timer; //the animation timer
    float ballRadius; //radius of the ball
    CGPoint translation; //specifies how many pixels the image will move
    float angle; //angle for rotation
}

-(IBAction)changeSliderValue
{
	_sliderLabel.text=[NSString stringWithFormat:@"%.2f", _slider.value];
	//creates a new timer object with the slider's time interval
	timer = [NSTimer scheduledTimerWithTimeInterval:_slider.value //number of seconds between firings of the timer
                                             target:self
                                           selector:@selector(onTimer) //the message sent when the timer fires
                                           userInfo:nil
                                            repeats:YES]; //whether or not the timer repeatedly reschedules itself.
    //YES will repeatedly reschedule the timer until invalidated
}

- (void)viewDidLoad
{
    //ball radius is half the width of the image
    ballRadius=_imageView.frame.size.width/2;
	//initialize the delta. tells it to move 12 pixels horizontally, 4 pixels vertically
    delta=CGPointMake(12.0, 4.0);
	[self changeSliderValue];
    translation=CGPointMake(0.0, 0.0);
    angle=0; //sets angle to 0
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//changes the position of the image view
-(void) onTimer {
    [UIView beginAnimations:@"my_own_animation" context:nil];
    [UIView animateWithDuration:_slider.value //animate for the duration of the slider value (time interval)
                          delay:0 //have the animation start right away
                        options:UIViewAnimationOptionCurveEaseOut //set the animation curve type
     //changes the position by setting a new center of the image view
                     	animations:^{_imageView.transform = CGAffineTransformMakeScale(angle,angle);
                        _imageView.center = CGPointMake(_imageView.center.x + delta.x, _imageView.center.y + delta.y);}
					 completion:NULL];
                         //sets transform to CGAffineTransform
    [UIView commitAnimations];
    
    angle += 0.02; //amount by which you increment the angle
    //if it's a full rotation reset the angle
    if (angle>2*M_PI)
        angle=0;
    
	//if the image touched the sides of the screen it reverses the direction
    if (_imageView.center.x > self.view.bounds.size.width - ballRadius || _imageView.center.x < ballRadius)
    delta.x = -delta.x;
	//if the image touched the top or bottom of the screen it reverses the direction
    if (_imageView.center.y > self.view.bounds.size.height - ballRadius || _imageView.center.y < ballRadius)
    delta.y = -delta.y;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider *)sender {
    [timer invalidate];	//stops the timer
	//must invalidate and create a new object to change its firing interval
	[self changeSliderValue];
}
@end
