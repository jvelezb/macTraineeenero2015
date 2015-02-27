//
//  CollectionViewController.h
//  collection
//
//  Created by Juan Velez Ballesteros on 21/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *carImages;
@end
