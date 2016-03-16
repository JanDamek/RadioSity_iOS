//
//  comPlayerViewController.m
//  Radio Sity
//
//  Created by Jan Damek on 01.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import "comPlayerViewController.h"
#import "AppDelegate.h"
#import "comKontaktViewController.h"

@implementation comPlayerViewController

@synthesize skladba, playBtn, stopBtn, ani;

//-(NSString*)nameOfNib{
//    NSString *nibName = @"playerView";
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
//    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])
//        || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown
//        ){
//        ori = @"land";
//    }
//    
//    return [nibName stringByAppendingFormat:@"%@-%@%@",i5,ori,iPad];
//}


-(void)inicializace{
    AppDelegate *d = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    d.player.delegate = self;
    
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged) name:UIDeviceOrientationDidChangeNotification object:nil];
//    nib = [self nameOfNib];
    //[self prehodNib];
}

- (void)viewDidLoad
{
//    nib = [self nameOfNib];
//    [self prehodNib];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self testbtn];
    
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
//    nib = [self nameOfNib];
//    NSLog(@"%@",nib);
//    [self testbtn];
////    [self performSelectorInBackground:@selector(prehodNib) withObject:nil];
//    [self performSelector:@selector(prehodNib) withObject:nil afterDelay:0.2];
//}
//-(void)prehodNib{
//    [[NSBundle mainBundle] loadNibNamed:nib owner:self options:nil];
//}

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

//-(void)kontakt:(id)sender
//{
//    comKontaktViewController *k = [[comKontaktViewController alloc] initWithNibName:[comKontaktViewController nameOfNib] bundle:nil];
//    [self.navigationController pushViewController:k animated:YES];
//}

//-(void)facebook:(id)sender{
//    //zobrazeni facebook, napojeni primo na facebook
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/pages/KLUB-SiTy/216819576468"]];
//}

//-(void)web:(id)sender{
//    //zobrazeni web page, zobrazeni webove stranky primo v prohlizeci
//     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.radiosity.sk"]];
//}

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
