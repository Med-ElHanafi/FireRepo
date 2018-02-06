//
//  WelcomeViewController.m
//  FireBMando
//
//  Created by Mint IT on 24/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _fbView.layer.cornerRadius=_fbView.frame.size.height*0.5;
    _fbView.clipsToBounds=YES;
    _insView.layer.cornerRadius=_fbView.frame.size.height*0.5;
    _insView.clipsToBounds=YES;
    _cnxView.layer.cornerRadius=_fbView.frame.size.height*0.5;
    _cnxView.clipsToBounds=YES;
    _gooView.layer.cornerRadius=_fbView.frame.size.height*0.5;
    _gooView.clipsToBounds=YES;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _indicator.hidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)fbLogin:(UIButton *)sender {
    _indicator.hidden=NO;
    [_indicator startAnimating];
    FBSDKLoginManager *login=[[FBSDKLoginManager alloc]init];
    [login logInWithReadPermissions:@[@"public_profile",@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Process error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        }else{
            [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, email,gender,last_name,first_name,birthday,age_range"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                if (!error) {
                    NSLog(@"result : %@",result);
                    FIRAuthCredential *credential = [FIRFacebookAuthProvider
                                                     credentialWithAccessToken:[FBSDKAccessToken currentAccessToken].tokenString];
                    [[FIRAuth auth] signInWithCredential:credential
                                              completion:^(FIRUser *user, NSError *error) {
                                                  if (error) {
                                                      NSLog(@"error : %@",error);
                                                      return;
                                                  }
                                                  NSLog(@"user : %@",user);
                                                  [_indicator stopAnimating];
                                                  RootViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"RootViewControllerID"];
                                                  [APPDELEGATE.window setRootViewController:controller];
                                              }];
                    
                }
            }];
        }
    }];
}

- (IBAction)connexion:(UIButton *)sender {
    LogInViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"LogInViewControllerID"];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)inscription:(UIButton *)sender {
    SignUpViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllerID"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)signoutgoogle:(id)sender{
    [[GIDSignIn sharedInstance] signOut];
}

- (IBAction)googleSignin:(id)sender {
    [[GIDSignIn sharedInstance] signIn];
}

- (IBAction)gotoGIF:(id)sender {
}


@end
