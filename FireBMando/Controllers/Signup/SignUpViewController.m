//
//  ViewController.m
//  FireBMando
//
//  Created by Mint IT on 23/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self AddOrganizerTapToCloseKeyboard];
    [self AddObservers];
    _indicator.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)signOn:(UIButton *)sender {
    _indicator.hidden=NO;
    [_indicator startAnimating];
    if (self.emailField.text.length<2) {
        _indicator.hidden=YES;
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Email" message:@"email>2" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [[FIRAuth auth]createUserWithEmail:self.emailField.text password:self.passField.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
            if (error) {
                NSLog(@"error :%@",error);
                [_indicator stopAnimating];
                _indicator.hidden=YES;
            }else{
                FIRUserProfileChangeRequest *changeRequest = [[FIRAuth auth].currentUser profileChangeRequest];
                changeRequest.displayName = self.nameField.text;
                [changeRequest commitChangesWithCompletion:^(NSError *_Nullable error) {
                    [_indicator stopAnimating];
                    _indicator.hidden=YES;
//                    FIRUser *user=[[FIRAuth auth] currentUser];
//                    NSLog(@"user :%@",user);
                    if (!error) {
                        RootViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"RootViewControllerID"];
                        [APPDELEGATE.window setRootViewController:controller];
                    }
                    
                }];
            }
            
        }];
    }
    
}
- (IBAction)goBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
