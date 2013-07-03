//
//  RomsCollectionViewController.h
//  nds4ios
//
//  Created by Brian Tung on 7/1/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocWatchHelper.h"

@interface RomsCollectionViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    UILabel *gameTitle;
    UIImageView *gameImageView;
    
    UICollectionViewCell *cell;
}
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) DocWatchHelper *docWatchHelper;
@property (strong, nonatomic) NSMutableDictionary *romDictionary;
@property (strong, nonatomic) NSArray *romSections;
@property (strong, nonatomic) NSMutableArray *romDictionaryArray;
@property (nonatomic) NSInteger currentSection_;

@property (nonatomic, weak) IBOutlet UICollectionView *romsView;

@end
