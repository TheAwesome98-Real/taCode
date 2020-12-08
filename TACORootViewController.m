#import "TACORootViewController.h"

@interface TACORootViewController ()
@property (nonatomic, strong) NSMutableArray * objects;
@end

@implementation TACORootViewController

- (void)loadView {
	[super loadView];

	_objects = [NSMutableArray array];

	self.title = @"Projects";
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
}

- (void)addButtonTapped:(id)sender {
	[_objects insertObject:[NSDate date] atIndex:0];
	[self.tableView insertRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:0 inSection:0] ] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}

	cell.textLabel.text = @"New Project";
	return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        self.indexPathToBeDeleted = indexPath;

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete (project name)?"
                                                        message:@"Are you sure you want to delete (projecf name)? It will be gone forever (a long time)!"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              destructiveButtonTitle:@"Delete"];
        [alert show];
        // the thing hasnt been done yet so dont do anything
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Now the thing was pressed so do the thing

    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Cancel"])
    {
        NSLog(@"Canceled");
    }
    else if([title isEqualToString:@"Delete"])
    {
        NSLog(@"Delete project");

        	[_objects removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView ofdidSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
