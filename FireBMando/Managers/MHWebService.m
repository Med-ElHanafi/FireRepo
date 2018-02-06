//
//  MHWebService.m
//  FireBMando
//
//  Created by Mint IT on 25/01/2018.
//  Copyright © 2018 Mint IT. All rights reserved.
//

#import "MHWebService.h"

@implementation MHWebService
-(void)getRequest:(NSString*)url parameters:(NSDictionary*)params
         response:(void (^)(id response, id error))success
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        success(nil,error);
    }];
}
@end
