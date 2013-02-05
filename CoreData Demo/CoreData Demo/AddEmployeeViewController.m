//
//  AddEmployeeViewController.m
//  CoreData Demo
//
//  Created by Suniket Wagh on 05/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "AppDelegate.h"


@interface AddEmployeeViewController ()

@end

@implementation AddEmployeeViewController

@synthesize statusLabel, employeeIdTextField, employeeNameTextField, employeePhoneTextField;

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
    
    self.title = @"Add Employee";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addAEmployee:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addAEmployee:(id)sender {
    
    if([self.employeeIdTextField.text length] ==0)
    {
        [self.employeeIdTextField resignFirstResponder];
        [self showAlert:@"" Message:@"Please enter Employee Id"];
    }
    else if([self.employeeNameTextField.text length] ==0)
    {
        [self.employeeNameTextField resignFirstResponder];
        [self showAlert:@"" Message:@"Please enter Employee name"];
    }
    else if([self.employeePhoneTextField.text length] ==0)
    {
        [self.employeePhoneTextField resignFirstResponder];
        [self showAlert:@"" Message:@"Please enter Employee Phone Number"];
    }
    else{
        [self.employeeIdTextField resignFirstResponder];
        [self.employeeNameTextField resignFirstResponder];
        [self.employeePhoneTextField resignFirstResponder];
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSManagedObject *newContact;
        newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
        [newContact setValue:self.employeeIdTextField.text forKey:@"employeeID"];
        [newContact setValue:self.employeeNameTextField.text forKey:@"employeeName"];
        [newContact setValue:self.employeePhoneTextField.text forKey:@"phoneNo"];
        self.employeeIdTextField.text = @"";
        self.employeeNameTextField.text = @"";
        self.employeePhoneTextField.text = @"";
        NSError *error;
        [context save:&error];
        statusLabel.text = @"Contact saved";
    }

}

-(void) showAlert :(NSString*)title Message:(NSString*)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
