//
//  ColorManager.m
//  TP5-ALT-Bustos
//
//  Created by Jordan Bustos on 11/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "ColorManager.h"


@implementation ColorManager

-(id)init
{
    self = [super init];
    if (self)
    {
        [self addColors];
        
    }
    return self;
}

-(void) addColors
{
    _colors = [[NSMutableArray alloc]init];
    
    [_colors addObject:[UIColor blackColor]]; // never use
    [_colors addObject:[UIColor redColor]];
    [_colors addObject:[UIColor greenColor]];
    [_colors addObject:[UIColor blueColor]];
    [_colors addObject:[UIColor yellowColor]];
}

-(UIColor*) getColorForIdex:(int)index
{
    return [_colors objectAtIndex:index];
}


@end
