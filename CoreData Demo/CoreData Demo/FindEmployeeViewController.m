//
//  FindEmployeeViewController.m
//  CoreData Demo
//
//  Created by Suniket Wagh on 05/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "FindEmployeeViewController.h"
#import "AppDelegate.h"


@interface FindEmployeeViewController ()

@end

@implementation FindEmployeeViewController

@synthesize employeeIdTextField, textLabel, statusLabel;

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
    [super viewDidLoad];

    self.title = @"Find Employee";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([self.employeeIdTextField.text length]==0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter Employee Id" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else{
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Employee"
                                                      inManagedObjectContext:context];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDesc];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(employeeID = %@)",
                             self.employeeIdTextField.text];
        [request setPredicate:pred];
        NSManagedObject *matches = nil;
        NSError *error;
        NSArray *objects = [context executeFetchRequest:request error:&error];
        if ([objects count] == 0) {
            statusLabel.text = @"No matches";
        } else {
            matches = [objects objectAtIndex:0];
            self.textLabel.text = [NSString stringWithFormat:@"The Employee Name = %@ and Phone No = %@", [matches valueForKey:@"employeeName"], [matches valueForKey:@"phoneNo"]];
            self.statusLabel.text = [NSString stringWithFormat:
                                @"%d matches found", [objects count]];
        }
        
    }
    [textField resignFirstResponder];
    return YES;
}
@end
