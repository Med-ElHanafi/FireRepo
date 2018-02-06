//
//  MainViewController.m
//  FireBMando
//
//  Created by Mint IT on 23/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (void) AddOrganizerTapToCloseKeyboard{
    if(tapGesture != nil){
        [self RemoveOrganizerTapToCloseKeyboard];
    }
    tapGesture = [[UITapGestureRecognizer alloc]
                  initWithTarget:self
                  action:@selector(TapOnScreen:)];
    // tapGesture.delegate=self;
    // outside textfields
    [self.view addGestureRecognizer:tapGesture];
}
- (void) RemoveOrganizerTapToCloseKeyboard{
    [self.view removeGestureRecognizer:tapGesture];
}
// dismiss keyboard when tap outside text fields
- (void)TapOnScreen:(UITapGestureRecognizer *)sender {
    [self.view endEditing:true];
}
- (void)AddObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyBoardWillShow:(NSNotification*)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    
    self.keyBoardConstraint.constant = keyboardFrameBeginRect.size.height;
    [self.view setNeedsUpdateConstraints];
}
- (void)keyBoardWillHide:(NSNotification*)notification
{
    [self.view layoutIfNeeded];
    self.keyBoardConstraint.constant = 0;
    [UIView animateWithDuration:5
                     animations:^{
                         [self.view setNeedsUpdateConstraints];
                         
                     } completion:^(BOOL finished){
                     }];
}
@end
