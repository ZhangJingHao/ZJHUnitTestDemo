//
//  PhotosViewController.m
//  objc.io example project (issue #1)
//

#import "PhotosViewController.h"
#import "Photo.h"
#import "PhotoCell.h"
#import "ArrayDataSource.h"
#import "Store.h"
#import "AppDelegate.h"
#import "PhotoCell+ConfigureForPhoto.h"
#import "PhotoViewController.h"


static NSString * const PhotoCellIdentifier = @"PhotoCell";


@interface PhotosViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;

@end


@implementation PhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Photos";
    [self setupTableView];
}

- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(PhotoCell *cell, Photo *photo) {
        [cell configureForPhoto:photo];
    };
    
    Store *st =[Store sharedInstance];
    NSArray *photos = [st sortedPhotos];
    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos
                                                         cellIdentifier:PhotoCellIdentifier
                                                     configureCellBlock:configureCell];
    self.tableView.dataSource = self.photosArrayDataSource;
    [self.tableView registerClass:[PhotoCell class] forCellReuseIdentifier:PhotoCellIdentifier];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewController *photoViewController = [[PhotoViewController alloc] init];
    photoViewController.photo = [self.photosArrayDataSource itemAtIndexPath:indexPath];
    [self.navigationController pushViewController:photoViewController animated:YES];
}

@end
