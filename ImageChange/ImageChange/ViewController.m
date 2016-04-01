//
//  ViewController.m
//  ImageChange
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController1.h"
#import "TestViewController2.h"
@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController
    static NSInteger number = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    
    [self setUpScrollView];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    
    
    
    
    
}

- (void)changeImage
{
    number++;
    if (number == 4) {
        number = 0;
    }
    self.scrollView.contentOffset = CGPointMake(self.view.bounds.size.width * number, 0);
}
//给scrollView中加入图片
- (void)setUpScrollView
{
    
    for (int i = 1; i < 5; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"aaa%d",i]] forState:UIControlStateNormal];
        
        button.frame = CGRectMake((i - 1) * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        
        [self.scrollView addSubview:button];
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 4, self.view.bounds.size.height);
}
- (void)clickBtn:(UIButton *)sender
{
    if (sender.tag == 101) {
        TestViewController1 *test1 = [[TestViewController1 alloc]init];
        [self presentViewController:test1 animated:YES completion:nil];
        
    }
    else
    {
        TestViewController2 *test2 = [[TestViewController2 alloc]init];
        [self presentViewController:test2 animated:YES completion:nil];
    }
}

@end
