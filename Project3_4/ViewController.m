//
//  ViewController.m
//  Project3_4
//
//  Created by Russell Carlin on 10/10/12.
//  Copyright (c) 2012 Russell Carlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
   
//Loads any saved events; if there are none, it displays the default text.
    
    NSUserDefaults *savedEvents = [NSUserDefaults standardUserDefaults];
    if ([savedEvents objectForKey:@"Events"] != nil){
        eventsDisplay.text = [savedEvents objectForKey:@"Events"];
    } else {
        eventsDisplay.text = @"Events will be displayed here.";
    }
    
//Swipe recognizer.

    rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [rightSwipeLabel addGestureRecognizer:rightSwipe];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickStuff:(UIButton*)button
{
    switch (button.tag) {
        case 0:
        {
    
//Saves the text in eventsDisplay to NSUserDefaults and displays an alert to show that something happened.
            
            NSUserDefaults *savedEvents = [NSUserDefaults standardUserDefaults];
            [savedEvents setObject:eventsDisplay.text forKey:@"Events"];
            [savedEvents synchronize];
            
            UIAlertView *savedAlert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Your events were saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [savedAlert show];
        }
            break;
        case 1:
        {
            
//Just an Info button that opens an alert for my name and course.
            
            UIAlertView *showAppInfo = [[UIAlertView alloc]initWithTitle:@"Information" message:@"Created by: Russell Carlin\nCourse: AOC2 - 1210" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [showAppInfo show];
        }
            
        case 2:
        {
            
//Displays a confirmation asking if you want to clear all events or not.
            
            UIAlertView *clearConfirm = [[UIAlertView alloc]initWithTitle:@"Confirm" message:@"Do you want to clear all saved events?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles: @"No", nil];
            [clearConfirm show];
        }
            break;
            
        default:
            break;
    }
    
}

//Setting the alert view delegate to self runs this method, checknig if you pressed Yes or No. If you hit Yes, then it clears the saved events and sets the eventsDisplay to default.

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            NSUserDefaults *savedEvents = [NSUserDefaults standardUserDefaults];
            [savedEvents removeObjectForKey:@"Events"];
            [savedEvents synchronize];
            eventsDisplay.text = @"Events will be displayed here.";
            
        }
            break;
        case 1:
            break;
            
        default:
            break;
    }
}

//Checks if the eventsDisplay UITextView has the default text on it still. If it does, it removes it and places the new event info there. If it doesn't have the default text (meaning there are events in there), then it appends two new lines and the new event info.

-(void)displayEvent:(NSString*)info
{
    if([eventsDisplay.text isEqualToString:@"Events will be displayed here."]){
        eventsDisplay.text = info;
    } else if (eventsDisplay.text != @""){
        NSString *addLines = [NSString stringWithFormat:@"\n\n%@", info];
        eventsDisplay.text = [eventsDisplay.text stringByAppendingString:addLines];
    }
}

//Opens the AddEventView and sets the delegate so the main view can pick up the information.

-(void)swipeRight:(UISwipeGestureRecognizer*)recognizer
{
    AddEventView *addEvent = [[AddEventView alloc]initWithNibName:@"AddEventView" bundle:nil];
    addEvent.displayerDelegate = self;
    [self presentViewController:addEvent animated:TRUE completion:nil];
}
@end
