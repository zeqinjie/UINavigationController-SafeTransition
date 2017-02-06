//
//  UINavigationController+SafeTransition.m
//  house591
//
//  Created by zhengzeqin on 2017/2/3.
//
//

#import "UINavigationController+SafeTransition.h"

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UINavigationController () <UINavigationControllerDelegate>

@property (nonatomic, assign) BOOL viewTransitionInProgress;

@end

@implementation UINavigationController (SafeTransition)
/*
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [HouseTool swizzlingInClass:[self class] originalSelector:@selector(pushViewController:animated:) swizzledSelector:@selector(safePushViewController:animated:)];
        [HouseTool swizzlingInClass:[self class] originalSelector:@selector(popViewControllerAnimated:) swizzledSelector:@selector(safePopViewControllerAnimated:)];
        [HouseTool swizzlingInClass:[self class] originalSelector:@selector(popToRootViewControllerAnimated:) swizzledSelector:@selector(safePopToRootViewControllerAnimated:)];
        [HouseTool swizzlingInClass:[self class] originalSelector:@selector(popToViewController:animated:) swizzledSelector:@selector(safePopToViewController:animated:)];
    });
}

#pragma mark - setter & getter
- (void)setViewTransitionInProgress:(BOOL)property {
    
    NSNumber *number = [NSNumber numberWithBool:property];
    
    objc_setAssociatedObject(self, @selector(viewTransitionInProgress), number, OBJC_ASSOCIATION_RETAIN);
    
}

- (BOOL)viewTransitionInProgress {
    
    NSNumber *number = objc_getAssociatedObject(self, @selector(viewTransitionInProgress));
    
    return [number boolValue];
}

#pragma mark - Intercept Pop, Push, PopToRootVC
- (NSArray *)safePopToRootViewControllerAnimated:(BOOL)animated {
    
    if (self.viewTransitionInProgress) return nil;
    
    if (animated) {
        
        self.viewTransitionInProgress = YES;
    }
    
    NSArray *viewControllers = [self safePopToRootViewControllerAnimated:animated];
    
    if (viewControllers.count == 0) {
        
        self.viewTransitionInProgress = NO;
    }
    
    return viewControllers;
}

- (NSArray *)safePopToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewTransitionInProgress) return nil;
    
    if (animated){
        
        self.viewTransitionInProgress = YES;
    }
    
    NSArray *viewControllers = [self safePopToViewController:viewController animated:animated];
    
    if (viewControllers.count == 0) {
        
        self.viewTransitionInProgress = NO;
    }
    
    return viewControllers;
}

- (UIViewController *)safePopViewControllerAnimated:(BOOL)animated {
    
    if (self.viewTransitionInProgress) return nil;
    
    if (animated) {
        
        self.viewTransitionInProgress = YES;
    }
    
    UIViewController *viewController = [self safePopViewControllerAnimated:animated];
    
    if (viewController == nil) {
        
        self.viewTransitionInProgress = NO;
    }
    
    return viewController;
}

- (void)safePushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewTransitionInProgress == NO) {
        
        [self safePushViewController:viewController animated:animated];
        
        if (animated) {
            
            self.viewTransitionInProgress = YES;
        }
    }
}

@end

@implementation UIViewController (SafeTransitionLock)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [HouseTool swizzlingInClass:[self class] originalSelector:@selector(viewDidAppear:) swizzledSelector:@selector(safeViewDidAppear:)];
    });
}

- (void)safeViewDidAppear:(BOOL)animated {
    
    self.navigationController.viewTransitionInProgress = NO;
    
    [self safeViewDidAppear:animated];
}
*/
@end

