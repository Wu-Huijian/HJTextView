//
//  HJTextView.m
//  HJTextView
//
//  Created by WHJ on 16/6/2.
//  Copyright © 2016年 WHJ. All rights reserved.
//

#import "HJTextView.h"


@interface HJTextView ()

@property(nonatomic ,strong)UILabel *placeholderLabel;

@property(nonatomic ,strong)UILabel *maxCharactersLabel;

@end

static const CGFloat padding = 8.f;
static const CGFloat countLabelWidth = 60.f;

@implementation HJTextView


- (instancetype)initWithFrame:(CGRect)frame;{
    self = [super initWithFrame:frame];
    if(self){
        
        [self setupUI];
        
        [self defaultConfig];
    }
    return self;
}



- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}


- (void)defaultConfig{
    
    self.placeholderColor = [UIColor grayColor];
    self.font = [UIFont systemFontOfSize:14.f];
    self.placeholderColor = [UIColor lightGrayColor];
    self.countColor = [UIColor blackColor];
    self.maxCharacters = 300;
    UIEdgeInsets insets = self.contentInset;
    self.contentInset = UIEdgeInsetsMake(insets.top, insets.left, padding + self.font.pointSize, insets.right);
}



#pragma mark - pravite methods


- (void)didBeginEditing:(NSNotification *)notification{


}

- (void)textChanged:(NSNotification *)notification{
    
    self.placeholderLabel.alpha = self.text.length==0?1:0;
    
    if(self.text.length>self.maxCharacters){
        self.text = [self.text substringWithRange:NSMakeRange(0, self.maxCharacters)];
    }
    
    self.maxCharactersLabel.text = [NSString stringWithFormat:@"%ld",self.maxCharacters - [self.text length]];
}



- (CGFloat)heightForLabelWithSize:(CGSize)size{
    
    CGRect rect = [self.placeholder boundingRectWithSize:size
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{
                                            NSFontAttributeName:self.font
                                            }
                                   context:nil];
    return CGRectGetHeight(rect);
}


#pragma mark - getters/setters
- (UILabel *)placeholderLabel{
    
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc]init];
        _placeholderLabel.font = self.font;
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.textColor = [UIColor lightGrayColor];
    }
    return _placeholderLabel;
}

- (UILabel *)maxCharactersLabel{
    
    if (!_maxCharactersLabel) {
        _maxCharactersLabel = [[UILabel alloc] init];
        _maxCharactersLabel.font = self.font;
        _maxCharactersLabel.textColor = [UIColor lightGrayColor];
        _maxCharactersLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_maxCharactersLabel];
    }
    return _maxCharactersLabel;
}



- (void)setPlaceholder:(NSString *)placeholder{
    
    if (_placeholder != placeholder) {
        _placeholder = placeholder;
        [self.placeholderLabel removeFromSuperview];
        self.placeholderLabel = nil;
        [self addSubview:self.placeholderLabel];
        self.placeholderLabel.frame = CGRectMake(padding, padding, CGRectGetWidth(self.frame)-16,[self heightForLabelWithSize:CGSizeMake(CGRectGetWidth(self.frame),CGRectGetHeight(self.frame))]);
        self.placeholderLabel.text = placeholder;
    }
}

- (void)setMaxCharacters:(NSInteger)maxCharacters{
    
    if (_maxCharacters != maxCharacters) {
        _maxCharacters = maxCharacters;
         self.maxCharactersLabel.frame = CGRectMake(CGRectGetWidth(self.frame) - countLabelWidth-padding, CGRectGetHeight(self.frame) - self.font.pointSize-padding, countLabelWidth, self.font.pointSize);
        self.maxCharactersLabel.text = [NSString stringWithFormat:@"%ld",self.maxCharacters];
    }
}

- (void)setFont:(UIFont *)font{

    [super setFont:font];
    self.placeholderLabel.font = font;
}


@end
