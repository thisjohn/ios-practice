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

    [self tryBasicLayer];
    //[self tryTransform];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - Try

- (void) tryBasicLayer {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(50, 100, 200, 200);

    layer.backgroundColor = [UIColor redColor].CGColor;

    //UIImage *image = [UIImage imageNamed:@"Avatar"];
    //layer.contents = (id)image.CGImage;

    layer.borderColor = [UIColor blueColor].CGColor;
    layer.borderWidth = 5;  // included in width

    layer.cornerRadius = 15;

    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(30, 20);
    layer.shadowOpacity = 0.2;

    //layer.masksToBounds = YES;

    [self.containerView.layer addSublayer:layer];
}

- (void) tryTransform {
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
