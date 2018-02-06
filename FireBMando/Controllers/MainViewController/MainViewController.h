//
//  MainViewController.h
//  FireBMando
//
//  Created by Mint IT on 23/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#define APPDELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
@interface MainViewController : UIViewController
{
    UITapGestureRecognizer *tapGesture;
}
- (void) AddOrganizerTapToCloseKeyboard;
- (void)AddObservers;
@property IBOutlet NSLayoutConstraint *keyBoardConstraint;
@end
