//
//  HJTextView.h
//  HJTextView
//
//  Created by WHJ on 16/6/2.
//  Copyright © 2016年 WHJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, HJTextViewType) {
    HJTextView_normal = 0,//正常的textView
    HJTextView_placeHolderAndCount,//显示placeHolder和字符数
    HJTextView_onlyPlaceHolder//只显示placeHolder
    
};

@interface HJTextView : UITextView

@property (nonatomic, copy) NSString * placeholder;

@property (nonatomic, strong) UIColor * placeholderColor;

@property (nonatomic, strong) UIColor * countColor;

@property (nonatomic, assign) NSInteger maxCharacters;

@property (nonatomic, assign) HJTextViewType textViewType;

@end
