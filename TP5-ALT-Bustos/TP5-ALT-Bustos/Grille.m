//
//  Grille.m
//  TP5-ALT-Bustos
//
//  Created by Jordan Bustos on 11/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "Grille.h"

@implementation Grille

-(id)initWithHauteur:(int)hauteur withLargeur:(int)largeur withNnombreCouleurs:(int)nbCouleurs
{
    self = [super init];
    if (self)
    {
        _hauteur = hauteur;
        _largeur = largeur;
        _nbCouleurs = nbCouleurs;
        _cases = [[NSMutableDictionary alloc]init];
        [self creerCases];
    }
    return self;
}

-(void)creerCases
{
    long seed = time(NULL);
    srand((int)seed);
    int couleur;
    NSString * key ;
    Case * caseCourante;
    
    for (int h=0;h<_hauteur;h++)
    {
        for(int l=0;l<_largeur;l++)
        {
            couleur = (rand()%_nbCouleurs) + 1;
            key = [self getKeyForIndexHauteur:h andIndexLargeur:l];
            caseCourante = [[Case alloc]initWithPositionHauteur:h withPositionLargeur:l WithCouleur:couleur];
            
            [_cases setObject:caseCourante forKey:key];
        }
    }
    
    [self determinerCasesVoisines];
}

-(void)determinerCasesVoisines
{
    Case * caseCourante;
    Case * caseTmp;
    
    for (int h=0; h<_hauteur;h++)
    {
        for (int l=0;l<_largeur;l++)
        {
            caseCourante = [self getCaseForIndexHauteur:h andIndexLargeur: l];
            
            caseTmp = [self getCaseForIndexHauteur:h-1 andIndexLargeur: l];
            if (caseTmp != Nil)
                [caseCourante addCaseVoisine:caseTmp];
            
            caseTmp = [self getCaseForIndexHauteur:h+1 andIndexLargeur: l];
            if (caseTmp != Nil)
                [caseCourante addCaseVoisine:caseTmp];
            
            caseTmp = [self getCaseForIndexHauteur:h andIndexLargeur: l-1];
            if (caseTmp != Nil)
                [caseCourante addCaseVoisine:caseTmp];
            
            caseTmp = [self getCaseForIndexHauteur:h andIndexLargeur: l+1];
            if (caseTmp != Nil)
                [caseCourante addCaseVoisine:caseTmp];
        }
    }
}

-(NSString *)getKeyForIndexHauteur:(int)h andIndexLargeur:(int)l
{
    NSString * key = [[NSString alloc]initWithFormat:@"%d-%d",h,l];
    return key;
}

-(Case *)getCaseForIndexHauteur:(int)h andIndexLargeur:(int)l
{
    NSString * key = [[NSString alloc]initWithFormat:@"%d-%d",h,l];
    return [_cases objectForKey:key];
}


-(int)getFirstColor
{
    NSString * keyFirst = [self getKeyForIndexHauteur:0 andIndexLargeur:0];
    Case * caseFirst = [_cases objectForKey:keyFirst];
    
    return caseFirst.couleur;
}

-(Boolean)changerEnsemble:(int)oldCouleur nouvelleCouleur:(int)newCouleur
{
    NSString * keyFirst = [self getKeyForIndexHauteur:0 andIndexLargeur:0];
    Case * caseFirst = [_cases objectForKey:keyFirst];
    
    return [caseFirst changerAncienneCouleur:oldCouleur nouvelleCouleur:newCouleur];
}

-(Boolean) isFull
{
    int couleurCourrante;
    int couleurFirst;
    NSString * key ;
    Case * caseCourante;
    
    couleurFirst = [self getFirstColor];
    
    for (int h=0;h<_hauteur;h++)
    {
        for(int l=0;l<_largeur;l++)
        {
            key = [self getKeyForIndexHauteur:h andIndexLargeur:l];
            caseCourante = [_cases objectForKey:key];
            couleurCourrante = caseCourante.couleur;
            if (couleurCourrante != couleurFirst)
            {
                return false;
            }
        }
    }
    return true;
}


-(NSMutableString *)toNSMutableString
{
    NSMutableString * chaine = [[NSMutableString alloc]init];
    
    NSString * key ;
    Case * caseCourante;
    
    [chaine appendString:@"\r"];
    
    for (int h=0;h<_hauteur;h++)
    {
        for(int l=0;l<_largeur;l++)
        {
            key = [self getKeyForIndexHauteur:h andIndexLargeur:l];
            caseCourante = [_cases valueForKey:key];
            [chaine appendFormat:@"%@\t",[caseCourante getCouleurInString]];
        }
        
        [chaine appendString:@"\r"];
    }
    
    return chaine;
}


@end
