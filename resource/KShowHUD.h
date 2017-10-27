//
//  KShowHUD.h
//  KMBProgressHud
//
//  Created by tenghu on 2017/10/26.
//  Copyright © 2017年 tenghu. All rights reserved.
//     https://github.com/jdg/MBProgressHUD

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
@class KShowHUD;

// 定义block
typedef void (^ConfigShowHUDBlock)(KShowHUD *config);
typedef UIView *(^ConfigShowHUDCustomViewBlock)(void);
typedef void (^CompletBlock) (void);

// 定义枚举值
typedef enum {
    Fade    = MBProgressHUDAnimationFade,
    Zoom    = MBProgressHUDAnimationZoom,
    ZoomOut = MBProgressHUDAnimationZoomOut,
    ZoomIn  = MBProgressHUDAnimationZoomIn,
} HUDAnimationType;

typedef enum {
    /// UIActivityIndicatorView.
    Indeterminate    = MBProgressHUDModeIndeterminate,
    /// A round, pie-chart like, progress view. 圆形进度条
    Determinate    = MBProgressHUDModeDeterminate,
    /// Horizontal progress bar.  横着的进度条，需要传入一个progress
    HorizontalBar = MBProgressHUDModeDeterminateHorizontalBar,
    /// Ring-shaped progress view. 圆形进度条
    AnnularDeterminate  = MBProgressHUDModeAnnularDeterminate,
    /// Shows a custom view.
    CustomView  = MBProgressHUDModeCustomView,
    /// Shows only labels.
    Text  = MBProgressHUDModeText
    
} HUDProgressMode;

@interface KShowHUD : NSObject

@property (nonatomic,strong)CompletBlock completBlock;

// 样式
@property (nonatomic, assign) HUDProgressMode   modeStyle;  // 样式

// 动画效果
@property (nonatomic, assign) HUDAnimationType   animationStyle;  // 动画样式

// 文本加菊花
@property (nonatomic, strong) NSString          *text;            // 文本
@property (nonatomic, strong) UIFont            *textFont;        // 文本字体

// 自定义view
@property (nonatomic, strong) UIView            *customView;      // 自定义view  37x37尺寸

// 边缘留白
@property (nonatomic, assign) float              margin;          // 边缘留白

// 颜色设置(设置了颜色之后,透明度就会失效)
@property (nonatomic, strong) UIColor           *backgroundColor; // 背景颜色
@property (nonatomic, strong) UIColor           *labelColor;      // 文本颜色

// 圆角
@property (nonatomic, assign) float              cornerRadius;    // 圆角


+ (void)showText:(NSString *)text 
 configParameter:(ConfigShowHUDBlock)config
        duration:(NSTimeInterval)sec
          inView:(UIView *)view withComplete:(CompletBlock)completion;

+ (void)showText:(NSString *)text customView:(ConfigShowHUDCustomViewBlock)viewBlock
 configParameter:(ConfigShowHUDBlock)config
        duration:(NSTimeInterval)sec
          inView:(UIView *)view withComplete:(CompletBlock)completion;

- (void)hide;

@end
