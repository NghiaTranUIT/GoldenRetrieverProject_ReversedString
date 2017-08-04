//
//  StringReversedTests.m
//  StringReversedTests
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TextProcessor.h"
#import "StringReversedMiddleware.h"

@interface StringReversedTests : XCTestCase

@end

@implementation StringReversedTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNormalText {

    // Given
    NSString *input = @"abcdefgh";
    NSString *expected = @"hgfedcba";

    // Process
    NSString *result = [self processText: input];

    // Assert
    NSAssert([result isEqualToString:expected], @"Bug");
}


- (void)testTextWithMixingEmojiString {

    // Given
    NSString *input = @"abcdefgh🔥";
    NSString *expected = @"🔥hgfedcba";

    // Process
    NSString *result = [self processText: input];

    // Assert
    NSAssert([result isEqualToString:expected], @"Bug");
}

-(NSString *) processText:(NSString *) input {

    StringReversedMiddleware *reverseMiddleware = [[StringReversedMiddleware alloc] init];
    TextProcessor *processor = [[TextProcessor alloc] initWithMiddleware:@[reverseMiddleware]];

    // Process
    return [processor process:input];
}
@end
