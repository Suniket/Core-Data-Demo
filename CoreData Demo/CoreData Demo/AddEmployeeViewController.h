//
//  AddEmployeeViewController.h
//  CoreData Demo
//
//  Created by Suniket Wagh on 05/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEmployeeViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate>
{

}
@property (nonatomic, strong) IBOutlet UITextField *employeeIdTextField;
@property (nonatomic, strong) IBOutlet UILabel *statusLabel;

@property(nonatomic, strong) IBOutlet UITextField *employeeNameTextField;
@property(nonatomic, strong) IBOutlet UITextField *employeePhoneTextField;
- (IBAction)addAEmployee:(id)sender;

-(void) showAlert :(NSString*)title Message:(NSString*)msg;
@end
