//
//  Proyecto2Clase3Tests.m
//  Proyecto2Clase3Tests
//
//  Created by Juan Velez Ballesteros on 13/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Proyecto2Clase3Tests : XCTestCase

@end

@implementation Proyecto2Clase3Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
