//
//  ViewController.m
//  TP5-ALT-Bustos
//
//  Created by Jordan Bustos on 11/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _gameManager = [[GameManager alloc]initWithGrilleHauteur:7 withGrilleLargeur:7 withNbCouleurs:3];
    _colorManager = [[ColorManager alloc]init];
    
    [self configureLabels]; // configure les labels
    [self configureSizeItems]; // configurer la taille des "cases"
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureLabels
{
    NSString * valueLbCoutsRestants = [[NSString alloc]initWithFormat:@"Coûts restant : %d",_gameManager.nbCoupsRestant];
    [_lbCoutsRestant setText:valueLbCoutsRestants];
    _lbCoutsRestant.text = valueLbCoutsRestants;
    
    
    if (_gameManager.nbCoupsRestant == 0 && _gameManager.grille.isFull)
        [_lbInfo setText:@"Vous avez gagnez !"];
    else if (_gameManager.nbCoupsRestant == 0 && !_gameManager.grille.isFull)
        [_lbInfo setText:@"Vous avez perdu !"];
    else
        [_lbInfo setText:@"Choisir une couleur"];


}

- (void)configureSizeItems
{
    CGFloat width = (self.collectionView.frame.size.width / _gameManager.grille.largeur) ;
    CGFloat height = (self.collectionView.frame.size.height / _gameManager.grille.hauteur) ;
    CGSize size = CGSizeMake(width, height);
    
    _collectionViewFlowLayout.itemSize = size;
}

// nombre de section (nb de lignes)
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return _gameManager.grille.hauteur;
}

// nombre d'items dans la section (nb collones)
- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _gameManager.grille.largeur;
}

// récupérer une "cellule"
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* newCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                                   forIndexPath:indexPath];
    
    Case * c = [_gameManager.grille getCaseForIndexHauteur:(int)indexPath.section andIndexLargeur:(int)indexPath.row];
    
    newCell.backgroundColor = [_colorManager getColorForIdex:c.couleur];
    
    return newCell;
}

// quand on clique sur la grille
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Case * c = [_gameManager.grille getCaseForIndexHauteur:(int)indexPath.section andIndexLargeur:(int)indexPath.row];
    [_gameManager jouerCoup:c];
    
    [_collectionView reloadData];
    [self configureLabels]; // configurer la taille des "cases"
}

// quand on clique sur le bouton
- (IBAction)bpRejouerTouchUpInside:(id)sender
{
    [self viewDidLoad];
    [_collectionView reloadData];
    [self configureLabels]; // configurer la taille des "cases"
}


@end
