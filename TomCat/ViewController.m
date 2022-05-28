//
//  ViewController.m
//  TomCat
//
//  Created by Admin on 2022/5/29.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewCat;
- (IBAction)drink;
- (IBAction)fart;
- (IBAction)pie;
- (IBAction)scratch;
- (IBAction)cymbal;
- (IBAction)eat;
- (IBAction)knockout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)startAnimating:(int)count picName:(NSString *)picName {
    if (self.imgViewCat.isAnimating) {
        return;
    }
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < count+1; i++) {
        NSString *imgName = [NSString stringWithFormat:@"%@_%02d.jpg", picName, i];
        // 通过imageNamed方法加载的图片会一直占用内存不释放
        // UIImage *imgCat = [UIImage imageNamed:imgName];
        NSString *path = [[NSBundle mainBundle] pathForResource:imgName ofType:nil];
        UIImage *imgCat = [UIImage imageWithContentsOfFile:path];
        [arrayM addObject:imgCat];
    }
    self.imgViewCat.animationImages = arrayM;
    self.imgViewCat.animationDuration = count * 0.1;
    self.imgViewCat.animationRepeatCount = 1;
    [self.imgViewCat startAnimating];
    
    // 延迟清空
    [self.imgViewCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:count*0.1];
}

- (IBAction)drink {
    [self startAnimating:80 picName:@"drink"];
}

- (IBAction)fart {
    [self startAnimating:27 picName:@"fart"];
}

- (IBAction)pie {
    [self startAnimating:23 picName:@"pie"];
}

- (IBAction)scratch {
    [self startAnimating:55 picName:@"scratch"];
}

- (IBAction)cymbal {
    [self startAnimating:12 picName:@"cymbal"];
}

- (IBAction)eat {
    [self startAnimating:39 picName:@"eat"];
}

- (IBAction)knockout {
    [self startAnimating:80 picName:@"knockout"];
}

@end
