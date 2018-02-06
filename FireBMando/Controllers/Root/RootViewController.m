//
//  RootViewController.m
//  FireBMando
//
//  Created by Mint IT on 24/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray* data;
}
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation RootViewController
static NSString* reuseIdentifier=@"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ref = [[FIRDatabase database] reference];
    [self getDataFromFire];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ItemCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}
-(void)getDataFromFire{
    [_ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSEnumerator *children = [snapshot children];
        FIRDataSnapshot *child;
        data=[[NSMutableArray alloc]init];
        while (child = [children nextObject]) {
            NSLog(@"user :%@",child);
            NSError *error;
            Item *item=[[Item alloc]initWithDictionary:child.value error:&error];
            [data addObject:item];
        }
        [self.collectionView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Item *item=[data objectAtIndex:indexPath.row];
    [cell.itemImage setImageWithURL:[NSURL URLWithString:item.image] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = self.view.frame.size.height;
    CGFloat width  = self.view.frame.size.width;
    return CGSizeMake(width*0.5-4,width*0.5-4);
}
@end
