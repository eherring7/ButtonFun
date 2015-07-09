//
//  ViewController.m
//  ButtonFun
//
//  Created by Eric Herring on 7/9/15.
//  Copyright (c) 2015 EKJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up the CollectionView Table and Cell
    [self.squareCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"SquareViewCell"];
    self.squareCollectionView.dataSource = self;
    self.squareCollectionView.delegate = self;
    UINib *cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [self.squareCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"SquareViewCell"];
    
    // Get number of cells needed
    [self calculateNumItems];
}


#pragma mark - UICollectionView
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {

    return [self calculateNumItems];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {

    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"SquareViewCell";
    UICollectionViewCell *cell = [_squareCollectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Get random color for cell background
    cell.backgroundColor = [self randomColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [self randomColor];
}

-(void)viewWillLayoutSubviews {

    [self.squareCollectionView reloadData];
}

#pragma mark Calculations
// Calculate the number of squares to fit on the screen size
- (int)calculateNumItems {

    int horizontal = self.view.frame.size.width / 40;
    
    // Round up as in some orientations the math is not exact
    int vertical = ceil((self.view.frame.size.height / 40));
    
    return horizontal * vertical;
}

// Simple random color generator
- (UIColor *)randomColor{

    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
