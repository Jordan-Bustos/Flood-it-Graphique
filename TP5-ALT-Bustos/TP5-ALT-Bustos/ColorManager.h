//
//  ColorManager.h
//  TP5-ALT-Bustos
//
//  Created by Jordan Bustos on 11/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorManager : NSObject

-(id)init;
@property (strong) NSMutableArray * colors;
-(UIColor*) getColorForIdex:(int)index;

@end
