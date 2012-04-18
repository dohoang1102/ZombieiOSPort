//
//  ViewController.h
//  ZombiesiOSPort
//
//  Created by robert curtis on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Zombie.h"

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    NSMutableArray *types;
    NSMutableArray *zombies;
    int pickerLocation;
}
@property (strong, nonatomic) IBOutlet UITextField *zombieName;
@property (strong, nonatomic) IBOutlet UITextField *numberOFBrainsEaten;
@property (strong, nonatomic) IBOutlet UIPickerView *typePicker;

- (IBAction)saveZombie:(id)sender;
- (IBAction)cencelZombie:(id)sender;
- (IBAction)showZombies:(id)sender;

@end
