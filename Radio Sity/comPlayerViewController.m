//
//  comPlayerViewController.m
//  Radio Sity
//
//  Created by Jan Damek on 01.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

@import GoogleMobileAds;

#import "comPlayerViewController.h"
#import "AppDelegate.h"
#import "comKontaktViewController.h"
#import "ServiceTools.h"

@interface comPlayerViewController ()

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end

@implementation comPlayerViewController

@synthesize skladba, playBtn, stopBtn, ani, bannerView = _bannerView;

-(void)inicializace{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.player.delegate = self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self testbtn];
    
    [ServiceTools GADInitialization:_bannerView rootViewController:self];
}

-(void)viewDidAppear:(BOOL)animated{
    [self inicializace];
    [super viewDidAppear:animated];
}

-(void)play:(id)sender
{
    [ani setHidden:NO];
    [ani startAnimating];
    [skladba setHidden:YES];

    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.player.delegate = self;
    
    if (d.player.rate==0){
        [d.player play];
    }else{
        [d.player stop];
    }
}

-(void)stopInteruptPlaying:(comPlayer *)player{
    [ani setHidden:YES];
    [ani stopAnimating];
}

-(void)startInteruptPlaying:(comPlayer *)player{
    [ani setHidden:NO];
    [ani startAnimating];    
}

-(void)preparePlay:(comPlayer *)player{
    [self testbtn];
    [ani setHidden:NO];
    [ani startAnimating];
}

-(void)startPlaying:(comPlayer *)player{
    [self testbtn];
    [skladba setHidden:NO];
}

-(void)stopPlaying:(comPlayer *)player{
    [self testbtn];
}

-(void)metaData:(comPlayer *)player meta:(NSString *)meta{
    skladba.text = meta;
}

-(void)testbtn
{
    [ani stopAnimating];
    [ani setHidden:YES];
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    if (d.player.rate!=0.0){
        if (!playBtn.hidden){
            [playBtn setHidden:YES];
            [stopBtn setHidden:NO];
        }
    }else{
        if (playBtn.hidden){
            [playBtn setHidden:NO];
            [stopBtn setHidden:YES];
        }
    }
}

@end
