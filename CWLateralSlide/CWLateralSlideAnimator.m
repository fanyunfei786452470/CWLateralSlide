//
//  CWLateralSlideAnimator.m
//  ViewControllerTransition
//
//  Created by chavez on 2017/6/29.
//  Copyright © 2017年 chavez. All rights reserved.
//

#import "CWLateralSlideAnimator.h"
#import "CWDrawerTransition.h"

@interface CWLateralSlideAnimator ()

@property (nonatomic,strong) CWInteractiveTransition *interactiveHidden;
@property (nonatomic,strong) CWInteractiveTransition *interactiveShow;

@end

@implementation CWLateralSlideAnimator

#pragma mark - dealloc

- (void)dealloc {
    //    NSLog(@"%s",__func__);
}

#pragma mark - init

- (instancetype)initWithConfiguration:(CWLateralSlideConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = configuration;
    }
    return self;
}

+ (instancetype)lateralSlideAnimatorWithConfiguration:(CWLateralSlideConfiguration *)configuration {
    return [[self alloc] initWithConfiguration:configuration];
}

#pragma mark - setter

- (void)setConfiguration:(CWLateralSlideConfiguration *)configuration {
    _configuration = configuration;
    [self.interactiveShow setValue:configuration forKey:@"configuration"];
    [self.interactiveHidden setValue:configuration forKey:@"configuration"];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [CWDrawerTransition transitionWithType:CWDrawerTransitiontypeShow animationType:_animationType configuration:_configuration];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [CWDrawerTransition transitionWithType:CWDrawerTransitiontypeHidden animationType:_animationType configuration:_configuration];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveShow.interacting ? self.interactiveShow : nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveHidden.interacting ? self.interactiveHidden : nil;
}

@end
