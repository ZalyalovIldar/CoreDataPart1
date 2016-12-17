//
//  MasterViewController.m
//  HWCoreDataPart1
//
//  Created by Ildar Zalyalov on 12.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CoreDataManager.h"
#import "CustomCellTableViewCell.h"
#import "Settings.h"

@interface MasterViewController ()
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic, strong) NSArray *birthArray;
@property (nonatomic, strong) Settings *settings;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    UIBarButtonItem *clearButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteAll:)];
    
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(showSettings)];
    
    self.tableView.estimatedRowHeight = 200;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.navigationItem.leftBarButtonItems = @[clearButton, settingsButton];
    
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
 

    

    
}

- (void)insertNewObject:(id)sender {
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    [[CoreDataManager sharedInstance] createRandomUser:context];
}


- (void)deleteAll:(id)sender {
    [[CoreDataManager sharedInstance] deleteAllDataFromDB:self.fetchedResultsController];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"settings"];
    Settings *settings = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    self.settings =settings ? settings : [[Settings alloc] init];
    self.fetchedResultsController = [self fetchedResultsController];
    [self.tableView reloadData];
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Event *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

- (void)showSettings{
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

#pragma mark - Table View

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Event *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.nameLabel.text = event.name;
    cell.ageLabel.text = [NSString stringWithFormat:@"%hd", event.age];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd.MM.YYYY"];
    cell.birthDate.text = [formater stringFromDate:event.birthDate];
    cell.sexLabel.text = event.sex;
    [self configureCell:cell withEvent:event];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
            
        NSError *error = nil;
        if (![context save:&error]) {
                        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }
    }
}


- (void)configureCell:(UITableViewCell *)cell withEvent:(Event *)event {
  
}


#pragma mark - Fetched results controller

- (NSFetchedResultsController<Event *> *)fetchedResultsController
{
    
    
    NSFetchRequest<Event *> *fetchRequest = Event.fetchRequest;
   
    [fetchRequest setFetchBatchSize:20];
    
    NSMutableArray *sortDescriptors = [NSMutableArray new];
    if (self.settings.nameSwitchStatus)
    {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        [sortDescriptors addObject:sortDescriptor];
        
    }
    
    if ( self.settings.ageSwitchStatus) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"age" ascending:YES];
        [sortDescriptors addObject:sortDescriptor];
    }
    
    if (self.settings.birthDateSwitchStatus) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"birthDate" ascending:YES];
        [sortDescriptors addObject:sortDescriptor];
    }
    
    if (self.settings.sexSwitchStatus) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sex" ascending:YES];
        [sortDescriptors addObject:sortDescriptor];
    }
    
    [fetchRequest setSortDescriptors:sortDescriptors.copy];
    
    NSFetchedResultsController<Event *> *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    
    NSError *error = nil;
    if (![aFetchedResultsController performFetch:&error]) {
                NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
    _fetchedResultsController = aFetchedResultsController;
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] withEvent:anObject];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

@end
