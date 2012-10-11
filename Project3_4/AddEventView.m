//
//  AddEventView.m
//  Project3_4
//
//  Created by Russell Carlin on 10/10/12.
//  Copyright (c) 2012 Russell Carlin. All rights reserved.
//

#import "AddEventView.h"

@interface AddEventView ()

@end
@implementation AddEventView
@synthesize displayerDelegate, eventDetails, eventDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [datePicker setMinimumDate: [NSDate date]];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    switch (button.tag) {
        case 0:
        {
            [self dismissViewControllerAnimated:TRUE completion:nil];
            NSString *completeEventInfo = [NSString stringWithFormat:@"%@\n%@", eventDetails, eventDate];
            [displayerDelegate displayEvent:completeEventInfo];
        }
            break;
        case 1:
        {
            [eventTitleText resignFirstResponder];
            eventDetails = eventTitleText.text;
        }
            break;
        case 2:
        {
            
        }
            break;
        default:
        {
            
        }
            break;
    }
}

-(IBAction)dateChange:(id)sender
{
    eventDate = datePicker.date;
}
@end
