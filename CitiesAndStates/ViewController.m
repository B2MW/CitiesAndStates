//
//  ViewController.m
//  CitiesAndStates
//
//  Created by Bradley Walker on 10/10/14.
//  Copyright (c) 2014 BlackSummerVentures. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *cityList;
@property (strong, nonatomic) IBOutlet UITextField *addCityTextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    City *city1 = [[City alloc] init];
    city1.cityName = @"Bloomington";
    city1.stateName = @"Indiana";
    city1.stateAbbreviation = @"IN";
    city1.cityImage = [UIImage imageNamed:@"bloomington"];

    City *city2 = [[City alloc] init];
    city2.cityName = @"San Francisco";
    city2.stateName = @"California";
    city2.stateAbbreviation = @"CA";
    city2.cityImage = [UIImage imageNamed:@"sanfrancisco"];

    City *city3 = [[City alloc] init];
    city3.cityName = @"Chicago";
    city3.stateName = @"Illinois";
    city3.stateAbbreviation = @"IL";
    city3.cityImage = [UIImage imageNamed:@"chicago"];

    City *city4 = [[City alloc] init];
    city4.cityName = @"Indianapolis";
    city4.stateName = @"Indiana";
    city4.stateAbbreviation = @"IL";
    city1.cityImage = [UIImage imageNamed:@"indianapolis"];

    self.cityList = [NSMutableArray arrayWithObjects:city1, city2, city3, city4, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cityList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath];
    City *city = [self.cityList objectAtIndex:indexPath.row];
    cell.textLabel.text = city.cityName;
    cell.detailTextLabel.text = city.stateName;
    cell.imageView.image = city.cityImage;
    return cell;
}
- (IBAction)onAddButtonPressed:(id)sender
{

}
- (IBAction)onEditButtonPressed:(id)sender
{
    if (self.tableView.isEditing) {
        [self.tableView setEditing:NO animated:YES];
    } else if (!self.tableView.isEditing)
    {
        [self.tableView setEditing:YES animated:YES];
    }
}
- (void) setEditing:(BOOL)editing animated:(BOOL)animated
{

}

- (IBAction)undwindSegue:(UIStoryboardSegue *)back
{

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell
{
    DetailViewController *detail = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    detail.city = [self.cityList objectAtIndex:indexPath.row];
//    detail.city = cell;
}


@end
