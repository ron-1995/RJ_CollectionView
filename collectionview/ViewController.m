//
//  ViewController.m
//  collectionview
//
//  Created by ronakj on 4/6/16.
//  Copyright (c) 2016 com.ronak.zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSUInteger index ;
    UILabel *fromLabel;
    UICollectionViewCell *cell;
    BOOL isReplay;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isReplay = FALSE;
    
    imgArray = [NSMutableArray arrayWithObjects:@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg",@"cool-wallpaper-2.jpg" ,nil];
    nameArray = [NSMutableArray arrayWithObjects:@"Ronak J", @"Jakky",@"Bhavik ",@"Datt",@"Dharmesh",@"Shivani",@"Vibha",@"Bhumesh",@"Dhaval",@"Firdosh",@"Shivani",@"Vbha",@"Mashuk",@"Disha" ,nil];
    
    NSArray *indexes = [_shipmentCollectionView indexPathsForVisibleItems];
    
    for (NSIndexPath *path in indexes) {
        index = [path indexAtPosition:[path length] - 1];
        NSLog(@"%lu", index);
    }
    if (index == 0){
        _btnPrevOut.hidden = YES;
    }
    else{
        _btnPrevOut.hidden = NO;
    }
    fromLabel = [[UILabel alloc]init];
    fromLabel.font = [UIFont systemFontOfSize:12];
    fromLabel.text = @" you are already in the last page";
    fromLabel.textColor = [UIColor whiteColor];
    fromLabel.backgroundColor = [UIColor darkGrayColor];
    fromLabel.clipsToBounds = YES;
    fromLabel.layer.cornerRadius = 10.0;
    
}
-(void)viewWillAppear:(BOOL)animated{
    
      [self performSelector:@selector(AutoScroll) withObject:nil afterDelay:1.5];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return imgArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    [self CellAnimation];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
   
    
    UIImageView *recipeImageView= (UIImageView *)[cell viewWithTag:100];
    UILabel *mylbl= (UILabel *) [cell viewWithTag:200];
    recipeImageView.image = [UIImage imageNamed:[imgArray objectAtIndex:indexPath.row]];
    mylbl.text = [nameArray objectAtIndex:indexPath.row];
   
    return cell;
}
-(void) CellAnimation{
    CATransform3D rotation = CATransform3DMakeRotation( (62.8)/180, .0, 1.5, 1.5);
    cell.contentView.alpha = .6;
    cell.contentView.layer.transform = rotation;
  //  cell.contentView.layer.anchorPoint = CGPointMake(0, 0.5);
    
    [UIView animateWithDuration:1.2
                     animations:^{
                         cell.contentView.layer.transform = CATransform3DIdentity;
                         cell.contentView.alpha = 1.0;
                       //  cell.contentView.layer.shadowOffset = CGSizeMake(0, 0);
                     } completion:^(BOOL finished) {
                     }];

    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:indexPath
{
    CGFloat cellWidth =  [[UIScreen mainScreen] bounds].size.width;
    CGFloat cellHeight =  _shipmentCollectionView.bounds.size.height;
    return CGSizeMake(cellWidth, cellHeight);
}

- (IBAction)BtnnextAction:(id)sender  {
    if (index == 0){
        _btnPrevOut.hidden = YES;
    }
    else{
        _btnPrevOut.hidden = NO;
    }
    NSArray *indexes1 = [_shipmentCollectionView indexPathsForVisibleItems];
    for (NSIndexPath *path in indexes1) {
        index = [path indexAtPosition:[path length] - 1];
        NSLog(@"%lu", index);
    }
    if (index >nameArray.count-2){
        _btnNextOut.hidden = YES;
    }
    else{
        _btnPrevOut.hidden = NO;
        _btnNextOut.hidden = NO;
        [fromLabel removeFromSuperview];
        NSArray *visibleItems = [_shipmentCollectionView indexPathsForVisibleItems];
        NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
        NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentItem.item + 1 inSection:currentItem.section];
        [_shipmentCollectionView scrollToItemAtIndexPath:nextItem
                                        atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                animated:YES];
        if (index >nameArray.count-3){
            _btnNextOut.hidden = YES;
        }
    }
}

- (IBAction)BtnPrevAction:(id)sender {
    NSArray *indexes = [_shipmentCollectionView indexPathsForVisibleItems];
    NSUInteger index = 0;
    for (NSIndexPath *path in indexes) {
        index = [path indexAtPosition:[path length] - 1];
        NSLog(@"%lu", index);
    }
    if (index <= 1){
        _btnPrevOut.hidden = YES;
        _btnNextOut.hidden = NO;
    }
    else{
        _btnPrevOut.hidden = NO;
        _btnNextOut.hidden = NO;
        [fromLabel removeFromSuperview];
    }
    NSArray *visibleItems = [_shipmentCollectionView indexPathsForVisibleItems];
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentItem.item - 1 inSection:currentItem.section];
    [_shipmentCollectionView scrollToItemAtIndexPath:nextItem
                                    atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                            animated:YES];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
   NSArray *indexes1 = [_shipmentCollectionView indexPathsForVisibleItems];
    for (NSIndexPath *path in indexes1) {
        index = [path indexAtPosition:[path length] - 1];
        NSLog(@"%lu", index);
    }
    
    if (index == 0){
        _btnPrevOut.hidden = YES;
        fromLabel.frame = CGRectMake(2,23,183, 32);
        [self.view addSubview:fromLabel];
        [self performSelector:@selector(removeFromSuperView) withObject:nil afterDelay:1.5];
    }
   else if (index >nameArray.count-2){
        _btnNextOut.hidden = YES;
        fromLabel.frame = CGRectMake(185, 23, 183, 32);
        [self.view addSubview:fromLabel];
        [self performSelector:@selector(removeFromSuperView) withObject:nil afterDelay:1.5];
    }
    else{
        _btnPrevOut.hidden = NO;
        _btnNextOut.hidden = NO;
        [fromLabel removeFromSuperview];
    }
}
-(void) removeFromSuperView
{
    [fromLabel removeFromSuperview];
}
-(void) AutoScroll
{
    if (index == 0){
        _btnPrevOut.hidden = YES;
    }
    else{
        _btnPrevOut.hidden = NO;
    }
    if (isReplay) {
        index = 0;
    }
    else{
        NSArray *indexes1 = [_shipmentCollectionView indexPathsForVisibleItems];
        for (NSIndexPath *path in indexes1) {
            index = [path indexAtPosition:[path length] - 1];
            NSLog(@"%lu", index);
        }
    }
    
    if (index >nameArray.count-2){
        _btnNextOut.hidden = YES;
    }
    else{
        _btnPrevOut.hidden = NO;
        _btnNextOut.hidden = NO;
        if (index == 0){
            _btnPrevOut.hidden = YES;
        }
        else{
            _btnPrevOut.hidden = NO;
        }
        [fromLabel removeFromSuperview];
        NSArray *visibleItems;
        if (isReplay){
            visibleItems = [_shipmentCollectionView indexPathForCell:0];
            isReplay = FALSE;
        }
        else{
            visibleItems = [_shipmentCollectionView indexPathsForVisibleItems];
        }
        
        NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
        NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentItem.item + 1 inSection:currentItem.section];
        [_shipmentCollectionView scrollToItemAtIndexPath:nextItem
                                        atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                animated:YES];
        
        for (int i = 0; i <= (index == 4); i++){
            [self viewWillAppear:YES];
            
        }
        if (index >nameArray.count-3){
            _btnNextOut.hidden = YES;
        }
    }    
}
- (IBAction)btnStopAction:(id)sender {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(AutoScroll) object:nil];
    
    
    _btnStopOut.backgroundColor = [UIColor greenColor];
    [_btnStopOut setTitle:@"Start" forState:UIControlStateNormal];
    [_btnStopOut addTarget:self
                    action:@selector(StartAction)
          forControlEvents:UIControlEventTouchUpInside];
  
    
    
}
-(void) StartAction
{
   [self performSelector:@selector(AutoScroll) withObject:nil afterDelay:0.5];
    _btnStopOut.backgroundColor = [UIColor redColor];
    [_btnStopOut setTitle:@"Stop" forState:UIControlStateNormal];
    [_btnStopOut addTarget:self
                    action:@selector(StopAction)
          forControlEvents:UIControlEventTouchUpInside];
    
}
-(void) StopAction
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(AutoScroll) object:nil];
    _btnStopOut.backgroundColor = [UIColor greenColor];
    [_btnStopOut setTitle:@"Start" forState:UIControlStateNormal];
    [_btnStopOut addTarget:self
                    action:@selector(StartAction)
          forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)btnReplayAction:(id)sender {
    isReplay = TRUE;
    index = 0;
    [self performSelector:@selector(AutoScroll) withObject:nil afterDelay:0.5];
    
    _btnStopOut.backgroundColor = [UIColor redColor];
    [_btnStopOut setTitle:@"Stop" forState:UIControlStateNormal];
    [_btnStopOut addTarget:self
                    action:@selector(StopAction)
          forControlEvents:UIControlEventTouchUpInside];
}
@end
