//
//  LMainTabbedPageViewController.m
//  Paged Tabs Example
//
//  Created by Jernej Zorec on 01/07/16.
//  Copyright © 2016 Merrick Sapsford. All rights reserved.
//

#import "LMainTabbedPageViewController.h"

@interface LMainTabbedPageViewController ()

@end

@implementation LMainTabbedPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self.tabBarView setTransitionStyle:MSSTabTransitionStyleProgressive];
//    self.tabBarView.tabStyle = self.style.tabStyle;
    self.tabBarView.sizingStyle = MSSTabSizingStyleDistributed;
    
    self.tabBarView.indicatorBackAttributes = @{NSForegroundColorAttributeName : [UIColor grayColor]};
    self.tabBarView.indicatorAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.tabBarView.tabAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0f weight:UIFontWeightMedium],
                                      NSForegroundColorAttributeName : [UIColor whiteColor],
                                      MSSTabTitleAlpha: @(0.6f)};
    self.tabBarView.selectedTabAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0f weight:UIFontWeightMedium],
                                              NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tabBarView.collectionView reloadData];
    });
    
    
}

#pragma mark - MSSPageViewControllerDataSource

- (NSArray *)viewControllersForPageViewController:(MSSPageViewController *)pageViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    NSMutableArray *viewControllers = [NSMutableArray new];
    
    for (NSInteger i = 0; i < 3; i++) {
        UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController1"];
        [viewControllers addObject:viewController];
    }
    return viewControllers;
}

#pragma mark - MSSTabBarViewDataSource

- (void)tabBarView:(MSSTabBarView *)tabBarView populateTab:(MSSTabBarCollectionViewCell *)tab atIndex:(NSInteger)index {
    NSString *imageName = [NSString stringWithFormat:@"tab%i.png", (int)(index + 1)];
    NSString *pageName = [NSString stringWithFormat:@"Page %i", (int)(index + 1)];
    
    tab.image = [UIImage imageNamed:imageName];
    tab.title = pageName;
    
    switch (index) {
        case 0:
            tab.title = @"activity";
            break;
            
        case 1:
            tab.title = @"go live";
            break;
            
        case 2:
            tab.title = @"groups";
            break;
            
        default:
            break;
    }
}

- (NSInteger)defaultPageIndexForPageViewController:(nonnull MSSPageViewController *)pageViewController {
    return 1;
}

@end
