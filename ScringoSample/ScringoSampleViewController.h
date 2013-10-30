//
//  ScringoSampleViewController.h
//  ScringoSample
//
//  Created by Guy Federovsky on 03/03/13.
//  Copyright (c) 2013 Scringo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Scringo/ScringoLikeButton.h>
#import <Scringo/ScringoCommentButton.h>

@interface ScringoSampleViewController : UIViewController

@property (retain, nonatomic) IBOutlet UINavigationBar *navBar;
@property (retain, nonatomic) IBOutlet UIView *theContentView;
@property (retain, nonatomic) IBOutlet UIImageView *riverImage;
@property (retain, nonatomic) IBOutlet ScringoLikeButton *riverLikeButton;
@property (retain, nonatomic) IBOutlet ScringoCommentButton *riverCommentButton;
@property (retain, nonatomic) IBOutlet NSLayoutConstraint *navBarTopSpaceConstraint;

- (IBAction)addRiverFeed:(id)sender;
- (IBAction)openProfileClicked:(id)sender;
- (IBAction)openQuizClicked:(id)sender;
- (IBAction)openChatRoomsClicked:(id)sender;
@end
