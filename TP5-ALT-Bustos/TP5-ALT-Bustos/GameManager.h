//
//  GameManager.h
//  TP5-ALT-Bustos
//
//  Created by Jordan Bustos on 11/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grille.h"

@interface GameManager : NSObject

@property (strong) Grille * grille;
@property int nbCoups;
@property int nbCoupsRestant;

-(id)initWithGrilleHauteur:(int)grilleHauteur withGrilleLargeur:(int)grilleLargeur withNbCouleurs:(int)nbCouleurs;

-(BOOL)jouerCoup:(Case*)c;

@end
