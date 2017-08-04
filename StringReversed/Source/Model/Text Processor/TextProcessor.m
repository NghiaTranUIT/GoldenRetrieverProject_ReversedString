//
//  TextProcessor.m
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "TextProcessor.h"
#import "Middleware.h"

@interface TextProcessor()

@property (strong, nonatomic) NSArray<Middleware> *middlewares;

@end

@implementation TextProcessor

-(instancetype) initWithMiddleware:(NSArray<Middleware> *)middlewares {
    self = [super init];

    if (self) {
        self.middlewares = middlewares;
    }

    return self;
}
-(NSString *) process:(NSString *) text {

    NSString *result = [text copy];

    for (id obj in self.middlewares) {

        id<Middleware> middle = obj;

        result = [middle process:result];
    }

    return result;
}

@end
