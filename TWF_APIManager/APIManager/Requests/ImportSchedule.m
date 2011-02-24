//
//  ImportSchedule.m
//
//  Created by Nick Lloyd on 11-02-22.
//  Copyright 2011 The Work Farm Ltd. All rights reserved.
//  http://stackoverflow.com/questions/4810289/best-architecture-for-an-ios-application-that-makes-many-network-requests

#import "ImportSchedule.h"
#import "APIRequestSignature.h"

@implementation ImportSchedule
-(void)dealloc{    
	[super dealloc];	
}

-(id)init{
	id _self_ = [super init];
	
	if (_self_ != nil) {
		self = _self_;      
        
        [self setDelegate:self];             
        
        APIRequestSignature *signRequest = [[[APIRequestSignature alloc] init] autorelease];
        [self addRequestHeader:@"api_key"	value:[signRequest apiKey]];
        [self addRequestHeader:@"sig"		value:[signRequest signature]];         
        
	}	
	return (_self_);
}

- (void)requestFinished:(ASIHTTPRequest *)req{
    // Use when fetching text data
    NSString *responseString = [req responseString];
    NSLog(@"status: request finished: %@", responseString);  
    
    [[NSNotificationCenter defaultCenter] 
        postNotificationName:@"importComplete" object:nil userInfo:nil];
}

-(void) requestStarted:(ASIHTTPRequest *)request{
    NSLog(@"status: request started");
}

@end
