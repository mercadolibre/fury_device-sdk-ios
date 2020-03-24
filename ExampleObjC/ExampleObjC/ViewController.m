//
// ViewController.m
// test-app
//
// Created by Franco Cuevas on 1/21/20.
// Copyright © 2020 Franco Cuevas. All rights reserved.
//

@import MercadoPagoDevicesSDK;
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *text;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	NSDictionary *device = [[MercadoPagoDevicesSDK shared] getInfoAsDictionary];
	NSString *formattedString = [NSString stringWithFormat:@"%@", device];
	NSLog(@"%@", device);
	self.text.numberOfLines = 0;
	self.text.text = formattedString;
}

@end
