//
//  ExistingProjectsViewController.m
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 07/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import "ExistingProjectsViewController.h"

@interface ExistingProjectsViewController ()

@property (strong, nonatomic) NSArray *projectFiles;

@end

@implementation ExistingProjectsViewController

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
    [self updateProjectFiles];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.projectFiles count];
}

@end
