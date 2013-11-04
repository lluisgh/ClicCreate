//
//  LocalProjectsViewController.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 24/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "LocalProjectsViewController.h"

#import <ProgressHUD/ProgressHUD.h>

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
    
    [self updateProjectFiles];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    //File name
    NSURL *fileURL = self.projectFiles[indexPath.row];
    [cell.textLabel setText:[fileURL lastPathComponent]];
    
    //Last modification date
    NSDate *lastMofiedDate;
    [fileURL getResourceValue:&lastMofiedDate forKey:NSURLContentModificationDateKey error:nil];
    
    [cell.detailTextLabel setText:[self stringFromDate:lastMofiedDate]];
}


#pragma mark - Project Files

- (void)updateProjectFiles
{
    [self setUpProjectFiles];
    [self filterProjectFiles];
    [self sortProjectFiles];
}

- (void)setUpProjectFiles
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSURL *documentsPath = [fileManager URLForDirectory:NSDocumentDirectory
                                               inDomain:NSUserDomainMask
                                      appropriateForURL:nil
                                                 create:NO
                                                  error:&error];
    
    self.projectFiles = [fileManager contentsOfDirectoryAtURL:documentsPath includingPropertiesForKeys:@[NSURLContentModificationDateKey] options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
}

- (void)sortProjectFiles
{
    self.projectFiles = [self.projectFiles sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDate *date1;
        [obj1 getResourceValue:&date1 forKey:NSURLContentModificationDateKey error:nil];
        NSDate *date2;
        [obj1 getResourceValue:&date2 forKey:NSURLContentModificationDateKey error:nil];
        
        return [date1 compare:date2] == NSOrderedDescending;
    }];
}

- (void)filterProjectFiles
{
    self.projectFiles = [self.projectFiles filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSURL *fileURL, NSDictionary *bindings) {
        NSString *extension = [fileURL pathExtension];
        return [extension isEqualToString:@"zip"] || [extension isEqualToString:@"jclic"];
    }]];
}

- (IBAction)refresh:(id)sender
{
    [ProgressHUD show:NSLocalizedString(@"Loading...", nil)];
    [self updateProjectFiles];
    [self.tableView reloadData];
    [ProgressHUD dismiss];
}
@end
