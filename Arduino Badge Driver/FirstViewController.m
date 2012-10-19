//
//  FirstViewController.m
//  Arduino Badge Driver
//
//  Created by Kelly John Rose on 2012-09-28.
//  Copyright (c) 2012 Kelly John Rose. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize lightOnAudio = _lightOnAudio;
@synthesize lightOffAudio = _lightOffAudio;
@synthesize backToStartAudio = _backToStartAudio;
@synthesize audioStack = _audioStack;
@synthesize textModeBox = _textModeBox;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if(!self.lightOnAudio) {
        NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                   pathForResource:@"lightOn"
                                                   ofType:@"wav"]];
        _lightOnAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
        _lightOnAudio.delegate = self;
    }
    if(!self.lightOffAudio) {
        NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                   pathForResource:@"lightOff"
                                                   ofType:@"wav"]];
        _lightOffAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
        _lightOffAudio.delegate = self;
    }
    if(!self.backToStartAudio) {
        NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                   pathForResource:@"leftPulse"
                                                   ofType:@"wav"]];
        _backToStartAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
        _backToStartAudio.delegate = self;
    }
    _audioStack = [[NSMutableArray alloc] initWithCapacity:20];
    
    _textModeBox.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) playLightOn {
    [self.lightOnAudio play];
}

- (void) playLightOff {
    [self.lightOffAudio play];
}

- (void) startSignal {
        [self.backToStartAudio play];
}

- (void) playStartCommand {
    for(int i=0;i<5;i++) {
        [self.audioStack addObject:self.backToStartAudio];
    }
    [self.backToStartAudio play];
}

- (IBAction)lightOnButton:(id)sender {
    [self playLightOn];
}

- (IBAction)lightOffButton:(id)sender {
    [self playLightOff];
}

- (void)goToStart {
    [self playStartCommand];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
}

- (IBAction)backToStart:(id)sender {
    [self goToStart];
}

- (IBAction)fillScreen:(id)sender {
    [self goToStart];
    for(int i=0;i<120;i++){
        [self.audioStack addObject:self.lightOnAudio];
    }
}

- (IBAction)wipeScreen:(id)sender {
    [self goToStart];
    for(int i=0;i<120;i++){
        [self.audioStack addObject:self.lightOffAudio];
    }
}

- (IBAction)sayHi:(id)sender {
    [self goToStart];
    for(int i=0;i<8;i++) {
        [self.audioStack addObject:self.lightOnAudio];
    }
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    for(int i=0;i<8;i++) {
        [self.audioStack addObject:self.lightOnAudio];
    }
    for(int i=0;i<8;i++){
        [self.audioStack addObject:self.lightOffAudio];
    }
    for(int i=0;i<8;i++) {
        [self.audioStack addObject:self.lightOnAudio];
    }
    for(int i=0;i<8;i++){
        [self.audioStack addObject:self.lightOffAudio];
    }
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    
    
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
}

- (void)drawScreen:(NSMutableArray *)screen {
    [self goToStart];
    while([screen count] > 0) {
        NSArray* col = (NSArray *)[screen objectAtIndex:0];
        for(int i=0; i<8; i++) {
            NSNumber * point = [col objectAtIndex:i];
            if([point compare:[NSNumber numberWithInteger:0]])
                [self.audioStack addObject:self.lightOnAudio];
            else
                [self.audioStack addObject:self.lightOffAudio];
        }
        [screen removeObjectAtIndex:0];
    }
}

- (IBAction)suzanne:(id)sender {
    NSMutableArray* suzanne = [NSMutableArray arrayWithObjects:
                               [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],
                               [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],
                               [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],nil],
                        [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:0],nil],
                               [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],
                               [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],
                               [NSArray arrayWithObjects:[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:0],nil],nil];
    [self drawScreen:suzanne];
}

- (IBAction)resetToDefault:(id)sender {
    [self.audioStack removeAllObjects];
    [self playStartCommand];
    [self playStartCommand];
}

- (void)sendNumber:(int)number {
    int newNum = 0;
    for(int i=0;i<6;i++) {
        newNum = newNum << 1;
        newNum += number % 2;
        number /= 2;
    }
    for(int i=0;i<6;i++) {
        if(newNum % 2 == 1) {
            [self.audioStack addObject:self.lightOnAudio];
        } else {
            [self.audioStack addObject:self.lightOffAudio];
        }
        newNum = newNum / 2;
    }
}

- (IBAction)sendTextMessage:(id)sender {
    self.textModeProgress = 0;
    [self playStartCommand];
    [self.audioStack addObject:self.lightOnAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    [self.audioStack addObject:self.lightOffAudio];
    
    NSString * textToDisplay = [NSString stringWithString:self.textModeBox.text.uppercaseString];
    for(int i=0; i < textToDisplay.length; i++) {
        if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"A"]) {
            [self sendNumber:1];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"B"]) {
            [self sendNumber:2];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"C"]) {
            [self sendNumber:3];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"D"]) {
            [self sendNumber:4];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"E"]) {
            [self sendNumber:5];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"F"]) {
            [self sendNumber:6];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"G"]) {
            [self sendNumber:7];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"H"]) {
            [self sendNumber:8];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"I"]) {
            [self sendNumber:9];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"J"]) {
            [self sendNumber:10];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"K"]) {
            [self sendNumber:11];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"L"]) {
            [self sendNumber:12];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"M"]) {
            [self sendNumber:13];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"N"]) {
            [self sendNumber:14];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"O"]) {
            [self sendNumber:15];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"P"]) {
            [self sendNumber:16];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"Q"]) {
            [self sendNumber:17];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"R"]) {
            [self sendNumber:18];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"S"]) {
            [self sendNumber:19];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"T"]) {
            [self sendNumber:20];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"U"]) {
            [self sendNumber:21];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"V"]) {
            [self sendNumber:22];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"W"]) {
            [self sendNumber:23];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"X"]) {
            [self sendNumber:24];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"Y"]) {
            [self sendNumber:25];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"Z"]) {
            [self sendNumber:26];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"!"]) {
            [self sendNumber:27];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"?"]) {
            [self sendNumber:28];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"."]) {
            [self sendNumber:29];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@","]) {
            [self sendNumber:30];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"#"]) {
            [self sendNumber:31];
        } else if([[textToDisplay substringWithRange:NSMakeRange(i,1)] isEqualToString:@"@"]) {
            [self sendNumber:32];
        } else {
            [self sendNumber:0];
        }
    }
    
    // Fin
    [self sendNumber:63];
    [self startSignal];
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)aPlayer successfully:(BOOL)flag
{
    if([self.audioStack count] > 0) {
        AVAudioPlayer *nextAudio = [self.audioStack objectAtIndex:0];
        [nextAudio play];
        [self.audioStack removeObjectAtIndex:0];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
@end
