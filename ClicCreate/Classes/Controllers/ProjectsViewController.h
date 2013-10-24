//
//  ExistingProjectsViewController.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 07/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface ProjectsViewController : UITableViewController

@property (strong, nonatomic) NSArray *projectFiles;

- (IBAction)cancel:(id)sender;

- (void)updateProjectFiles;
- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

@end
