//
//  NSAttributedString+img.h
//  prepareBoardApp
//
//  Created by apple on 2018/06/07.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString_img : NSMutableAttributedString
//- (instancetype)initWithString:(NSString *)str
//                    attributes:(NSDictionary<NSAttributedStringKey, id> *)attrs;
-(void)insertImage:(UIImage*)image bounds:(CGRect)bounds atIndex:(NSUInteger)index;
@end

//NS_ASSUME_NONNULL_END
