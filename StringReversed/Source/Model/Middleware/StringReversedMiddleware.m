//
//  StringReversedMiddleware.m
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "StringReversedMiddleware.h"
#import "NSArray+Helper.h"

@implementation StringReversedMiddleware

-(nonnull NSString *) process:(nonnull NSString *) text {

    // Convert to array
    NSMutableArray<NSString *> *stringComponents = [[self toArray:text] mutableCopy];

    // Prepare data
    NSUInteger length = stringComponents.count;
    NSUInteger halfPoint = length / 2;

    // Swap first character to last character
    // And goes back to the halft point
    // It's save haft of time
    // Althought time complexity = O(n). But actually it's n/2
    // with n is lengh of text

    for (NSUInteger i = 0; i < halfPoint; i++) {
        NSString *temp = stringComponents[i];
        NSUInteger indicator = length - 1 - i;

        // Swap
        stringComponents[i] = [stringComponents[indicator] copy];
        stringComponents[indicator] = [temp copy];
    }

    // Build
    NSString *result = [self buildStringFromArray:stringComponents];
    return result;
}

-(NSMutableArray<NSString *> *) toArray:(NSString *) text {
    NSRange range = [text rangeOfString:text];
    NSMutableArray<NSString *> *result = [@[] mutableCopy];

    [text enumerateSubstringsInRange: range
                                  options:NSStringEnumerationByComposedCharacterSequences
                               usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                   [result addObject:substring];
                               }];
    return [result copy];
}

-(NSString *) buildStringFromArray:(NSArray<NSString *> *) stringComponents {
    return [stringComponents reduceString:@"" combine:^NSString *(NSString *acum, NSString *element) {
        return [NSString stringWithFormat:@"%@%@", acum, element];
    }];
}


@end



