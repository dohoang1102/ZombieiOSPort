//
//  Zombie.m
//  ZombiesiOSPort
//
//  Created by robert curtis on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie

@synthesize name, numberOfBrainsEaten, type;

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ of type %@ has eaten %@ brains!", name, type, numberOfBrainsEaten];
}

@end
