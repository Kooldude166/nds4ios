//
//  ROMs.h
//  nds4ios
//
//  Created by David Chavez on 7/3/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocWatchHelper.h"

@interface ROMs : UITableViewController
{
    DocWatchHelper *docWatchHelper;
    NSMutableDictionary *romDictionary;
    NSArray *romSections;
    NSInteger currentSection;
}

@end
