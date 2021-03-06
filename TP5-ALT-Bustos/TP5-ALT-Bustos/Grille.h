//
//  Grille.h
//  TP5-ALT-Bustos
//
//  Created by Jordan Bustos on 11/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Case.h"

@interface Grille : NSObject

@property int hauteur;
@property int largeur;
@property int nbCouleurs;
@property (strong) NSMutableDictionary * cases;

-(id)initWithHauteur:(int)hauteur withLargeur:(int)largeur withNnombreCouleurs:(int)nbCouleurs;
-(Boolean)changerEnsemble:(int)oldCouleur nouvelleCouleur:(int)newCouleur;
-(NSMutableString *)toNSMutableString;
-(int)getFirstColor;
-(Boolean)isFull;
-(Case *)getCaseForIndexHauteur:(int)h andIndexLargeur:(int)l;

@end
