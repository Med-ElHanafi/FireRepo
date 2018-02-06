//
//  ViewController.h
//  FireBMando
//
//  Created by Mint IT on 23/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : MainViewController

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *passField;
- (IBAction)signOn:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
- (IBAction)goBack:(UIButton *)sender;


@end

