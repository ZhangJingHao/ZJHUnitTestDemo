//
//  PhotoViewController.h
//  objc.io example project (issue #1)
//


#import "PhotoViewController.h"
#import "Photo.h"
#import "User.h"


@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.photo.name;
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
