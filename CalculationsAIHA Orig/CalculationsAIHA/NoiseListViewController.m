//
//  NoiseListViewController.m
//  CalculationsAIHA
//
//  Created by asuuser on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NoiseListViewController.h"
#import "NoiseManager.h"
#import "OneVariableViewController.h"
#import "TwoVariableViewController.h"
#import "ThreeVariableViewController.h"
#import "FourVariableViewController.h"
#import "FiveVariableViewController.h"
#import "NoiseTableImageViewController.h"
#import "CategoryManager.h"

@implementation NoiseListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NoiseManager *manager = [NoiseManager sharedNoiseManager];
    
    return [manager.formulas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NoiseCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    NoiseManager *manager = [NoiseManager sharedNoiseManager];
    
    NSDictionary *formulaInfo = [manager.formulas objectAtIndex:indexPath.row];
    
    //Put the image into the cell with the corresponding image name. If there is no image, then
    //put the actual formula instead.
    //Don't forget that the elements in the plist must contain
    //imageName as one of its keys
    NSString *imageName = [formulaInfo objectForKey:@"imageName"];
    if(imageName != nil) {
        cell.imageView.image = [UIImage imageNamed:imageName];
    } else {
        cell.textLabel.text = [formulaInfo objectForKey:@"formula"];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    NoiseManager *manager = [NoiseManager sharedNoiseManager];
    
    manager.selectedFormula = [manager.formulas objectAtIndex:indexPath.row];
    
    NSDictionary *chosenFormula = manager.selectedFormula;
    
    int numberOfVariables =[[chosenFormula objectForKey:@"number"] intValue];
    
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];
    
    catManager.category = 1;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle: nil]; 
    
    
    /*if(numberOfVariables == 0)
    {
        NoiseTableImageViewController *noiseImageVC = [storyboard instantiateViewControllerWithIdentifier:@"NoiseTableImageViewController"];
        [self.navigationController pushViewController:noiseImageVC animated:YES];
    }*/
    
    if(numberOfVariables == 1)
    {
        OneVariableViewController *oneVariableVC = [storyboard instantiateViewControllerWithIdentifier:@"OneVariableViewController"];
        [self.navigationController pushViewController:oneVariableVC animated:YES];
    }    
    
    
    if(numberOfVariables == 2)
    {
        TwoVariableViewController *twoVariableVC = [storyboard instantiateViewControllerWithIdentifier:@"TwoVariableViewController"];
        [self.navigationController pushViewController:twoVariableVC animated:YES];
    }
    
    else if(numberOfVariables == 3)
    {
        ThreeVariableViewController *threeVariableVC = [storyboard instantiateViewControllerWithIdentifier:@"ThreeVariableViewController"];
        [self.navigationController pushViewController:threeVariableVC animated:YES];
    }
    
    else if(numberOfVariables == 4)
    {
        FourVariableViewController *fourVariableVC = [storyboard instantiateViewControllerWithIdentifier:@"FourVariableViewController"];
        [self.navigationController pushViewController:fourVariableVC animated:YES];
    }
    
    else if(numberOfVariables == 5)
    {
        FiveVariableViewController *fiveVariableVC = [storyboard instantiateViewControllerWithIdentifier:@"FiveVariableViewController"];
        [self.navigationController pushViewController:fiveVariableVC animated:YES];
    }
}

@end
