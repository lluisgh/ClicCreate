//
//  DropboxProjectsViewController.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 24/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "DropboxProjectsViewController.h"

#import <ProgressHUD/ProgressHUD.h>

@interface DropboxProjectsViewController ()

@end

@implementation DropboxProjectsViewController

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
    
    [self setUpDropbox];
    [self loadDropboxAppFolder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateProjectFiles
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadDropboxAppFolder];
}
- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    DBMetadata *file = self.projectFiles[indexPath.row];
    [cell.textLabel setText:[file filename]];
    [cell.detailTextLabel setText:[self stringFromDate:[file lastModifiedDate]]];
    [cell.imageView setImage:[UIImage imageNamed:@"jClicLogo"]];
}

#pragma mark - Dropbox

- (void)setUpDropbox
{
    DBSession* dbSession =
    [[DBSession alloc] initWithAppKey:@"pycez3qu4hmak2f"
                            appSecret:@"wske1rmc21ya2t6"
                                 root:kDBRootAppFolder]; // either kDBRootAppFolder or kDBRootDropbox
    [DBSession setSharedSession:dbSession];
}

- (DBRestClient *)restClient {
    if (!_dbRestClient) {
        _dbRestClient =
        [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
        [_dbRestClient setDelegate:self];
    }
    return _dbRestClient;
}

- (void)loadDropboxAppFolder
{
    [ProgressHUD show:NSLocalizedString(@"Loading...", nil)];
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
    [[self restClient] loadMetadata:@"/"];
}

#pragma mark - DBRestClient Delegate

- (void)restClient:(DBRestClient*)client uploadedFile:(NSString*)destPath
              from:(NSString*)srcPath metadata:(DBMetadata*)metadata {
    
    NSLog(@"File uploaded successfully to path: %@", [metadata path]);
}

- (void)restClient:(DBRestClient*)client uploadFileFailedWithError:(NSError*)error {
    NSLog(@"File upload failed with error - %@", error);
}

- (void)restClient:(DBRestClient *)client loadedMetadata:(DBMetadata *)metadata {
    if ([metadata isDirectory]) {
        self.projectFiles = metadata.contents;
        [self filterProjectFiles];
        [self sortProjectFiles];
        [self.tableView reloadData];
        [ProgressHUD dismiss];
    }
}

- (void)restClient:(DBRestClient *)client loadMetadataFailedWithError:(NSError *)error {
    if ([error code] == 401) {
        [[DBSession sharedSession] linkFromController:self];
    }
    NSLog(@"Error loading metadata: %@", error);
}


#pragma mark - Project Files

- (void)filterProjectFiles
{
    self.projectFiles = [self.projectFiles filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(DBMetadata *metadata, NSDictionary *bindings) {
        NSString *extension = [[metadata path] pathExtension];
        return [extension isEqualToString:@"zip"] || [extension isEqualToString:@"jclic"];
    }]];

}

- (void)sortProjectFiles
{
    self.projectFiles = [self.projectFiles sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDate *date1 = [obj1 lastModifiedDate];
        NSDate *date2 = [obj2 lastModifiedDate];
        
        return [date1 compare:date2] == NSOrderedDescending;
    }];

}

- (IBAction)refresh:(id)sender
{
    [self loadDropboxAppFolder];
}
@end
