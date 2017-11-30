//
//  RedBagView.h
//  redBag
//
//  Created by Chan on 2017/4/13.
//  Copyright © 2017年 Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RedBagView : UIView
@property(nonatomic,copy)void (^complete)(NSInteger index);

+ (RedBagView *)redBagViwWithDataSource:(NSArray *)dataArray withcomplete:(void (^)(NSInteger index))complete;

@end
