//
//  DeleteEmployeeViewController.m
//  CoreData Demo
//
//  Created by Suniket Wagh on 05/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "DeleteEmployeeViewController.h"
#import "AppDelegate.h"


@interface DeleteEmployeeViewController ()

@end

@implementation DeleteEmployeeViewController
@synthesize statusLabel,employeeIdTextField;

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
    // Do any additional setup after loading the view from its nib.
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
        
            }
    [textField resignFirstResponder];
    return YES;

}




- (IBAction)deleteEmployee:(id)sender {
    
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
        
        for (matches in objects) {
            [context deleteObject:matches];
        }
        
        self.statusLabel.text = [NSString stringWithFormat:
                                 @"%d Employee Record Deleted", [objects count]];
    }

}
@end
