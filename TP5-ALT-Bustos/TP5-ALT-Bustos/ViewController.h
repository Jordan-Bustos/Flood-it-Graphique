//
//  ViewController.h
//  TP5-ALT-Bustos
//
//  Created by Jordan Bustos on 11/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"
#import "Case.h"
#import "ColorManager.h"

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (weak, nonatomic) IBOutlet UILabel *lbCoutsRestant;
@property (weak, nonatomic) IBOutlet UILabel *lbInfo;
- (IBAction)bpRejouerTouchUpInside:(id)sender;

@property (strong) GameManager* gameManager;
@property (strong) ColorManager* colorManager;

@end
