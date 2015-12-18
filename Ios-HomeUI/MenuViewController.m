
#import "MenuViewController.h"
#import "TestViewController.h"
@interface MenuViewController ()

@end
@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (IBAction)open:(id)sender {
    TestViewController*vc=[self.storyboard instantiateViewControllerWithIdentifier:@"test"];
    [self.mainNav pushViewController:vc animated:true ];
}
@end
