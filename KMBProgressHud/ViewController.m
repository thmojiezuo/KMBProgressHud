//
//  ViewController.m
//  KMBProgressHud
//
//  Created by tenghu on 2017/10/26.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"1" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.backgroundColor = [UIColor yellowColor];
    button.frame = CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width-200, 50);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
}

- (void)buttonClick:(UIButton *)button{
    NSString *str = button.titleLabel.text;
    switch ([str integerValue]) {
        case 1:
            [self hud_showMessage:@"消息"];
            [button setTitle:@"2" forState:UIControlStateNormal];
            break;
        case 2:
            [self hud_showMessage:@"消息-完成" withComplete:^{
                NSLog(@"消息-完成事件");
            }];
            [button setTitle:@"3" forState:UIControlStateNormal];
            break;
        case 3:
            [self hud_showSucceedMessage:@"成功"];
            [button setTitle:@"4" forState:UIControlStateNormal];
            break;
        case 4:
            [self hud_showSucceedMessage:@"成功-完成" withComplete:^{
                NSLog(@"成功-完成事件");
            }];
            [button setTitle:@"5" forState:UIControlStateNormal];
            break;
        case 5:
            [self hud_showSucceedMessage:@"失败"];
            [button setTitle:@"6" forState:UIControlStateNormal];
            break;
        case 6:
            [self hud_showSucceedMessage:@"失败-完成" withComplete:^{
                NSLog(@"失败-完成事件");
            }];
            [button setTitle:@"7" forState:UIControlStateNormal];
            break;
        case 7:
            [self hud_showProgressMessage:@"菊花"];
            [button setTitle:@"8" forState:UIControlStateNormal];
            break;
        case 8:
            [self hud_showProgressMessage:@"菊花-完成" withComplete:^{
                NSLog(@"菊花-完成事件");
            }];
            [button setTitle:@"1" forState:UIControlStateNormal];
            break;
            
            
        default:
            break;
    }
}


#pragma mark - HUD

- (void)hud_showProgressMessage:(NSString *)msg {
    
    [KShowHUD showText:msg configParameter:^(KShowHUD *config) {
        config.modeStyle = Indeterminate;
        config.textFont = [UIFont systemFontOfSize:14];
        config.labelColor = [UIColor blueColor];
        config.backgroundColor = [UIColor redColor];
        config.margin = 10.f;
        config.animationStyle = ZoomIn;
    } duration:3 inView:self.view withComplete:nil];
   
}
- (void)hud_showProgressMessage:(NSString *)msg withComplete:(void (^)(void))completion{
  
    [KShowHUD showText:msg configParameter:^(KShowHUD *config) {
        config.modeStyle = Indeterminate;
        config.textFont = [UIFont systemFontOfSize:14];
        config.labelColor = [UIColor blueColor];
        config.backgroundColor = [UIColor redColor];
        config.margin = 10.f;
        config.animationStyle = ZoomIn;
    } duration:3 inView:self.view withComplete:completion];
}

- (void)hud_showMessage:(NSString *)msg{
    
    [KShowHUD showText:msg configParameter:^(KShowHUD *config) {
        config.modeStyle = Text;
        config.textFont = [UIFont systemFontOfSize:14];
        config.labelColor = [UIColor blueColor];
        config.backgroundColor = [UIColor redColor];
        config.margin = 10.f;
        config.animationStyle = ZoomIn;
    } duration:1.5 inView:self.view withComplete:nil];
   
}
- (void)hud_showMessage:(NSString *)msg withComplete:(void (^)(void))completion{
    
    [KShowHUD showText:msg configParameter:^(KShowHUD *config) {
        config.modeStyle = Text;
        config.textFont = [UIFont systemFontOfSize:14];
        config.labelColor = [UIColor blueColor];
        config.backgroundColor = [UIColor redColor];
        config.margin = 10.f;
        config.animationStyle = ZoomOut;
    } duration:1.5 inView:self.view withComplete:completion];
    
}


- (void)hud_showSucceedMessage:(NSString *)msg {
    
    [KShowHUD showText:msg customView:^UIView *{
        
        UIImageView *customImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Succeed"]];
        customImage.frame = CGRectMake(0, 0, 37, 37);
        return customImage;
    } configParameter:^(KShowHUD *config) {
        config.modeStyle = CustomView;
        config.animationStyle = Zoom;
        config.textFont = [UIFont systemFontOfSize:14];
        config.labelColor = [UIColor blueColor];
    } duration:1.5 inView:self.view withComplete:nil];
    
}
- (void)hud_showSucceedMessage:(NSString *)msg withComplete:(void (^)(void))completion {
    
    [KShowHUD showText:msg customView:^UIView *{
        
        UIImageView *customImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Succeed"]];
        customImage.frame = CGRectMake(0, 0, 37, 37);
        return customImage;
    } configParameter:^(KShowHUD *config) {
        config.modeStyle = CustomView;
        config.animationStyle = Zoom;
        config.textFont = [UIFont systemFontOfSize:14];
        config.labelColor = [UIColor blueColor];
    } duration:1.5 inView:self.view withComplete:completion];
   
}


- (void)hud_showErrorMessage:(NSString *)msg {
    [KShowHUD showText:msg customView:^UIView *{
        
        UIImageView *customImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Error"]];
        customImage.frame = CGRectMake(0, 0, 37, 37);
        return customImage;
    } configParameter:^(KShowHUD *config) {
        config.modeStyle = CustomView;
        config.animationStyle = Zoom;
        config.textFont = [UIFont systemFontOfSize:14];
        config.labelColor = [UIColor blueColor];
    } duration:1.5 inView:self.view withComplete:nil];
   
}
- (void)hud_showErrorMessage:(NSString *)msg withComplete:(void (^)(void))completion {
    [KShowHUD showText:msg customView:^UIView *{
        
        UIImageView *customImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Error"]];
        customImage.frame = CGRectMake(0, 0, 37, 37);
        return customImage;
    } configParameter:^(KShowHUD *config) {
        config.modeStyle = CustomView;
        config.animationStyle = Zoom;
        config.textFont = [UIFont systemFontOfSize:14];
        config.labelColor = [UIColor blueColor];
    } duration:1.5 inView:self.view withComplete:completion];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
