//
//  ViewController.m
//  P1
//
//  Created by S.C. Lee on 2016/8/4.
//  Copyright © 2016年 S.C. Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self testBasicLayer];
    [self testImageViewShadowAndCorner1];
    [self testImageViewShadowAndCorner2];
    //[self testImageViewTransform];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - Test

- (void) testBasicLayer {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(85, 30, 150, 150);

    layer.borderColor = [UIColor blueColor].CGColor;
    layer.borderWidth = 2;  // included in width

    layer.cornerRadius = 10;

    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(10, 6);
    layer.shadowOpacity = 0.3;

    layer.backgroundColor = [UIColor redColor].CGColor;

    [self.containerView.layer addSublayer:layer];
}

- (void) testImageViewShadowAndCorner1 {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(85, 200, 150, 150);

    layer.borderColor = [UIColor blueColor].CGColor;
    layer.borderWidth = 2;  // included in width

    layer.cornerRadius = 10;

    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(10, 6);
    layer.shadowOpacity = 0.3;

    layer.backgroundColor = [UIColor redColor].CGColor;

    UIImage *image = [UIImage imageNamed:@"Avatar"];
    layer.contents = (id)image.CGImage;

    //layer.masksToBounds = YES;

    [self.containerView.layer addSublayer:layer];
}

- (void) testImageViewShadowAndCorner2 {
    // Create shadow view on the bottom
    UIView *shadowView = [[UIView alloc] init];
    shadowView.frame = CGRectMake(85, 370, 150, 150);

    shadowView.layer.cornerRadius = 10;

    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    shadowView.layer.shadowOffset = CGSizeMake(10, 6);
    shadowView.layer.shadowOpacity = 0.3;

    shadowView.backgroundColor = [UIColor redColor];

    // Create image view on the top
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Avatar"]];
    imageView.frame = shadowView.bounds;

    imageView.layer.cornerRadius = shadowView.layer.cornerRadius;

    imageView.layer.masksToBounds = YES; // clip the corner

    // Combine shadowView with imageView
    [shadowView addSubview:imageView];
    [self.containerView addSubview:shadowView];
}

- (void) testImageViewTransform {
    UIImageView *imageView;

    // 1. Scale
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Avatar"]];
    imageView.frame = CGRectMake(100, 60, 100, 100);

    imageView.layer.transform = CATransform3DMakeScale(2, 2, 0);
    [self.containerView addSubview:imageView];

    // 2. 3D Rotation
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Avatar"]];
    imageView.frame = CGRectMake(100, 220, 100, 100);

    imageView.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0);
    [self.containerView addSubview:imageView];

    // 3. Rotation
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Avatar"]];
    imageView.frame = CGRectMake(100, 330, 100, 100);

    [imageView.layer setValue:@(M_PI_4) forKeyPath:@"transform.rotation"];
    [self.containerView addSubview:imageView];
}

@end
