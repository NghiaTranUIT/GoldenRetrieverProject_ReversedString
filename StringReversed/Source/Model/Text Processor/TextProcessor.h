//
//  TextProcessor.h
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Middleware.h"
#import "Processor.h"

@interface TextProcessor : NSObject <Processor>

-(instancetype) initWithMiddleware:(NSArray<Middleware> *) middlewares;

-(NSString *) process:(NSString *) text;

@end
