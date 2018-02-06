//
//  Item.h
//  FireBMando
//
//  Created by Mint IT on 24/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Item : JSONModel
@property (nonatomic,strong) NSString* constructor;
@property (nonatomic,strong) NSString* image;
@property (nonatomic,strong) NSDictionary* location;
@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSDictionary* price;
@end
