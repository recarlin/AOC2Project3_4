//
//  ViewController.h
//  Project3_4
//
//  Created by Russell Carlin on 10/10/12.
//  Copyright (c) 2012 Russell Carlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEventView.h"

@interface ViewController : UIViewController <EventDisplayerDelegate, UIAlertViewDelegate>
{
    IBOutlet UITextView *eventsDisplay;
    IBOutlet UILabel *rightSwipeLabel;
    UISwipeGestureRecognizer *rightSwipe;
    IBOutlet UIView *infoView;
    BOOL open;
}

-(IBAction)clickStuff:(id)sender;

@end
