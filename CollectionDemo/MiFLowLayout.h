//
//  MiFLowLayout.h
//  CollectionDemo
//
//  Created by Juan Velez Ballesteros on 21/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiFLowLayout : UICollectionViewFlowLayout
@property (strong,nonatomic) NSIndexPath *currentCellPath;
@property (nonatomic) CGPoint cellCenter;
@property(nonatomic)CGFloat cellScale;



@end
