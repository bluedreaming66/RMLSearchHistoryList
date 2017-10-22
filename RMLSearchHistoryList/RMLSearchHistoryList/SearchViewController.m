//
//  SearchViewController.m
//  RMLSearchHistoryList
//
//  Created by blue on 2017/10/16.
//  Copyright © 2017年 blue. All rights reserved.
//


#import "SearchViewController.h"
#import "SearchCollectionViewCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

static NSString *searchItemID = @"searchItemID";
@interface SearchViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *hotArr;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hotArr = [NSArray arrayWithObjects:@"热门搜索",@"搜索历史",@"历史",@"搜索历史",@"搜索索历史", nil];
    [self setSearchView];
    [self setupUI];
    
}

- (void)setSearchView{
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , 64)];
    searchView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    [self.view addSubview:searchView];
    
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [dismissBtn setBackgroundImage:[UIImage imageNamed:@"nav_dismiss_icon"] forState:UIControlStateNormal];
    dismissBtn.frame = CGRectMake(12, 20+(44-30)*0.5, 30, 30);
    [dismissBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [searchView addSubview:dismissBtn];
    
    UIView *searchBgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dismissBtn.frame) + 5, 20+(44-30)*0.5, kScreenWidth - CGRectGetMaxX(dismissBtn.frame) - 12 - 5, 30)];
    searchBgView.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    searchBgView.layer.cornerRadius = 15;
    searchBgView.layer.masksToBounds = YES;
    [searchView addSubview:searchBgView];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    searchBtn.frame = CGRectMake(10, (30-12)*0.5, 12, 12);
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"nav_homesearch_icon"] forState:UIControlStateNormal];
    [searchBgView addSubview:searchBtn];
    
    UITextField *searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(searchBtn.frame) + 5, (30-12)*0.5, searchBgView.frame.size.width - 30, 15)];
    searchTextField.returnKeyType = UIReturnKeySearch;
    [searchBgView addSubview:searchTextField];
    
}

- (void)setupUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 14;
    layout.minimumLineSpacing = 14;
    layout.sectionInset = UIEdgeInsetsMake(16, 16, 6, 16);
    layout.estimatedItemSize = CGSizeMake(100, 30);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    [collectionView registerClass:[SearchCollectionViewCell class] forCellWithReuseIdentifier:searchItemID];
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.hotArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:searchItemID forIndexPath:indexPath];
    cell.titleLabel.text = self.hotArr[indexPath.row];
    return cell;
}

@end
