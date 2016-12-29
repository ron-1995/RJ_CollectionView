//
//  ViewController.h
//  collectionview
//
//  Created by ronakj on 4/6/16.
//  Copyright (c) 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

{
    NSMutableArray *imgArray;
    NSMutableArray *nameArray;
}
- (IBAction)btnStopAction:(id)sender;
- (IBAction)BtnnextAction:(id)sender;
- (IBAction)BtnPrevAction:(id)sender;
- (IBAction)btnReplayAction:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *btnPrevOut;
@property (weak, nonatomic) IBOutlet UIButton *btnNextOut;
@property (weak, nonatomic) IBOutlet UIButton *btnStopOut;

@property (weak, nonatomic) IBOutlet UIButton *btnReplayOut;



@property (weak, nonatomic) IBOutlet UICollectionView *shipmentCollectionView;
@end

