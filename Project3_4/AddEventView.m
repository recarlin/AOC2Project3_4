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
    formattedDate = [[NSDateFormatter alloc]init];
    [formattedDate setDateStyle:NSDateFormatterLongStyle];
    [formattedDate setTimeStyle:NSDateFormatterShortStyle];
    [datePicker setMinimumDate: [NSDate date]];
    eventDate = [NSDate date];
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
            
//If the Save button is pressed, it checks to see if there is a title for the event. If there isn't, you get an error alert saying you need a title, and if there is, it will go back to the main view and add the event.

        case 0:
        {
            if ([eventTitleText.text isEqualToString:@""]) {
                UIAlertView *noTitleError = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"You need a title for your event." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [noTitleError show];
            } else {
                [self dismissViewControllerAnimated:TRUE completion:nil];
                NSString *completeEventInfo = [NSString stringWithFormat:@"%@\n%@", eventDetails, [formattedDate stringFromDate:eventDate]];
                [displayerDelegate displayEvent:completeEventInfo];
            }
        }
            break;
            
//If you click the Keyboard button, it will remove the keyboard and save the text to a variable for later.
            
        case 1:
        {
            [eventTitleText resignFirstResponder];
            eventDetails = eventTitleText.text;
        }
            break;
            
//Just an Info button that opens an alert for my name and course.
            
        case 2:
        {
            UIAlertView *showAppInfo = [[UIAlertView alloc]initWithTitle:@"Information" message:@"Created by: Russell Carlin\nCourse: AOC2 - 1210" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [showAppInfo show];
        }
            break;
        default:
        {
            
        }
            break;
    }
}

//This watches for changes in the UIDatePicker, and saves it to a variable for later.

-(IBAction)dateChange:(id)sender
{
    eventDate = datePicker.date;
}
@end
