//
//  DropboxProjectsViewController.h
//  ClicCreate
//
//  Created by Lluís Gómez Hernando on 24/10/13.
//  Copyright (c) 2013 Lluís Gómez Hernando. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProjectsViewController.h"
#import <DropboxSDK/DropboxSDK.h>

@interface DropboxProjectsViewController : ProjectsViewController <DBRestClientDelegate>

@property (strong, nonatomic) DBRestClient *dbRestClient;
- (IBAction)refresh:(id)sender;

@end
