//
//  comKontaktViewController.h
//  Radio Sity
//
//  Created by Jan Damek on 01.03.13.
//  Copyright (c) 2013 DigitalScope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>


@interface comKontaktViewController : UIViewController {
    BOOL isShowingLandscapeView;
}

+(NSString*)nameOfNib;

-(IBAction)zpet:(id)sender;
-(IBAction)zavolej:(id)sender;
-(IBAction)SMS:(id)sender;
-(IBAction)email:(id)sender;

@end
