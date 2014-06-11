//
//  GameManager.m
//  TP5-ALT-Bustos
//
//  Created by Jordan Bustos on 11/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "GameManager.h"

#define GRILLE_STANDARD_NOMBRE_DE_COUPS 25
#define GRILLE_STANDARD_NOMBRE_DE_COULEURS 6
#define GRILLE_STANDARD_HAUTEUR 14
#define GRILLE_STANDARD_LARGEUR 14

@implementation GameManager

-(id)initWithGrilleHauteur:(int)grilleHauteur withGrilleLargeur:(int)grilleLargeur withNbCouleurs:(int)nbCouleurs
{
    self = [super init];
    if (self)
    {
        _grille = [[Grille alloc]initWithHauteur:grilleHauteur withLargeur:grilleLargeur withNnombreCouleurs:nbCouleurs];
        
        _nbCoups =  ((GRILLE_STANDARD_NOMBRE_DE_COUPS * grilleHauteur * grilleLargeur * nbCouleurs)
                     /
                     (GRILLE_STANDARD_HAUTEUR * GRILLE_STANDARD_LARGEUR * GRILLE_STANDARD_NOMBRE_DE_COULEURS)) ;
        _nbCoupsRestant = _nbCoups;
    }
    return self;
}

-(BOOL)jouerCoup:(Case*)c
{
    int oldCouleur = 0;
    
    if(![_grille isFull] && _nbCoupsRestant != 0)
    {
        oldCouleur = [_grille getFirstColor];
        
        if([_grille changerEnsemble:oldCouleur nouvelleCouleur:c.couleur])
            _nbCoupsRestant--;
        
        return true;
    }
    else
        return false;
}


@end
