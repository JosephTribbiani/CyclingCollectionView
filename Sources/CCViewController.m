//
//  CCViewController.m
//  CyclingCollectionView
//
//  Created by Igor Bogatchuk on 3/12/14.
//  Copyright (c) 2014 Igor Bogatchuk. All rights reserved.
//

#import "CCViewController.h"
#import "CCCollectionViewCell.h"

NSString* const kCCCollectionCellIdentifier = @"CollectionCell";

@interface CCViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(145, 192);
	layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
	layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	[self.collectionView setCollectionViewLayout:layout animated:YES];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDatasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CCCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kCCCollectionCellIdentifier forIndexPath:indexPath];
    [cell.label setText:[NSString stringWithFormat:@"%d",indexPath.row]];
    return cell;
}

@end
