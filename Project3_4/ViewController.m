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
    //Sets the default text on the events list.
    
    eventsDisplay.text = @"Events will be displayed here.";
    
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

-(IBAction)clickSave:(UIButton*)button
{
    switch (button.tag) {
        case 0:
        {

        }
            break;
        case 1:
        {
            
//Just an Info button that opens an alert for my name and course.
            
            UIAlertView *showAppInfo = [[UIAlertView alloc]initWithTitle:@"Information" message:@"Created by: Russell Carlin\nCourse: AOC2 - 1210" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [showAppInfo show];
        }
            
        default:
        {
            
        }
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

-(void)swipeRight:(UISwipeGestureRecognizer*)recognizer
{
//Opens the AddEventView and sets the delegate so the main view can pick up the information.
    AddEventView *addEvent = [[AddEventView alloc]initWithNibName:@"AddEventView" bundle:nil];
    addEvent.displayerDelegate = self;
    [self presentViewController:addEvent animated:TRUE completion:nil];
}
@end
