//
//  FirstViewController.h
//  Arduino Badge Driver
//
//  Created by Kelly John Rose on 2012-09-28.
//  Copyright (c) 2012 Kelly John Rose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FirstViewController : UIViewController <AVAudioPlayerDelegate, UITextFieldDelegate>
- (IBAction)lightOnButton:(id)sender;
- (IBAction)lightOffButton:(id)sender;
- (IBAction)backToStart:(id)sender;
- (IBAction)fillScreen:(id)sender;
- (IBAction)wipeScreen:(id)sender;
- (IBAction)sayHi:(id)sender;
- (IBAction)suzanne:(id)sender;
- (IBAction)resetToDefault:(id)sender;
- (IBAction)textModeChanged:(id)sender;
- (IBAction)sendTextMessage:(id)sender;
- (void)goToStart;
- (void)startSignal;
- (void) playLightOn;
- (void) playLightOff;
- (void) playStartCommand;
- (void) drawScreen:(NSMutableArray *)screen;
- (void) sendNumber:(int)number;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textOutputProgress;
@property (weak, nonatomic) IBOutlet UIButton *textModeButton;
@property (weak, nonatomic) IBOutlet UIProgressView *textModeProgress;
@property (weak, nonatomic) IBOutlet UITextField *textModeBox;
@property (weak, nonatomic) IBOutlet UISwitch *textModeSwitch;
@property (nonatomic, strong) AVAudioPlayer *lightOnAudio;
@property (nonatomic, strong) AVAudioPlayer *lightOffAudio;
@property (nonatomic, strong) AVAudioPlayer *backToStartAudio;
@property (nonatomic, strong) NSMutableArray *audioStack;

@end
