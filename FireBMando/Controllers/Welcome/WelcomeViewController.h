//
//  WelcomeViewController.h
//  FireBMando
//
//  Created by Mint IT on 24/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : MainViewController
@property (strong, nonatomic) IBOutlet UIView *fbView;
@property (strong, nonatomic) IBOutlet UIButton *insView;
@property (strong, nonatomic) IBOutlet UIButton *cnxView;
@property (strong, nonatomic) IBOutlet UIView *gooView;
- (IBAction)fbLogin:(UIButton *)sender;
- (IBAction)connexion:(UIButton *)sender;
- (IBAction)inscription:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

- (IBAction)signoutgoogle:(id)sender;

- (IBAction)googleSignin:(id)sender;

@end
