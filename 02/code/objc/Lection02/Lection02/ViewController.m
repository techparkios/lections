//
//  ViewController.m
//  Lection02
//
//  Created by d.taraev on 16.03.17.
//  Copyright © 2017 mail.ru. All rights reserved.
//

#import "ViewController.h"
#import "Greeting.h"
#import "XIBViewController.h"
#import "HelloViewController.h"

static NSString * const segueName = @"Segue1";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ageStepper;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (weak, nonatomic) IBOutlet UISwitch *enabledSwitch;
@property (weak, nonatomic) IBOutlet UIView *extendedView;

@property (strong, nonatomic) Greeting *greeting;
@property (strong, nonatomic) NSString *name;

@end

@implementation ViewController

- (void)setGreeting:(Greeting *)greeting {
    
    _greeting = greeting;
    self.helloLabel.text = [greeting greeting];
}

- (NSString *)name {
    
    NSString *text = self.nameField.text ? self.nameField.text : @"";
    return text.length > 0 ? text : @"Анон";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.greeting = [[Greeting alloc] init];
}

- (IBAction)helloButtonPressed:(id)sender {
    
    [self performSegueWithIdentifier:segueName sender:nil];
}

- (IBAction)valueChanged:(id)sender {
    
    Gender gender = self.genderSegment.selectedSegmentIndex;
    NSInteger age = self.ageStepper.value ? self.ageStepper.value : 0;
    
    self.ageLabel.text = [NSString stringWithFormat:@"Лет: %ld", (long)age];
    self.greeting = [[Greeting alloc] initWithName:self.name gender:gender age:age];
}

- (IBAction)extendedEnabledChanged:(UISwitch *)sender {
    
    BOOL isEnabled = sender.isOn;
    self.extendedView.hidden = !isEnabled;
}

- (IBAction)alphaSliderChanged:(UISlider *)sender {
    
    self.enabledSwitch.alpha = sender.value;
}

- (IBAction)showXIBPressed:(id)sender {
    XIBViewController *viewController = [[XIBViewController alloc] initWithNibName:@"XIBViewController" bundle:nil];;
    
    viewController.test = @"test";
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:segueName]) {
        
        HelloViewController *viewController = (HelloViewController *)segue.destinationViewController;
        viewController.name = self.name;
    }
}

@end
