//
//  MiFLowLayout.m
//  CollectionDemo
//
//  Created by Juan Velez Ballesteros on 21/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "MiFLowLayout.h"

@implementation MiFLowLayout


-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Get the current attributes for the item at the indexPath
    UICollectionViewLayoutAttributes *attributes =
    [super layoutAttributesForItemAtIndexPath:indexPath];
    
    // Modify them to match the pinch values
    [self modifyLayoutAttributes:attributes];
    
    // return them to collection view
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    // Get all the attributes for the elements in the specified frame
    NSArray *allAttributesInRect = [super
                                    layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *cellAttributes in allAttributesInRect)
    {
        // Modify the attributes for the cells in the frame rect
        [self modifyLayoutAttributes:cellAttributes];
    }
    return allAttributesInRect;
}

-(void)modifyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    // If the indexPath matches the one we have stored
    if ([layoutAttributes.indexPath isEqual:_currentCellPath])
    {
        // Assign the new layout attributes
        layoutAttributes.transform3D =
        CATransform3DMakeScale(_cellScale,_cellScale, 1.0);
        layoutAttributes.center = _cellCenter;
        layoutAttributes.zIndex = 1;
    }
}



-(void)setCurrentCellScale:(CGFloat)scale
{
    _cellScale = scale;
    [self invalidateLayout];
}

- (void)setCurrentCellCenter:(CGPoint)origin
{
    _cellCenter = origin;
    [self invalidateLayout];
}


@end
