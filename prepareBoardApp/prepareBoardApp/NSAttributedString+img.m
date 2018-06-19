//
//  NSAttributedString+img.m
//  prepareBoardApp
//
//  Created by apple on 2018/06/07.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "NSAttributedString+img.h"

@implementation NSAttributedString_img
//- (instancetype)initWithString:(NSString *)str
//                    attributes:(NSDictionary<NSAttributedStringKey, id> *)attrs{
//    return [super initWithString:str attributes:attrs];
//    
//}

-(void)insertImage:(UIImage*)image bounds:(CGRect)bounds atIndex:(NSUInteger)index{
    NSTextAttachment *at = [[NSTextAttachment alloc] init];
    at.image = image;
    at.bounds = bounds;
    NSAttributedString *ns = [NSAttributedString attributedStringWithAttachment:at];
    // unicode : NSAttachmentCharacter = 0xFFFC
    
    [self insertAttributedString:ns atIndex:index];
}
@end
