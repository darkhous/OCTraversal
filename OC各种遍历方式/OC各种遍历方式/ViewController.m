//
//  ViewController.m
//  OC各种遍历方式
//
//  Created by 马悦 on 16/6/21.
//  Copyright © 2016年 马悦. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    NSDictionary *dic = @{@"1":@"1",@"2":@"2",@"3":@"3",@"4":@"4",@"5":@"5"};
    NSSet *set = [[NSSet alloc] initWithObjects:@1,@2,@3,@4,@5,@6,@7,@8,@9,@10, nil];
    //1.使用for循环
        //------------处理数组------------
            for (int i=0; i<array.count; i++) {
                NSLog(@"%@",array[i]);
            }
        //------------处理字典------------
            NSArray *keyArray = [dic allKeys];
            for (int i=0; i<keyArray.count; i++) {
                NSLog(@"key=%@,value=%@",keyArray[i],dic[keyArray[i]]);
            }
        //------------处理集合------------
            NSArray *setArray = [set allObjects];
            for (int i=0; i<setArray.count; i++) {
                NSLog(@"%@",setArray[i]);
            }
        //------------反向遍历------------
            for (int i=0; i<array.count; i++) {
                NSLog(@"%@",array[array.count-1-i]);
            }
    //2.使用NSEnumerator
        //------------处理数组------------
            NSEnumerator *arrayEnumerator = [array objectEnumerator];
            NSNumber *obj;
            while ((obj = [arrayEnumerator nextObject]) != nil) {
                NSLog(@"%@",obj);
            }
        //------------处理字典------------
            NSEnumerator *dicEnumerator = [dic keyEnumerator];
            NSString *key;
            while ((key = [dicEnumerator nextObject]) != nil) {
                NSLog(@"key=%@,Value=%@",key,dic[key]);
            }
        //------------处理集合------------
            NSEnumerator *setEnumerator = [set objectEnumerator];
            NSString *setObj;
            while ((setObj = [setEnumerator nextObject]) != nil) {
                NSLog(@"%@",setObj);
            }
        //------------反向遍历------------
            NSEnumerator *arrayEnumerator2 = [array reverseObjectEnumerator];
            NSNumber *reverseObj;
            while ((reverseObj = [arrayEnumerator2 nextObject]) != nil) {
                NSLog(@"%@",reverseObj);
            }
    //3.使用for...in遍历
        //------------处理数组------------
            for (id obj in array) {
                NSLog(@"%@",obj);
            }
        //------------处理字典------------
            for (id obj in dic) {
                NSLog(@"key=%@,value=%@",obj,dic[obj]);
            }
        //------------处理集合------------
            for (id obj in set) {
                NSLog(@"%@",obj);
            }
        //------------反向遍历------------
            for (id obj in [array reverseObjectEnumerator]) {
                NSLog(@"%@",obj);
            }
    //4.基于block遍历
        //------------处理数组------------
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"对象:%@,下标:%lu",obj,(unsigned long)idx);
            }];
        //------------处理字典------------
            [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                NSLog(@"key=%@,value=%@",key,obj);
            }];
        //------------处理集合------------
            [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
                NSLog(@"%@",obj);
            }];
        //------------反向遍历------------
            [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%@",obj);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
