//
//  KShowHUD.m
//  KMBProgressHud
//
//  Created by tenghu on 2017/10/26.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import "KShowHUD.h"

#ifdef DEBUG
#define ShowHUD_DLog(fmt, ...) NSLog((@"ShowHUD.m:%s:%d" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define ShowHUD_DLog(...)
#endif

@interface KShowHUD ()<MBProgressHUDDelegate>

{
    MBProgressHUD   *_hud;
}

@end

@implementation KShowHUD

- (instancetype)initWithView:(UIView *)view
{
    if (view == nil) {
        return nil;
    }
    
    self = [super init];
    if (self) {
      //  _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        _hud = [[MBProgressHUD alloc] initWithView:view];
        _hud.delegate                  = self;                       // 设置代理
        _hud.animationType             = MBProgressHUDAnimationZoom; // 默认动画样式
        _hud.removeFromSuperViewOnHide = YES;                        // 该视图隐藏后则自动从父视图移除掉
        
        [view addSubview:_hud];
    }
    return self;
}

- (void)hide:(BOOL)hide afterDelay:(NSTimeInterval)delay
{
    [_hud hideAnimated:hide afterDelay:delay];
}

- (void)hide
{
    [_hud hideAnimated:YES];
}

- (void)show:(BOOL)show
{
    // 根据属性判断是否要显示文本
    if (_text != nil && _text.length != 0) {
        _hud.label.text = _text;
    }
    
    // 设置文本字体
    if (_textFont) {
        _hud.label.font = _textFont;
    }
        
    // 设置背景色
    if (_backgroundColor) {
        _hud.bezelView.color = _backgroundColor;
    }
    
    // 文本颜色
    if (_labelColor) {
        _hud.label.textColor = _labelColor;
    }
    
    // 设置圆角
    if (_cornerRadius) {
        _hud.bezelView.layer.cornerRadius = _cornerRadius;
    }
    if (self.completBlock) {
        _hud.completionBlock = self.completBlock;
    }
    
    // 自定义view
    if (_customView) {
        _hud.customView = _customView;
    }
    
    // 边缘留白
    if (_margin > 0) {
        _hud.margin = _margin;
    }
    
    [_hud showAnimated:YES];
}

#pragma mark - HUD代理方法
- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [_hud removeFromSuperview];
    _hud = nil;
}

#pragma mark - 重写setter方法
@synthesize animationStyle = _animationStyle;
- (void)setAnimationStyle:(HUDAnimationType)animationStyle
{
    _animationStyle    = animationStyle;
    _hud.animationType = (MBProgressHUDAnimation)_animationStyle;
}
- (HUDAnimationType)animationStyle
{
    return _animationStyle;
}
@synthesize modeStyle = _modeStyle;
- (void)setModeStyle:(HUDProgressMode)modeStyle
{
    _modeStyle    = modeStyle;
    _hud.mode = (MBProgressHUDMode)_modeStyle;
}
- (HUDProgressMode)modeStyle
{
    return _modeStyle;
}
#pragma mark - 便利的方法


+ (void)showText:(NSString *)text
 configParameter:(ConfigShowHUDBlock)config
        duration:(NSTimeInterval)sec
          inView:(UIView *)view withComplete:(CompletBlock)completion
{
    KShowHUD *hud     = [[KShowHUD alloc] initWithView:view];
    hud.text         = text;
    
    // 配置额外的参数
    config(hud);
    
    hud.completBlock = completion;
    // 显示
    [hud show:YES];
    
    // 延迟sec后消失
    [hud hide:YES afterDelay:sec];
}

+ (void)showText:(NSString *)text customView:(ConfigShowHUDCustomViewBlock)viewBlock
 configParameter:(ConfigShowHUDBlock)config
        duration:(NSTimeInterval)sec
          inView:(UIView *)view withComplete:(CompletBlock)completion
{
    KShowHUD *hud     = [[KShowHUD alloc] initWithView:view];
    hud.text         = text;
    
    // 自定义View
    hud.customView   = viewBlock();
    
    // 配置额外的参数
    config(hud);
    
    hud.completBlock = completion;
    // 显示
    [hud show:YES];
    
    // 延迟sec后消失
    [hud hide:YES afterDelay:sec];
}

- (void)dealloc
{
    ShowHUD_DLog(@"资源释放了,没有泄露^_^");
}


@end
