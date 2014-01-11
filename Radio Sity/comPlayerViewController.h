//
//  comPlayerViewController.h
//  Radio Sity
//
//  Created by Jan Damek on 01.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "comPlayer.h"

@interface comPlayerViewController : UIViewController <comPlayerDelegate> {
    BOOL isShowingLandscapeView;
    NSString *nib;
}

@property (retain, nonatomic) IBOutlet UILabel *skladba;
@property (retain, nonatomic) IBOutlet UIButton *playBtn;
@property (retain, nonatomic) IBOutlet UIButton *stopBtn;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *ani;

-(IBAction)play:(id)sender;
-(IBAction)kontakt:(id)sender;
-(IBAction)facebook:(id)sender;
-(IBAction)web:(id)sender;

@end
