//
//  AddEventView.h
//  Project3_4
//
//  Created by Russell Carlin on 10/10/12.
//  Copyright (c) 2012 Russell Carlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EventDisplayerDelegate <NSObject>

@required
-(void)displayEvent:(NSString*)info;

@end

@interface AddEventView : UIViewController
{
    id<EventDisplayerDelegate> displayerDelegate;
    IBOutlet UITextView *eventTitleText;
    IBOutlet UIDatePicker *datePicker;
    NSDateFormatter *formattedDate;
    IBOutlet UILabel *leftSwipeLabel;
    UISwipeGestureRecognizer *leftSwipe;
}

@property (strong) id<EventDisplayerDelegate> displayerDelegate;

-(IBAction)onClick:(id)sender;

@end

