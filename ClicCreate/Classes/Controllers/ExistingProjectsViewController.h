//
//  ExistingProjectsViewController.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 07/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface ExistingProjectsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)cancel:(id)sender;

@end
