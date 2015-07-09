//
//  ViewController.h
//  ButtonFun
//
//  Created by Eric Herring on 7/9/15.
//  Copyright (c) 2015 EKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UIView *squareView;

@property (strong, nonatomic) IBOutlet UICollectionView *squareCollectionView;

@end

