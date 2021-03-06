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

UIAlertController * alert = [UIAlertController
                alertControllerWithTitle:@"Delete (project name)?"
                                 message:@"Are you sure you want to delete (project name)? It will be moved to the rubbish bin." // Use string @"Are you sure you want to delete (project name)? It will be gone forever (a long time)!" for perm delete
                          preferredStyle:UIAlertControllerStyleAlert];



UIAlertAction* yesButton = [UIAlertAction
                    actionWithTitle:@"Cancel"
                              style:UIAlertActionStyleCancel
                            handler:^(UIAlertAction * action) {
                                // Deletion logic

                                [_objects removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
                            }];

UIAlertAction* noButton = [UIAlertAction
                        actionWithTitle:@"Delete"
                                  style:UIAlertActionStyleDestructive
                                handler:^(UIAlertAction * action) {
                                   // Nothing to do
                                }];

[alert addAction:yesButton];
[alert addAction:noButton];

    }
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES]; // segue to the project screen here
}

@end
