//
//  ViewController.m
//  FrameAttributes
//
//  Created by Stephen Cao on 3/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "ViewController.h"
typedef CGPoint (^imageTranslateBlock)(CGPoint point);
typedef CGRect (^imageScaleBlock)(CGRect rect);
@interface ViewController ()
-(IBAction)up;
-(IBAction)down;
-(IBAction)right;
-(IBAction)left;
-(IBAction)plus;
-(IBAction)minus;
-(void)translateImage:(imageTranslateBlock) block;
-(void)scaleImage:(imageScaleBlock) block;
@property(nonatomic,weak)IBOutlet UIButton * mImageButton;
@end

@implementation ViewController
-(void)scaleImage:(imageScaleBlock) block{
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
    [UIView animateWithDuration:1.0 animations:^{
        CGRect tempRect = self.mImageButton.bounds;
        self.mImageButton.bounds = block(tempRect);;
    }];
//    [UIView commitAnimations];
}
-(void)translateImage:(imageTranslateBlock) block{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    CGPoint tempPoint = self.mImageButton.center;
    self.mImageButton.center = block(tempPoint);;
    [UIView commitAnimations];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)up{
//    NSLog(@"up");
    [self translateImage:^CGPoint(CGPoint point) {
        point.y -= 10;
        return point;
    }];
}
-(IBAction)down{
//    NSLog(@"down");
    [self translateImage:^CGPoint(CGPoint point) {
        point.y += 10;
        return point;
    }];
}
-(IBAction)right{
//    NSLog(@"right");
    [self translateImage:^CGPoint(CGPoint point) {
        point.x += 10;
        return point;
    }];
}
-(IBAction)left{
//    NSLog(@"left");
    [self translateImage:^CGPoint(CGPoint point) {
        point.x -= 10;
        return point;
    }];
}
-(IBAction)plus{
//    NSLog(@"plus");
    [self scaleImage:^CGRect(CGRect rect) {
        rect.size.height += 10;
        rect.size.width += 10;
        return rect;
    }];
}
-(IBAction)minus{
//    NSLog(@"minus");
    [self scaleImage:^CGRect(CGRect rect) {
        rect.size.height -= 10;
        rect.size.width -= 10;
        return rect;
    }];
    
}


@end
