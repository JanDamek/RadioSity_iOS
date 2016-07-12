//
//  comKontaktViewController.m
//  Radio Sity
//
//  Created by Jan Damek on 01.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//
@import GoogleMobileAds;

#import "comKontaktViewController.h"
#import <MessageUI/MFMessageComposeViewController.h>
#import "ServiceTools.h"

@interface comKontaktViewController ()
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end

@implementation comKontaktViewController

@synthesize bannerView = _bannerView;

-(id)init
{
    if (self = [super init]){
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [ServiceTools GADInitialization:_bannerView rootViewController:self];
}

-(IBAction)zavolej:(id)sender
{
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:421244641107"]];  
}

-(IBAction)SMS:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms:+421911111107"]];    
}

-(IBAction)email:(id)sender
{
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:studio@radiosity.sk"]]; 
}

- (IBAction)doBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
