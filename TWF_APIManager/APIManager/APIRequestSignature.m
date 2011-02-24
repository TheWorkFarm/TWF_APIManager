//
//  APIRequestSignature.m
//
//  Created by Nick Lloyd on 11-02-03.
//  Copyright 2011 The Work Farm Ltd. All rights reserved.
//

#import "APIRequestSignature.h"
#import "MD5String.h"

@implementation APIRequestSignature
@synthesize apiKey = _apiKey, apiSecret = _apiSecret;

- (void)dealloc {
	[_apiKey release];
	[_apiSecret release];
	
    [super dealloc];
}

-(id)init{
    
    id _self = [super init];
    
    if (_self != nil) {
        self = _self;        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];              
        _apiKey = [prefs stringForKey:@"apiKey"];
		_apiSecret = [prefs stringForKey:@"apiSecret"];
    }
    
    return (_self);

}

- (NSString*) signature{		
	NSString *sig = [MD5String md5:[NSString stringWithFormat:@"%@%@", _apiSecret, _apiKey]];
	return sig;	
}

- (NSString*) key{	
	return _apiKey;
}

@end
