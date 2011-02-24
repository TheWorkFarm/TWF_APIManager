//
//  NetManager.h
//  Gemini
//
//  Created by Nick Lloyd on 11-02-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSSingleton.h"

@class ASINetworkQueue;

@interface ApiManager : NSSingleton {
    ASINetworkQueue		*networkQueue;
    NSString *_baseURL;
}

@property (nonatomic, retain) NSString *baseURL;
- (void) importSchedule;


+(ApiManager *) sharedApiManager;


@end
