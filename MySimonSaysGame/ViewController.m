//
//  ViewController.m
//  MySimonSaysGame
//
//  Created by Jason Crawford on 3/16/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    self.upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    self.downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];
    [self.view addGestureRecognizer:self.upSwipe];
    [self.view addGestureRecognizer:self.downSwipe];

    timeInt = 20;
    scoreInt = 0;
    modeInt = 0;
    
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startGame:(id)sender {
    
    if (timeInt == 20) {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        
        self.startGameButton.enabled = NO;
        self.startGameButton.alpha = 0.5;
        
        
    }
    
    if (timeInt == 0) {
        
        timeInt = 20;
        scoreInt = 0;
        
        self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
        
        [self.startGameButton setTitle:@"Start Game" forState:UIControlStateNormal];
    }
    
}

-(void)updateTimer {
    
    timeInt -= 1;
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
    
    if (timeInt == 0) {
        
        [timer invalidate];
        
        self.startGameButton.enabled = YES;
        self.startGameButton.alpha = 1;
        [self.startGameButton setTitle:@"Restart" forState:UIControlStateNormal];
        
    }
}

-(void)handleSwipes:(UISwipeGestureRecognizer *)sender {
    
    
}
@end






