//
//  ApiManager.m
//
//  Created by Nick Lloyd on 11-02-22.
//  Copyright 2011 The Work Farm Ltd. All rights reserved.
//

#import "ApiManager.h"
#import "ASINetworkQueue.h"


#import "ImportSchedule.h"

@implementation ApiManager

@synthesize baseURL = _baseURL;

-(void)dealloc{	
    [_baseURL release];
	[super dealloc];
	
}

-(id)init
{
	id _self_ = [super init];
	
	if (_self_ != nil) {
		self = _self_;	
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];              
        _baseURL = [prefs stringForKey:@"baseURL"];
        
        networkQueue = [ASINetworkQueue queue];
        [networkQueue setDelegate: self];
	}	
	return (_self_);
}

-(void) importSchedule{   
    // this is just here as a reminder
    // 
    
    ImportSchedule *request = [ImportSchedule requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/import", _baseURL]]];    
    [networkQueue addOperation:request];		
	[networkQueue go];    
}


//requestDidStartSelector

+(ApiManager *) sharedApiManager{
    	return (ApiManager *)[super sharedInstance];
}

@end
