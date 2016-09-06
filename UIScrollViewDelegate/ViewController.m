//
//  ViewController.m
//  UIScrollViewDelegate
//
//  Created by liuxingchen on 16/9/6.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"
#import "XCPerson.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)XCPerson * person ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minion"]];
    [self.scrollView addSubview:imageView];
    self.scrollView.contentSize = imageView.image.size;
    /**
     代理的耦合度比较低
     这里设置了代理把scrollView的代理方法交给person去处理
     */
    self.person = [[XCPerson alloc]init];
    self.scrollView.delegate = self.person;
    
    /**
     UITextField比较特殊，可以通过addTarget和Delegate两种来监听方法键盘的改变
     */
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(0, 40, 200, 30)];
    textfield.backgroundColor = [UIColor grayColor];
    [textfield addTarget:self action:@selector(change:) forControlEvents:(UIControlEventEditingChanged)];
    [self.view addSubview:textfield];
    textfield.delegate = self.person;
}
#pragma mark UITextField

-(void)change:(UITextField *)textfild
{
    NSLog(@"---%@",textfild.text);
}
#pragma mark -<UIScrollViewDelegate>
//开始拖拽的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollViewDidScroll---");
}

//即将开始拖拽的时候调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging---");
}
//停止滑动的时候调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating---");
}
//(减速完毕)由于惯性停止滚动的时候调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging---");
}
@end
