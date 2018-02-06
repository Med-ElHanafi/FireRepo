//
//  MHWebService.h
//  FireBMando
//
//  Created by Mint IT on 25/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHWebService : NSObject
-(void)getRequest:(NSString*)url parameters:(NSDictionary*)params
         response:(void (^)(id response, id error))success;
@end
