//
//  MiCollectionViewController.h
//  CollectionDemo
//
//  Created by Juan Velez Ballesteros on 21/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionDemo/MiColllectionViewCellCollectionViewCell.h"
#import "MiFLowLayout.h"

@interface MiCollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong,nonatomic)NSMutableArray *imagenes;

@end
