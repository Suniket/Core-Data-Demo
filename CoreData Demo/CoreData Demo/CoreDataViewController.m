//
//  CoreDataViewController.m
//  CoreData Demo
//
//  Created by Suniket Wagh on 05/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "CoreDataViewController.h"
#import "AddEmployeeViewController.h"
#import "FindEmployeeViewController.h"
#import "DeleteEmployeeViewController.h"

@interface CoreDataViewController ()

@end

@implementation CoreDataViewController

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

- (IBAction)addEmployee:(id)sender {
    
    AddEmployeeViewController *addEmployeeViewController = [[AddEmployeeViewController alloc] init];
    [self.navigationController pushViewController:addEmployeeViewController animated:YES];
}

- (IBAction)findEmployee:(id)sender {
    
    FindEmployeeViewController *findEmployeeViewController = [[FindEmployeeViewController alloc] init];
    [self.navigationController pushViewController:findEmployeeViewController animated:YES];

}

- (IBAction)deleteEmployee:(id)sender {
    
    DeleteEmployeeViewController *deleteEmployeeViewController = [[DeleteEmployeeViewController alloc] init];
    [self.navigationController pushViewController:deleteEmployeeViewController animated:YES];

}


@end
