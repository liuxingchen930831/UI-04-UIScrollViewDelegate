//
//  XCPerson.m
//  UIScrollViewDelegate
//
//  Created by liuxingchen on 16/9/6.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCPerson.h"

@implementation XCPerson

#pragma mark -<UIScrollViewDelegate>
//即将开始拖拽的时候调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging---%@",self);
}
//停止滑动的时候调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating---%@",self);
}
//(减速完毕)由于惯性停止滚动的时候调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging---%@",self);
}
//开始编辑文字方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidBeginEditing");
}

@end
