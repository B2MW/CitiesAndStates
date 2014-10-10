//
//  DetailViewController.m
//  CitiesAndStates
//
//  Created by Bradley Walker on 10/10/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *cityNameStoredValue;
@property (strong, nonatomic) IBOutlet UILabel *cityStateStoredValue;
@property (strong, nonatomic) IBOutlet UILabel *cityStateAbbreviationStoredValue;
@property (strong, nonatomic) IBOutlet UITextField *cityNameEditValue;
@property (strong, nonatomic) IBOutlet UITextField *stateNameEditValue;
@property (strong, nonatomic) IBOutlet UITextField *stateAbbrEditValue;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property BOOL editStatus;
@property (strong, nonatomic) IBOutlet UIImageView *cityImage;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.editStatus = YES;
    self.cityNameStoredValue.text = self.city.cityName;
    self.cityStateStoredValue.text = self.city.stateName;
    self.cityStateAbbreviationStoredValue.text = self.city.stateAbbreviation;

    self.cityNameEditValue.text = self.city.cityName;
    self.stateNameEditValue.text= self.city.stateName;
    self.stateAbbrEditValue.text = self.city.stateAbbreviation;

    self.cityNameEditValue.hidden = YES;
    self.stateNameEditValue.hidden = YES;
    self.stateAbbrEditValue.hidden = YES;

    self.cityImage.image = self.city.cityImage;
}

- (IBAction)onEditButtonPressed:(id)sender
{
    if (self.editStatus == YES) {
        self.editStatus = NO;
        self.editButton.selected = YES;
        [self.editButton setTitle:@"Done" forState:UIControlStateSelected];
        [self flipEditFieldsOn];
    }
    else if (self.editStatus == NO)
    {
        self.editStatus = YES;
        self.editButton.selected = NO;
        [self.editButton setTitle:@"Edit" forState:UIControlStateNormal];
        [self flipEditFieldsOff];
    }
}

- (void) flipEditFieldsOn
{
    self.cityNameEditValue.hidden = NO;
    self.stateNameEditValue.hidden = NO;
    self.stateAbbrEditValue.hidden = NO;
    self.cityNameStoredValue.hidden = YES;
    self.cityStateStoredValue.hidden = YES;
    self.cityStateAbbreviationStoredValue.hidden = YES;
}

- (void) flipEditFieldsOff
{
    self.cityNameEditValue.hidden = YES;
    self.stateNameEditValue.hidden = YES;
    self.stateAbbrEditValue.hidden = YES;
    self.cityNameStoredValue.hidden = NO;
    self.cityStateStoredValue.hidden = NO;
    self.cityStateAbbreviationStoredValue.hidden = NO;
    self.city.cityName = self.cityNameEditValue.text;
    self.city.stateName = self.stateNameEditValue.text;
    self.city.stateAbbreviation = self.stateAbbrEditValue.text;
    [self viewDidLoad];
}
@end
