//
//  RomsCollectionViewController.m
//  nds4ios
//
//  Created by Brian Tung on 7/1/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "RomsCollectionViewController.h"
#import "AppDelegate.h"

#define DOCUMENTS_PATH() [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface RomsCollectionViewController ()

@end

@implementation RomsCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *collectionViewCell = [UINib nibWithNibName:@"RomsCollectionViewCell" bundle:nil];
    [self.romsView registerNib:collectionViewCell forCellWithReuseIdentifier:@"Cell"];
    
    BOOL isDir;
    NSString* batteryDir = [NSString stringWithFormat:@"%@/Battery", DOCUMENTS_PATH()];
    NSFileManager* fm = [NSFileManager defaultManager];
    
    if (![fm fileExistsAtPath:batteryDir isDirectory:&isDir]) {
        [fm createDirectoryAtPath:batteryDir withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    [self reloadRomList];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    self.docWatchHelper = [DocWatchHelper watcherForPath:documentsDirectory];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadRomList) name:kDocumentChanged object:self.docWatchHelper];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self reloadRomList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadRomList
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    
    [_romDictionary removeAllObjects];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsDirectoryPath error:nil];
    
    _romDictionaryArray = [NSMutableArray arrayWithObjects:_romDictionary, nil];
    
    for (int i = 0; i < contents.count; i++) {
        NSString *filename = [contents objectAtIndex:i];
        if ([[filename lowercaseString] hasSuffix:@".nds"]) {
            [_romDictionaryArray addObject:filename];
        
            [_romDictionary setObject:_romDictionaryArray forKey:nil];
        }
    }
    
    [_romsView reloadData];
    NSLog(@"%@", _romDictionaryArray);
}

#pragma mark - Collection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* rom = [_romDictionaryArray objectAtIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:[rom stringByDeletingPathExtension] forKey:@"backgroundTitle"];
    [[AppDelegate sharedInstance] initRomsVCWithRom:rom];
    [AppDelegate sharedInstance].hasGame = YES;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize dimensions = CGSizeMake(80, 115);
    return dimensions;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionView datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger numberOfItems = _romDictionaryArray.count;

    return numberOfItems;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    //use views with tags
    gameTitle = (UILabel *)[cell viewWithTag:101];
    gameImageView = (UIImageView *)[cell viewWithTag:102];
    
    UIImage *gameImage = [UIImage imageNamed:@"nds4ios.png"];
    gameImageView.image = gameImage;
    
    //info
    
    NSString *filename = [_romDictionaryArray objectAtIndex:indexPath.row];
    filename = [filename stringByDeletingPathExtension];
    gameTitle.text = filename;
    gameTitle.textColor = [UIColor blackColor];
    gameTitle.font = [UIFont systemFontOfSize:12.f];
    
    return cell;
}

@end
