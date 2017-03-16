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
    
    self.label.layer.cornerRadius = 20;
    self.label.clipsToBounds = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startGame:(id)sender {
    
    if (timeInt == 20) {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        
        [self simonSays];
        
        self.startGameButton.enabled = NO;
        self.startGameButton.alpha = 0.5;
        
        modeInt = 1;
        
    }
    
    if (timeInt == 0) {
        
        timeInt = 20;
        scoreInt = 0;
        
        self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
        
        [self.startGameButton setTitle:@"Start Game" forState:UIControlStateNormal];
        
        self.label.text = @"Simon Says";
        
    }
    
}

-(void)updateTimer {
    
    timeInt -= 1;
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
    
    if (timeInt == 0) {
        
        [timer invalidate];
        [simonTimer invalidate];
        
        modeInt = 0;
        
        self.label.text = @"Game Over";
        
        self.startGameButton.enabled = YES;
        self.startGameButton.alpha = 1;
        [self.startGameButton setTitle:@"Restart" forState:UIControlStateNormal];
        
    }
}

-(void)simonSays {
    
    NSArray *array = @[@"Simon Says Swipe Left",
                       @"Simon Says Swipe Right",
                       @"Simon Says Swipe Up",
                       @"Simon Says Swipe Down",
                       @"Swipe Left",
                       @"Swipe Right",
                       @"Swipe Up",
                       @"Swipe Down"];
    int randomWord = arc4random() % array.count;
    self.label.text = array[randomWord];
    
    simonTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(simonSays) userInfo:nil repeats:NO];
    
}

-(void)handleSwipes:(UISwipeGestureRecognizer *)sender {
    
    if (modeInt == 1) {
        
        if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
            
            [simonTimer invalidate];
            
            if ([self.label.text isEqualToString:@"Simon Says Swipe Left"]) {
                
                scoreInt += 1;
                self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
                
                [self simonSays];
                
            } else {
                
                scoreInt -=1;
                self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
                
                [self simonSays];
                
            }
            
        }
        
        if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
            
            [simonTimer invalidate];
            
            if ([self.label.text isEqualToString:@"Simon Says Swipe Right"]) {
                
                scoreInt += 1;
                self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
                
                [self simonSays];
                
            } else {
                
                scoreInt -= 1;
                self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
                
                [self simonSays];
                
            }
            
        }
        
        if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
            
            [simonTimer invalidate];
            
            if ([self.label.text isEqualToString:@"Simon Says Swipe Up"]) {
                
                scoreInt += 1;
                self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
                
                [self simonSays];
                
            } else {
                
                scoreInt -= 1;
                self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
                
                [self simonSays];
                
            }
            
        }
        
        if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
            
            [simonTimer invalidate];
            
            if ([self.label.text isEqualToString:@"Simon Says Swipe Down"]) {
                
                scoreInt += 1;
                self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
                
                [self simonSays];
                
            } else {
                
                scoreInt -= 1;
                self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
                
                [self simonSays];
                
            }
        }
    }
    
}
@end






