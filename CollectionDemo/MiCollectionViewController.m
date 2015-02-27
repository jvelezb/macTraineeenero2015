//
//  MiCollectionViewController.m
//  CollectionDemo
//
//  Created by Juan Velez Ballesteros on 21/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "MiCollectionViewController.h"

@interface MiCollectionViewController ()

@end

@implementation MiCollectionViewController

static NSString * const reuseIdentifier = @"MiCelda";


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    MiFLowLayout *miFlowLayout =[[MiFLowLayout alloc]init];
    [self.collectionView setCollectionViewLayout:miFlowLayout animated:YES];
    UIGestureRecognizer *pinchRecognizer =[[UIGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
    [self.collectionView addGestureRecognizer:pinchRecognizer];
    [self.collectionView registerClass:[MiColllectionViewCellCollectionViewCell class] forCellWithReuseIdentifier:@"MiCelda"];
    _imagenes = [@[@"chevy_small.jpg",@"mini_small.jpg",@"rover_small.jpg",@"smart.jpg",@"highlander_small.jpg"@"venza_small.jpg",
                   @"volvo_small.jpg",
                   @"vw_small.jpg",
                   @"ford_small.jpg",
                   @"nissan_small.jpg",
                   @"honda_small.jpg",
                   @"jeep_small.jpg"] mutableCopy];
}



-(IBAction)handlePinch:(UIPinchGestureRecognizer *)sender{
    MiFLowLayout *layout = (MiFLowLayout *)self.collectionView.collectionViewLayout;
    if(sender.state == UIGestureRecognizerStateBegan){
        CGPoint puntoInicio =[sender locationInView:self.collectionView];
        NSIndexPath *celdaPinchada =[self.collectionView indexPathForItemAtPoint:puntoInicio];
        layout.currentCellPath = celdaPinchada;
    }else if(sender.state == UIGestureRecognizerStateChanged) {
        layout.cellScale = sender.scale;
        
    }else{
        [self.collectionView  performBatchUpdates: ^{
            layout.currentCellPath=nil;
            layout.cellScale= 1.0;
        }completion:nil];
    
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _imagenes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MiColllectionViewCellCollectionViewCell *miCelda = [collectionView dequeueReusableCellWithReuseIdentifier:@"MiCelda" forIndexPath:indexPath];
    long row =[indexPath row];
    UIImage *image =   [UIImage imageNamed:_imagenes[row]];
   // miCelda.imageView.contentMode =UIViewContentModeScaleAspectFit;
    miCelda.imageView.image= image;
    return miCelda;
}

#pragma mark <UICollectionViewDelegate>


-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    long row = [indexPath row];
    [_imagenes removeObjectAtIndex:row];
    NSArray *borrado =@[indexPath];
    [self.collectionView deleteItemsAtIndexPaths:borrado];
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
 
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
#pragma mark -
#pragma mark UICollectionViewFlowLayoutDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *imagen;
    long row =[indexPath row];
    imagen = [UIImage imageNamed:_imagenes[row]];
    NSLog(@"tamaño w=%f, h=%f ", imagen.size.width,imagen.size.height);
    return imagen.size;
}


@end
