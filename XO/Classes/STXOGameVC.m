//
//  STXOGameVC.m
//  XO
//
//  Created by Maxim Grigoriev on 13/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOGameVC.h"
#import "STXOGamePlay.h"
#import "STXOAI.h"

@interface STXOGameVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) STXOGamePlay *gamePlay;
@property (weak, nonatomic) IBOutlet UICollectionView *fieldCV;

@end

@implementation STXOGameVC

#pragma mark - view lifecycle

- (void)drawMove:(NSNotification *)notification {
    
}


#pragma mark - UICollectionViewDataSource, Delegate, DelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.gamePlay.field.hcount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.gamePlay.field.vcount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellViewCell" forIndexPath:indexPath];
    [[cell.contentView viewWithTag:1] removeFromSuperview];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
    imageView.image = [UIImage imageNamed:@"XO.png"];
    imageView.tag = 1;
    [cell.contentView addSubview:imageView];
    
    NSLog(@"%f", cell.frame.origin.x);
    
    return cell;
    
}


#pragma mark - view init

- (void)addObservers {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drawMove:) name:@"lastMove" object:self.gamePlay];
    
}

- (void)customViewInit {
    
    self.fieldCV.dataSource = self;
    self.fieldCV.delegate = self;
    
    STXOPlayer *p1 = [[STXOPlayer alloc] init];
    p1.name = @"Xname";
    
    STXOAI *p2 = [[STXOAI alloc] init];
    p2.name = @"Oname";
    
    self.gamePlay = [STXOGamePlay startGameWithPlayers:[NSArray arrayWithObjects:p1, p2, nil]];
    
    
    [self addObservers];
    
    
//    [gamePlay move:@"X" toH:0 V:0];
//    NSLog(@"%d", [gamePlay.field intValueForH:0 V:0]);
//    
//    [gamePlay move:@"O" toH:2 V:1];
//    NSLog(@"%d", [gamePlay.field intValueForH:2 V:1]);
//    
//    NSLog(@"%d", [gamePlay.field intValueForH:0 V:1]);
    
    [self.gamePlay move:@"X" toH:0 V:0];
    [self.gamePlay move:@"X" toH:0 V:1];
    [self.gamePlay move:@"X" toH:0 V:2];
    [self.gamePlay move:@"X" toH:1 V:1];
    [self.gamePlay move:@"X" toH:2 V:2];
    
    NSLog(@"%@", self.gamePlay.field.cells);
    
    [p2 fieldAnalyze];

}

#pragma mark - view lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customViewInit];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
