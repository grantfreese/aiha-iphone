//
//  ConcentrationViewController.m
//  CalculationsAIHA
//
//  Created by Team IHOP of Arizona State University on 3/5/12.
//  Copyright (c) 2012 AIHA. All rights reserved.
//

#import "ConcentrationViewController.h"
#import "ConcentrationManager.h"
#import "CategoryManager.h"

@implementation ConcentrationViewController

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
    ConcentrationManager *Concentrationmanager = [ConcentrationManager sharedConcentrationManager];
    
    return [Concentrationmanager.formulas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ConcentrationCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    ConcentrationManager *Concentrationmanager = [ConcentrationManager sharedConcentrationManager];
    
    NSDictionary *ConcentrationInfo = [Concentrationmanager.formulas objectAtIndex:indexPath.row];
    
    //Put the image into the cell with the corresponding image name. If there is no image, then
    //put the actual formula instead.
    //Don't forget that the elements in the plist must contain
    //imageName as one of its keys
    NSString *deviceType = [UIDevice currentDevice].model;
    
    NSString *imageName;
    
    if([deviceType isEqualToString:@"iPad"]||[deviceType isEqualToString:@"iPad Simulator"])
    {
        imageName = [ConcentrationInfo objectForKey:@"imageNameIpad"];
    }
    else
    {
        imageName = [ConcentrationInfo objectForKey:@"imageName"];
    }
    
    if(imageName != nil)
    {
        CenteredImageCell *centeredCell = (CenteredImageCell*)cell;
        centeredCell.centeredImageView.image = [UIImage imageNamed:imageName];
    }
    else
    {
        cell.textLabel.text = [ConcentrationInfo objectForKey:@"formula"];
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
    ConcentrationManager *Concentrationmanager = [ConcentrationManager sharedConcentrationManager];
    
    Concentrationmanager.selectedFormula = [Concentrationmanager.formulas objectAtIndex:indexPath.row];    
    
    CategoryManager *catManager = [CategoryManager sharedCategoryManager];    
    catManager.category = 11;
    
    NSString *deviceType = [UIDevice currentDevice].model;
    UIStoryboard *storyboard;
    
    storyboard = self.storyboard;
    //KWRIGHT: DELETE
    /*if([deviceType isEqualToString:@"iPhone"]||[deviceType isEqualToString:@"iPhone Simulator"]){
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle: nil];}
    else{
        storyboard = [UIStoryboard storyboardWithName:@"iPad_Storyboard" bundle: nil];}
    */
    
    TwoVariableViewController *twoVariableVC = [storyboard instantiateViewControllerWithIdentifier:@"TwoVariableViewController"];
    [self.navigationController pushViewController:twoVariableVC animated:YES];
    
    
    
}



@end
