//
//  BBBTwoTableController.m
//  项目集合
//
//  Created by LinBin on 16/6/25.
//  Copyright © 2016年 LinBin. All rights reserved.
//
#import <YYModel.h>

#import "BBBTwoTableController.h"
#import "BBBHTTPSTool.h"
#import "BBBCategoryModel.h"
#import "BBBCategoryCell.h"
#import "BBBUserModel.h"
#import "BBBUsersCell.h"


@interface BBBTwoTableController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@property (strong, nonatomic) NSArray *categoryArray;
/**
 *  <#Description#>
 */
@property (strong, nonatomic) NSArray *userArray;

@property (strong, nonatomic) BBBHTTPSTool *tool;

@property (strong, nonatomic) NSMutableDictionary *patameters;

@end

@implementation BBBTwoTableController

static NSString *const categoryCell = @"categoryCell";
static NSString *const usersCell = @"usersCell";
- (NSArray *)categoryArray
{
    if (!_categoryArray) {
        _categoryArray = [NSArray array];
    }
    return _categoryArray;
}

- (BBBHTTPSTool *)tool
{
    if (_tool == nil) {
        _tool = [BBBHTTPSTool shareTool];
    }
    return _tool;
}

- (NSMutableDictionary *)patameters
{
    if (!_patameters) {
        _patameters = [NSMutableDictionary dictionary];
    }
    return _patameters;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self loadCategoryData];
    
    
    [self.categoryTableView registerNib:[UINib nibWithNibName:@"BBBCategoryCell" bundle:nil] forCellReuseIdentifier:categoryCell];
    [self.userTableView registerNib:[UINib nibWithNibName:@"BBBUsersCell" bundle:nil] forCellReuseIdentifier:usersCell];
    
    [self.categoryTableView setTableFooterView:[[UIView alloc] init]];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.categoryTableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    [self.userTableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    self.userTableView.rowHeight = 88;
   
  
}

- (void)viewDidAppear
{
  NSLog(@"%s",__func__);
}

- (void)loadCategoryData
{
    
    NSMutableDictionary *patameters = [NSMutableDictionary dictionary];
    patameters[@"a"] = @"category";
    patameters[@"c"] = @"subscribe";
    
    [self.tool GET:@"https://api.budejie.com/api/api_open.php" parameters:patameters succeed:^(id responseObject) {
        NSMutableArray *arrayM = [NSMutableArray array];
        NSArray *array = responseObject[@"list"];
        for (NSDictionary *dict in array) {
            BBBCategoryModel *model = [BBBCategoryModel yy_modelWithDictionary:dict];
            [arrayM addObject:model];
        }
        self.categoryArray = arrayM;
        [self.categoryTableView reloadData];
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadUsersData
{



}

#pragma mark <TableView DataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView) {
        return self.categoryArray.count;
    } else {
        
        return self.userArray.count;
    }
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        BBBCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryCell forIndexPath:indexPath];
        cell.categoryModel = self.categoryArray[indexPath.row];
        return cell;
    } else {
        BBBUsersCell *cell = [tableView dequeueReusableCellWithIdentifier:usersCell forIndexPath:indexPath];
        cell.model = self.userArray[indexPath.row];
        
        return  cell;
    }

    

    
}
#pragma mark <TableView UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BBBCategoryModel *categoryModel = self.categoryArray[indexPath.row];
 
    
    if (categoryModel.allUserArray.count) {
        
//        [self.userTableView reloadData];

    } else {
        /**
         *  请求右侧内容数据
         */
        NSMutableDictionary *patameters = [NSMutableDictionary dictionary];
        patameters[@"a"] = @"list";
        patameters[@"c"] = @"subscribe";
        patameters[@"category_id"] = @(categoryModel.id);
        patameters[@"page"] = @1;
        self.patameters = patameters;
        
        [self.tool GET:@"https://api.budejie.com/api/api_open.php" parameters:patameters succeed:^(id responseObject) {
            
            NSMutableArray *arrayUser = [NSMutableArray array];
            for (NSDictionary *dict in responseObject[@"list"]) {
                BBBUserModel *model = [BBBUserModel yy_modelWithDictionary:dict];
                [arrayUser addObject:model];
            }
            
            self.userArray = arrayUser;
//            [categoryModel.allUserArray addObjectsFromArray:self.userArray];
            [self.userTableView reloadData];

            
        } failure:^(NSError *error) {
            
        }];
    
            }
    
}




@end
