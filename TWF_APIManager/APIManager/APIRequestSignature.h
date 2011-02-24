//
//  APIRequestSignature.h
//
//  Created by Nick Lloyd on 11-02-03.
//  Copyright 2011 The Work Farm Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MD5String;

@interface APIRequestSignature : NSObject {
	NSString *_apiKey;
	NSString *_apiSecret;
}

@property(nonatomic, retain) NSString *apiKey;
@property(nonatomic, retain) NSString *apiSecret;

- (NSString*) signature;
- (NSString*) key;
- (id)init;
@end
