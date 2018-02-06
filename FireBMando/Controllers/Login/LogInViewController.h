//
//  LogInViewController.h
//  FireBMando
//
//  Created by Mint IT on 24/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : MainViewController
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *passField;

- (IBAction)logIn:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
- (IBAction)goBack:(UIButton *)sender;

@end
