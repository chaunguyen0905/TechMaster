//
//  PrintZigZag.m
//  TechMaster
//
//  Created by TaiND on 11/13/15.
//  Copyright (c) 2015 ChauNguyen. All rights reserved.
//

#import "PrintZigZag.h"

@interface PrintZigZag ()

@end

@implementation PrintZigZag

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int height = 7;
    int width = 40;
    int space = (height - 1)*2;
    
    for(int i = 1; i <= height; i++){
        for(int s = height; s <= width; s = s+space){
            
            int count = s+space-height + 1;
            if(width+1-s<space)
                count = width+1;
            
            for(int j = s+1-height; j < count; j++){
                if(j == s-i+1 || j == s+i-1)
                    [self write:@"+"];
                else
                    [self write:@" "];
            }
        }
        [self writeln:@""];
    }
}

@end
