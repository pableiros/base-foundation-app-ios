//
//  SceneDelegate.m
//  ListObjC
//
//  Created by pablo borquez on 26/08/23.
//

#import "SceneDelegate.h"
#import "TableViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.windowScene = (UIWindowScene *)scene;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[TableViewController alloc] init]];
    [self.window makeKeyAndVisible];
}

@end
