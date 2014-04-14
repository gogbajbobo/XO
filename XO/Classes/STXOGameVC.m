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
@property (nonatomic) BOOL yourMove;

@end

@implementation STXOGameVC

#pragma mark - view lifecycle

- (void)drawMove:(NSNotification *)notification {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.gamePlay.lastMove.v inSection:self.gamePlay.lastMove.h];
    
    UICollectionViewCell *cell = [self.fieldCV cellForItemAtIndexPath:indexPath];
    cell = [self insertImageNamed:[NSString stringWithFormat:@"XO%@.png", self.gamePlay.currentPlayer.gamePic] intoCell:cell];
    
}

- (void)fieldEnable {
    
    self.yourMove = YES;
    
    NSLog(@"Enable");
    
}

- (void)fieldDisable {
    
    self.yourMove = NO;

    NSLog(@"Disable");

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
    cell = [self insertImageNamed:@"XO.png" intoCell:cell];

    return cell;
    
}

- (UICollectionViewCell *)insertImageNamed:(NSString *)imageName intoCell:(UICollectionViewCell *)cell {
    
    [[cell.contentView viewWithTag:1] removeFromSuperview];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.tag = 1;
    [cell.contentView addSubview:imageView];

    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.yourMove) {
        
        NSString *gamePic = self.gamePlay.currentPlayer.gamePic;
        
        if ([self.gamePlay move:gamePic toH:indexPath.section V:indexPath.row]) {
            
            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
            cell = [self insertImageNamed:[NSString stringWithFormat:@"XO%@.png", gamePic] intoCell:cell];
            
        }
        
        NSLog(@"%d %d", indexPath.section, indexPath.row);

    }
    
}

#pragma mark - view init

- (void)addObservers {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drawMove:) name:@"lastMove" object:self.gamePlay];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fieldEnable) name:@"yourMove" object:self.gamePlay];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fieldDisable) name:@"oppsMove" object:self.gamePlay];
    
}

- (void)customViewInit {
    
    self.fieldCV.dataSource = self;
    self.fieldCV.delegate = self;
    
    STXOPlayer *you = [[STXOPlayer alloc] init];
    you.name = @"YOU";
        
    STXOAI *opp = [[STXOAI alloc] init];
    opp.name = @"OPP";
    
//    self.gamePlay = [STXOGamePlay startGameWithPlayers:[NSArray arrayWithObjects:p1, p2, nil]];

    self.gamePlay = [STXOGamePlay startGameWithYou:you andOpp:opp];

    [self addObservers];
    
    if (self.gamePlay.currentPlayer == you) {
        [self fieldEnable];
    }

    NSLog(@"self.gamePlay %@", self.gamePlay);
    

    
//    [gamePlay move:@"X" toH:0 V:0];
//    NSLog(@"%d", [gamePlay.field intValueForH:0 V:0]);
//    
//    [gamePlay move:@"O" toH:2 V:1];
//    NSLog(@"%d", [gamePlay.field intValueForH:2 V:1]);
//    
//    NSLog(@"%d", [gamePlay.field intValueForH:0 V:1]);
    
//    [self.gamePlay move:@"X" toH:0 V:0];
//    [self.gamePlay move:@"X" toH:0 V:1];
//    [self.gamePlay move:@"X" toH:0 V:2];
//    [self.gamePlay move:@"X" toH:1 V:1];
//    [self.gamePlay move:@"X" toH:2 V:2];
//    
//    NSLog(@"%@", self.gamePlay.field.cells);
    
//    [p2 fieldAnalyze];

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
