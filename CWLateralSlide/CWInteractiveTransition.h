//
//  CWInteractiveTransition.h
//  ViewControllerTransition
//
//  Created by chavez on 2017/6/28.
//  Copyright © 2017年 chavez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWDrawerTransition.h"

@protocol CWInteractiveTransitionDelegate <NSObject>

@optional

/**
 InteractiveTransition 完成时的回调
 */
- (void)cw_finishInteractiveTransition;

@end

@interface CWInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

@property (nonatomic, weak) CWLateralSlideConfiguration *configuration;

@property (nonatomic, weak) id <CWInteractiveTransitionDelegate>delegate;

- (instancetype)initWithTransitiontype:(CWDrawerTransitiontype)type;

+ (instancetype)interactiveWithTransitiontype:(CWDrawerTransitiontype)type;

- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end



