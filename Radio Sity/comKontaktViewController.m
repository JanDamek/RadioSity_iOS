//
//  comKontaktViewController.m
//  Radio Sity
//
//  Created by Jan Damek on 01.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "comKontaktViewController.h"
#import <MessageUI/MFMessageComposeViewController.h>

@interface comKontaktViewController ()

@end

@implementation comKontaktViewController

//+(NSString*)nameOfNib{
//    NSString *nib = @"kontaktView";
//    NSString *i5 = @"";
//    NSString *iPad = @"";
//    NSString *ori = @"port";
//    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
//        if ([UIScreen mainScreen].bounds.size.height == 568.0) {
//            i5 = @"5";
//        }
//    }else{
//        iPad = @"-iPad";
//    }
//    
//    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])){
//        ori = @"land";
//    }
//    
//    return [nib stringByAppendingFormat:@"%@-%@%@",i5,ori,iPad];
//}

-(void)inicializace{
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged) name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(id)init
{
    if (self = [super init]){
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.canDisplayBannerAds = true;
}

-(void)viewDidAppear:(BOOL)animated{
    [self inicializace];
    [super viewDidAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)orientationChanged {
//    NSString *nib = [comKontaktViewController nameOfNib];
//    NSLog(@"%@",nib);
//    [[NSBundle mainBundle] loadNibNamed:nib owner:self options:nil];
//}

//-(void)zpet:(id)sender
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

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
