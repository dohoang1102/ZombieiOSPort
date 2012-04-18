//
//  ViewController.m
//  ZombiesiOSPort
//
//  Created by robert curtis on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(void)terminalDump;
-(void)resetUIElements;

@end

@implementation ViewController
@synthesize zombieName;
@synthesize numberOFBrainsEaten;
@synthesize typePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
    types = [[NSMutableArray alloc] initWithObjects:@"Scary", @"Bloody", @"Decaying", @"Smiling", nil];
    typePicker.delegate = self;
    typePicker.showsSelectionIndicator = YES;
    
    zombies = [[NSMutableArray alloc] init];
    
    //hackery to get the return key to hide the keyboard
    zombieName.returnKeyType = UIReturnKeyDone;
    zombieName.delegate = self;
    numberOFBrainsEaten.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    numberOFBrainsEaten.returnKeyType = UIReturnKeyDone;
    numberOFBrainsEaten.delegate = self;
}

#pragma mark Picker View/Data Delegate Code

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    pickerLocation = row;
    NSLog(@"Pickerlocation = %d", pickerLocation);
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [types count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [types objectAtIndex:row];
}


#pragma mark unload

- (void)viewDidUnload
{
    [self setZombieName:nil];
    [self setNumberOFBrainsEaten:nil];
    [self setTypePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark Button Code

- (IBAction)saveZombie:(id)sender 
{
    Zombie *newZombie = [[Zombie alloc] init];
    newZombie.name = [zombieName text];
    
    //This line of code almost made me throw up
    newZombie.numberOfBrainsEaten = [NSNumber numberWithInt:[numberOFBrainsEaten.text intValue]];
        
    newZombie.type = [types objectAtIndex:pickerLocation];
    [zombies addObject:newZombie];
    NSLog(@"Zombie added with information: %@", newZombie);
}

- (IBAction)cencelZombie:(id)sender 
{
    
}



#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    [textField resignFirstResponder];
}


#pragma mark Other

-(void)terminalDump
{
    for(Zombie *z in zombies)
    {
        NSLog(@"%@\n", z);
    }
}

-(void)resetUIElements
{
    self.zombieName.text = @"";
    self.numberOFBrainsEaten.text = @"";
    [self 
}

- (IBAction)showZombies:(id)sender 
{
    [self terminalDump];
}















@end
