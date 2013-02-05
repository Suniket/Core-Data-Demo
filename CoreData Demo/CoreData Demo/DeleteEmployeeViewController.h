//
//  DeleteEmployeeViewController.h
//  CoreData Demo
//
//  Created by Suniket Wagh on 05/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeleteEmployeeViewController : UIViewController <UITextFieldDelegate>
{

}

@property  (nonatomic, strong) IBOutlet UITextField *employeeIdTextField;

@property (nonatomic, strong) IBOutlet UILabel *statusLabel;
- (IBAction)deleteEmployee:(id)sender;

@end
