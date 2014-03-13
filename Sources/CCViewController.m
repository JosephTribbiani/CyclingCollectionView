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

@interface CCViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray* dataSource;

@property CGFloat topThreshold;
@property CGFloat bottomThreshold;

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = @[@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"];
    
    UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(140, 190);
	layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
	layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	[self.collectionView setCollectionViewLayout:layout animated:YES];
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
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
    return [self.dataSource count] * 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CCCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kCCCollectionCellIdentifier forIndexPath:indexPath];
    
    NSInteger indexOfItemInDataSource = indexPath.row;
    
    if (indexOfItemInDataSource > [self.dataSource count] - 1)
    {
        indexOfItemInDataSource -= [self.dataSource count];
    }
    
    [cell.label setText:self.dataSource[indexOfItemInDataSource]];
    if (indexOfItemInDataSource == 0 || indexOfItemInDataSource == 6)
    {
        cell.backgroundColor = [UIColor greenColor];
    }
    else
    {
        cell.backgroundColor = [UIColor blueColor];
    }
    
    return cell;
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger itemsCount = self.dataSource.count * 2;
    
    if (scrollView.contentOffset.x < (scrollView.contentSize.width / itemsCount))
    {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + (scrollView.contentSize.width / 2), scrollView.contentOffset.y);
    }
    if (scrollView.contentOffset.x > ((scrollView.contentSize.width * (itemsCount / 2 + 1))/ itemsCount))
    {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x - (scrollView.contentSize.width / 2), scrollView.contentOffset.y);
    }
}

@end
