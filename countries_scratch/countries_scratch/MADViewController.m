//
//  MADViewController.m
//  countries_scratch
//
//  Created by Aileen Pierce on 10/22/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"
#import "DetailViewController.h"

@interface MADViewController ()
{
    NSMutableDictionary *continentData;
}

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle=[NSBundle mainBundle]; //returns a bundle object of our app
	NSString *plistPath=[bundle pathForResource:@"continents" ofType:@"plist"]; //retrieve the path of continents.plist
	NSMutableDictionary *dictionary=[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath]; //loads the contents of the plist file into a dictionary
	//the dictionary uses the continents as the keys and a NSArray with the countries for each continent.
	continentData=dictionary;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [continentData count]; //returns the number of continents
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	NSArray *rowData=[continentData allKeys]; //creates an array with all keys from our dictionary
	cell.textLabel.text=[rowData objectAtIndex:indexPath.row]; //sets the text of the cell with the row being requested
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"countrysegue"]) {
        DetailViewController *countryViewController=segue.destinationViewController;
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        NSArray *rowData=[continentData allKeys]; //creates an array with all keys from our dictionary
        countryViewController.title=[rowData objectAtIndex:indexPath.row];
        countryViewController.countryList=[continentData objectForKey:countryViewController.title];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
