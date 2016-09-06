//
//  ViewController.m
//  PushAndPop
//
//  Created by 王力 on 16/9/5.
//  Copyright © 2016年 王力. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AViewController () <AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) AVSpeechUtterance *utterance;
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 49)];
    self.textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    
    UIButton *eButton = [UIButton buttonWithType:UIButtonTypeCustom];
    eButton.frame = CGRectMake(100, 300, 100, 100);
    [eButton setTitle:@"A" forState:UIControlStateNormal];
    [eButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [eButton addTarget:self action:@selector(PushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:eButton];
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    aButton.frame = CGRectMake(100, 100, 100, 100);
    [aButton setTitle:@"语音合成" forState:UIControlStateNormal];
    [aButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [aButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aButton];
    
    UIButton *bButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bButton.frame = CGRectMake(200, 200, 100, 100);
    [bButton setTitle:@"停止" forState:UIControlStateNormal];
    [bButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [bButton addTarget:self action:@selector(stopSpeekingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bButton];
    
    UIButton *cButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cButton.frame = CGRectMake(100, 200, 100, 100);
    [cButton setTitle:@"暂停" forState:UIControlStateNormal];
    [cButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [cButton addTarget:self action:@selector(pauseSpeekingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cButton];
    
//    UIButton *dButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    dButton.frame = CGRectMake(100, 300, 100, 100);
//    [dButton setTitle:@"继续" forState:UIControlStateNormal];
//    [dButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [dButton addTarget:self action:@selector(continueSpeekingAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:dButton];
    
    //continueSpeaking
}

- (void)PushAction:(UIButton *)sender {
    BViewController *B = [[BViewController alloc] init];
    [self.navigationController pushViewController:B animated:YES];
}

//- (void)continueSpeekingAction:(UIButton *)sender {
//    if ([self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate]) {
//        [self.synthesizer continueSpeaking];
//    }
//}

- (void)pauseSpeekingAction:(UIButton *)sender {
    NSString *btnTitle = sender.titleLabel.text;
    if ([btnTitle isEqualToString:@"暂停"]) {
        if ([self.synthesizer isSpeaking]) {
            [self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
            [sender setTitle:@"继续" forState:UIControlStateNormal];
//            [sender.titleLabel setText:@"继续"];
        }
        
    } else {
        if ([self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate]) {
            [self.synthesizer continueSpeaking];
//            [sender.titleLabel setText:@"继续"];
            [sender setTitle:@"暂停" forState:UIControlStateNormal];
        }

    }
}

- (void)stopSpeekingAction:(UIButton *)sender {
    if ([self.synthesizer isSpeaking]) {
        [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"A:%@", self.navigationController.viewControllers);
    
}
- (void)buttonAction:(UIButton *)sender {
    [self.textField resignFirstResponder];
//    BViewController *B = [[BViewController alloc] init];
//    [self.navigationController pushViewController:B animated:YES];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    self.utterance = [AVSpeechUtterance speechUtteranceWithString:self.textField.text];
    self.utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CH"];
    self.utterance.rate = 0.4;
    [self.synthesizer speakUtterance:self.utterance];
    NSLog(@"%@", [AVSpeechSynthesisVoice speechVoices]);//获取语言类型
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
