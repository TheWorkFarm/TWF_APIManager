//
//  TWF_APIManagerAppDelegate.h
//  TWF_APIManager
//
//  Created by Nick Lloyd on 11-02-24.
//  Copyright 2011 The Work Farm Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWF_APIManagerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
