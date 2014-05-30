//
//  Moto.m
//  MobileConf
//
//  Created by Fábio Pimentel on 5/30/14.
//  Copyright (c) 2014 fabiopimentel. All rights reserved.
//

#import "Moto.h"

@implementation Moto

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ da %@ de %d ", self.modelo, self.marca, self.ano];
}

@end
