//
//  ViewController.h
//  KMBProgressHud
//
//  Created by tenghu on 2017/10/26.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KShowHUD.h"

@interface ViewController : UIViewController

- (void)hud_showProgressMessage:(NSString *)msg;
- (void)hud_showProgressMessage:(NSString *)msg withComplete:(void (^)(void))completion;

- (void)hud_showMessage:(NSString *)msg;
- (void)hud_showMessage:(NSString *)msg withComplete:(void (^)(void))completion;

- (void)hud_showSucceedMessage:(NSString *)msg;
- (void)hud_showSucceedMessage:(NSString *)msg withComplete:(void (^)(void))completion;

- (void)hud_showErrorMessage:(NSString *)msg;
- (void)hud_showErrorMessage:(NSString *)msg withComplete:(void (^)(void))completion;


@end

