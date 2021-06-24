//
//  XYMediEventAdapterTests.m
//  XYMediEventAdapter_Tests
//
//  Created by robbin on 2021/6/22.
//  Copyright © 2021 QuVideoInc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XYMediEventAdapter.h"
#import "XYMediEventProtocol.h"

@interface XYEventService : NSObject<XYMediEventProtocol>

@property (nonatomic, strong) void(^sendCallback)(NSString * name, NSDictionary * attribute);

@end

@interface XYMediEventAdapterTests : XCTestCase

@property (nonatomic, strong) XYEventService * eventService;

@end

@implementation XYMediEventAdapterTests

- (void)setUp {
    self.eventService = [XYEventService new];
    [XYMediEventManager sharedInstance].eventAdapter = self.eventService;
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testEventTests {
    XCTestExpectation * expectation = [[XCTestExpectation alloc] initWithDescription:@"等待get"];
    
    self.eventService.sendCallback = ^(NSString *name, NSDictionary *attribute) {
        XCTAssertNotNil(name);
        [expectation fulfill];
    };
    
    XYMediAppEventSend(@"test", @{@"key": @"value"});
    
    [self waitForExpectations:@[expectation] timeout:5];
}

@end



@implementation XYEventService



- (void)appEventWithName:(NSString *)name attribute:(NSDictionary *)attribute {
    self.sendCallback(name, attribute);
}

@end
