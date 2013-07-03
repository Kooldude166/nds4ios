//
//  ROMs.m
//  nds4ios
//
//  Created by David Chavez on 7/3/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "AppDelegate.h"
#import "ROMs.h"
#import "EmuViewController.h"

#define DOCUMENTS_PATH() [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface ROMs ()

@end

@implementation ROMs

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"null" forKey:@"backgroundTitle"];
    
    BOOL isDir;
    NSString* batteryDir = [NSString stringWithFormat:@"%@/Battery",DOCUMENTS_PATH()];
    NSFileManager* fm = [NSFileManager defaultManager];
    
    if (![fm fileExistsAtPath:batteryDir isDirectory:&isDir])
        [fm createDirectoryAtPath:batteryDir withIntermediateDirectories:NO attributes:nil error:nil];
    
    [self reloadRomList];
    
    docWatchHelper = [DocWatchHelper watcherForPath:DOCUMENTS_PATH()];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadRomList) name:kDocumentChanged object:docWatchHelper];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadRomList];
    [self.view becomeFirstResponder];
    
    // Create toolbar to use if game is backgrounded
    NSString *backgroundTitle = [@"Resume: " stringByAppendingString:[[NSUserDefaults standardUserDefaults] objectForKey:@"backgroundTitle"]];
    UIBarButtonItem *buttonItem = [[ UIBarButtonItem alloc ] initWithTitle:backgroundTitle style:UIButtonTypeCustom target:self action:@selector(resumeGame)];
    [buttonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:15], UITextAttributeFont, nil] forState:UIControlStateNormal];
    
    self.toolbarItems = [NSArray arrayWithObject: buttonItem];
    
    // Display this only on Experimental UI
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"experimentalUI"])
    {
        self.title = @"nds4ios";
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadRomList)];
    }
    else
    {
        if ([AppDelegate sharedInstance].hasGame)
            self.navigationController.toolbarHidden = NO;
        else
        {
            self.navigationController.toolbarHidden = YES;
            
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(getMoreROMs)];
        }
    }
    
}

- (void)reloadRomList
{
    [romDictionary removeAllObjects];
    if (!romDictionary)
        romDictionary = [[NSMutableDictionary alloc] init];
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:DOCUMENTS_PATH() error:nil];
    
    romSections = [NSArray arrayWithArray:[@"A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|#" componentsSeparatedByString:@"|"]];
    
    for (int i = 0; i < contents.count; i++)
    {
        NSString *filename = [contents objectAtIndex:i];
        if ([[filename lowercaseString] hasSuffix:@".nds"])
        {
            NSString *characterIndex = [filename substringWithRange:NSMakeRange(0,1)];
            
            BOOL matched = NO;
            for (int i = 0; i < romSections.count && !matched; i++)
            {
                NSString *section = [romSections objectAtIndex:i];
                if ([section isEqualToString:characterIndex])
                    matched = YES;
            }
            
            if (!matched)
                characterIndex = @"#";
            
            NSMutableArray *sectionArray = [romDictionary objectForKey:characterIndex];
            if (sectionArray == nil)
                sectionArray = [[NSMutableArray alloc] init];
            [sectionArray addObject:filename];
            [romDictionary setObject:sectionArray forKey:characterIndex];
        }
    }
    
    [self.tableView reloadData];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *sectionIndexTitles = nil;
    if(romSections.count)
        sectionIndexTitles = [NSMutableArray arrayWithArray:[@"A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|#" componentsSeparatedByString:@"|"]];
    return sectionIndexTitles;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return romSections.count > 0 ? romSections.count : 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = nil;
    if(romSections.count)
    {
        NSInteger numberOfRows = [self tableView:tableView numberOfRowsInSection:section];
        if (numberOfRows > 0)
            sectionTitle = [romSections objectAtIndex:section];
    }
    return sectionTitle;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    currentSection = index;
    return index;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = romDictionary.count;
    if(romSections.count)
        numberOfRows = [[romDictionary objectForKey:[romSections objectAtIndex:section]] count];
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    NSString *filename = [[romDictionary objectForKey:[romSections objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    filename = [filename stringByDeletingPathExtension];
    cell.accessibilityIdentifier = filename;
    cell.textLabel.text = filename;
    
    return cell;
}

- (NSString *)romPathAtIndexPath:(NSIndexPath *)indexPath
{
    return [[romDictionary objectForKey:[romSections objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Load selected ROM and save game name.
    NSString *rom = [[romDictionary objectForKey:[romSections objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:[rom stringByDeletingPathExtension] forKey:@"backgroundTitle"];
    [[AppDelegate sharedInstance] initRomsVCWithRom:rom];
    [AppDelegate sharedInstance].hasGame = YES;
}

- (void)resumeGame
{
    [[AppDelegate sharedInstance] bringBackEmuVC];
}

#pragma mark - Non-UITableView functions

- (void)getMoreROMs
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"showedROMAlert"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com/search?hl=en&source=hp&q=download+ROMs+nds+nintendo+ds&aq=f&oq=&aqi="]];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Hey You! Yes, You!", @"")
                                                        message:NSLocalizedString(@"This opens Safari. Simply download the ROM you want, and then 'Open In...' nds4ios. Everything else will be taken care of. You should own the actual cartridge of any ROM you download!", @"")
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"Ok", @"")
                                              otherButtonTitles:nil];
        [alert show];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"showedROMAlert"];
    }
}

#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com/search?hl=en&source=hp&q=download+ROMs+nds+nintendo+ds&aq=f&oq=&aqi="]];
}

@end
