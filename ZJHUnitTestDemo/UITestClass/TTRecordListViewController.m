//
//  TTRecordListViewController.m
//  ZJHUnitTestDemo
//
//  Created by ZJH on 2022/8/10.
//

#import "TTRecordListViewController.h"
#import "TTRecordViewController.h"
#import "TTFakeNetworking.h"
#import "TTRecordCellTableViewCell.h"
#import "TTConstant.h"

@interface TTRecordListViewController () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) UILabel *emptyView;

@property (nonatomic, strong) NSMutableArray *recordList;


@end

@implementation TTRecordListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Record List"];
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self requestRecordList];
    [self initial];
    [self mTableView];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(tapAddRecordAction:)];
}
 

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)initial {
    self.recordList = [[NSMutableArray alloc] init];
    [kNotificationCenter addObserverForName:kRecordDoneNotificationKey
                                     object:nil
                                      queue:[NSOperationQueue mainQueue]
                                 usingBlock:^(NSNotification * _Nonnull note) {
        [self requestRecordList];
    }];
}

#pragma mark - RequestMethod
- (void)requestRecordList {
    [TTFakeNetworkingInstance requestWithService:apiRecordList completionHandler:^(NSDictionary *response) {
        self.recordList = [[NSMutableArray alloc] initWithArray:response[@"data"]];
        if (self.recordList.count > 0) {
            [self.mTableView reloadData];
            self.mTableView.hidden = NO;
            self.emptyView.hidden = YES;
        }else{
            self.emptyView.hidden = NO;
            self.mTableView.hidden = YES;
        }
    }];
}

- (void)deleteRecordWithIndex:(NSInteger)index completionHandler:(void(^)(NSDictionary *response))completionHandler{
    [TTFakeNetworkingInstance requestWithService:apiRecordDelete parameter:@{@"index": @(index)} completionHandler:^(NSDictionary *response) {
        if (completionHandler) {
            completionHandler(response);
        }
    }];

}

#pragma mark - IBAction
- (void)tapAddRecordAction:(id)sender {
    TTRecordViewController *goVC = [TTRecordViewController new];
    [self.navigationController pushViewController:goVC animated:YES];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.recordList.count > 0
    ?1:0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recordList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TTRecordCellTableViewCell heightForCellInTableView:tableView rowAtIndexPath:indexPath dataSource:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TTRecordCellTableViewCell *cell = [TTRecordCellTableViewCell cellForTableView:tableView];
    [cell displayCellByDataSources:self.recordList rowAtIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteRecordWithIndex:indexPath.row completionHandler:^(NSDictionary *response) {
            [self.recordList removeObjectAtIndex:indexPath.row];
            if (self.recordList.count == 0) {
                [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
                [self requestRecordList];
            } else {
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
        }];
    }
}

#pragma mark - Getter

- (UITableView *)mTableView {
    if (!_mTableView) {
        _mTableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _mTableView.dataSource = self;
        _mTableView.delegate = self;
        [self.view addSubview:_mTableView];
    }
    return _mTableView;
}

- (UILabel *)emptyView {
    if (!_emptyView) {
        _emptyView = [[UILabel alloc] initWithFrame:self.view.frame];
        _emptyView.text = @"您还没有任何记录，点击'+'号去添加";
        _emptyView.textColor = [UIColor blueColor];
        _emptyView.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_emptyView];
    }
    return _emptyView;
}

@end
