//
//  BBBContentTableController.m
//  项目集合
//
//  Created by LinBin on 16/6/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import <YYModel.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>

#import "BBBContentTableController.h"
#import "BBBHTTPSTool.h"
#import "BBBOneModel.h"


@interface BBBContentTableController ()

/** 所有数据 */
@property (strong, nonatomic) NSMutableArray *allData;
/** 加载更多参数 */
@property (copy,nonatomic) NSString *maxtime;
/** 加载页数 */
@property (assign, nonatomic) NSInteger page;
/** 加载页数 */
@property (assign, nonatomic) NSDictionary *parameters;
/** 选中 */
@property (assign, nonatomic) NSInteger  selectedIndex;

@end

@implementation BBBContentTableController

/**
 *  懒加载
 */
- (NSMutableArray *)allData
{
    if (_allData == nil) {
        _allData = [NSMutableArray array];
    }
    return _allData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //添加刷新控件
    [self addRefreshController];
}

/**
 *  添加刷新控件
 */
- (void)addRefreshController
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadTextData:)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTextData:)];
    
}

/**
 *  请求数据
 */
- (void)loadTextData:(UIRefreshControl *)refresh
{

    [self.tableView.mj_footer endRefreshing];
    //请求数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(self.type);
    parameters[@"page"] = @(self.page);
    self.parameters = parameters;
    
    [[BBBHTTPSTool shareTool]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters succeed:^(id data) {
        
        if (self.parameters != parameters) return;
        self.maxtime = data[@"info"][@"maxtime"];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in data[@"list"]) {
            BBBOneModel *model = [BBBOneModel yy_modelWithDictionary:dict];
            [arrayM addObject:model];
        }
        self.allData = arrayM;
        //更新table数据
        [self.tableView reloadData];
        //结束刷新
        [self.tableView.mj_header endRefreshing];
        self.page = 0;
  
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

/**
 *  请求更多数据
 */
- (void)loadMoreTextData:(UIRefreshControl *)refresh {
    
    [self.tableView.mj_header endRefreshing];
    self.page++;
    //请求更多数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(self.type);
    parameters[@"page"] = @(self.page);
    parameters[@"maxtime"] = self.maxtime;
    self.parameters = parameters;
    
    [[BBBHTTPSTool shareTool]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters succeed:^(id data) {
        
        if (self.parameters != parameters) return;
        self.maxtime = data[@"info"][@"maxtime"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in data[@"list"]) {
            BBBOneModel *model = [BBBOneModel yy_modelWithDictionary:dict];
            [arrayM addObject:model];
        }
        //添加更多数据
        [self.allData addObjectsFromArray:arrayM];
        //更新table 数据
        [self.tableView reloadData];
        //结束刷新
        [self.tableView.mj_footer endRefreshing];

        
    } failure:^(NSError *error) {
        self.page--;
        [self.tableView.mj_footer endRefreshing];
        
    }];
    
    
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    self.tableView.mj_footer.hidden = (self.allData.count == 0);
//    return self.allData.count;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//
//    
//}

//#pragma mark - Tableview datagate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//
//    
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    
//    
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
