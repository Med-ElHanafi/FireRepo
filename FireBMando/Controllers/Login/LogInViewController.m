//
//  LogInViewController.m
//  FireBMando
//
//  Created by Mint IT on 24/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _indicator.hidden=YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logIn:(id)sender {
    _indicator.hidden=NO;
    [_indicator startAnimating];
    if (_emailField.text.length<6) {
        _indicator.hidden=YES;
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Email" message:@"email>2" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }else if (_passField.text.length<6){
        _indicator.hidden=YES;
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Email" message:@"email>2" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [[FIRAuth auth]signInWithEmail:_emailField.text password:_passField.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
            
            if (user) {
                RootViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"RootViewControllerID"];
                [APPDELEGATE.window setRootViewController:controller];
            }
        }];
    }
}
- (IBAction)goBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
