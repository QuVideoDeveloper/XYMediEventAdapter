//
//  XYViewController.m
//  XYMediEventAdapter
//
//  Created by QuVideoInc. on 03/16/2020.
//  Copyright (c) 2020 QuVideoInc.. All rights reserved.
//

#import "XYViewController.h"
#import "XYMediEventAdapter.h"

@interface XYViewController ()<XYMediEventProtocol>

@end

@implementation XYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [XYMediEventManager sharedInstance].eventAdapter = self;
    
    
    
//    [[XYMediEventManager sharedInstance] appEventWithName:@"aaa" attribute:Attribute]
}

- (void)appEventWithName:(NSString *)name attribute:(NSDictionary *)attribute {
    NSLog(@"发送了埋点 %@， 参数是 %@", name, attribute);
}

@end
