//
//  LocalProjectsViewController.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 24/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "LocalProjectsViewController.h"

@interface LocalProjectsViewController ()

@end

@implementation LocalProjectsViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateProjectFiles
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSURL *documentsPath = [fileManager URLForDirectory:NSDocumentDirectory
                                               inDomain:NSUserDomainMask
                                      appropriateForURL:nil
                                                 create:NO
                                                  error:&error];
    
    self.projectFiles = [fileManager contentsOfDirectoryAtURL:documentsPath includingPropertiesForKeys:@[NSURLContentModificationDateKey] options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
    
    self.projectFiles = [self.projectFiles filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSURL *fileURL, NSDictionary *bindings) {
        NSString *extension = [fileURL pathExtension];
        return [extension isEqualToString:@"zip"] || [extension isEqualToString:@"jclic"];
    }]];
    
    self.projectFiles = [self.projectFiles sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDate *date1;
        [obj1 getResourceValue:&date1 forKey:NSURLContentModificationDateKey error:nil];
        NSDate *date2;
        [obj1 getResourceValue:&date2 forKey:NSURLContentModificationDateKey error:nil];
        
        return [date1 compare:date2] == NSOrderedDescending;
    }];
}

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    //File name
    NSURL *fileURL = self.projectFiles[indexPath.row];
    [cell.textLabel setText:[fileURL lastPathComponent]];
    
    //Last modification date
    NSDate *lastMoficationDate;
    [fileURL getResourceValue:&lastMoficationDate forKey:NSURLContentModificationDateKey error:nil];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [cell.detailTextLabel setText:[dateFormatter stringFromDate:lastMoficationDate]];
}

@end
