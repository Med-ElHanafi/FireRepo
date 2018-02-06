//
//  AppDelegate.h
//  FireBMando
//
//  Created by Mint IT on 23/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@import GoogleSignIn;
@interface AppDelegate : UIResponder <UIApplicationDelegate,GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

