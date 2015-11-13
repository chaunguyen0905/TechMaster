//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------

    NSDictionary* main = @{SECTION: @"MainVC", MENU: @[
                                     @{TITLE: @"IWeather", CLASS: @"IWeather"},
                                      @{TITLE: @"IAmRich", CLASS: @"IAmRich"},
                                     @{TITLE: @"PrintZigZag", CLASS: @"PrintZigZag"},
                                     @{TITLE: @"RunningLED", CLASS: @"RunningLED"}
                                     ]};
    
    mainScreen.menu = @[main];
    mainScreen.title = @"chaunguyen";
    mainScreen.about = @"This is code from fss.com.vn";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    window.rootViewController = nav;
}
@end
