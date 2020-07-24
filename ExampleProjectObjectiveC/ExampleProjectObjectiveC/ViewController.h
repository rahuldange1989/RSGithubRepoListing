//
//  ViewController.h
//  ExampleProjectObjectiveC
//
//  Created by Rahul Dange on 24/07/20.
//  Copyright © 2020 Rahul Dange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UILabel *reposLabel;

- (IBAction)submitBtnClicked:(id)sender;

@end

