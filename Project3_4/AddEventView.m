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
@synthesize displayerDelegate;

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
    
//Date formatter.
    
    formattedDate = [[NSDateFormatter alloc]init];
    [formattedDate setDateStyle:NSDateFormatterLongStyle];
    [formattedDate setTimeStyle:NSDateFormatterShortStyle];
    [datePicker setMinimumDate: [NSDate date]];
    
//Swipe recongnizer.
    
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [leftSwipeLabel addGestureRecognizer:leftSwipe];
    
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
            
//If you click the Keyboard button, it will remove the keyboard and save the text to a variable for later.
            
        case 1:
        {
            [eventTitleText resignFirstResponder];
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
            break;
    }
}

//I fixed my save so there are no variables changed all the time. Now, nothing is saved or logged until you give the swipe gesture. Then, it takes the date, and formats it, from the picker and grabs the eventTitleText text. Lastly, it builds the new event text and sends it to the main view.

-(void)swipeLeft:(UISwipeGestureRecognizer*)recognizer
{
    if ([eventTitleText.text isEqualToString:@""]) {
        UIAlertView *noTitleError = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"You need a title for your event." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [noTitleError show];
    } else {
        [self dismissViewControllerAnimated:TRUE completion:nil];
        NSString *completeEventInfo = [NSString stringWithFormat:@"%@\n%@", eventTitleText.text, [formattedDate stringFromDate:datePicker.date]];
        [displayerDelegate displayEvent:completeEventInfo];
    }
}
@end
