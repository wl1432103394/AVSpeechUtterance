# AVSpeechUtterance
语音合成

语音合成.

AVSpeechUtterance 语音表达 类
AVSpeechSynthesizer 语音合成 类
1 属性

'@property (nonatomic, strong) AVSpeechUtterance *utterance; //语音表达'
'@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer; //语音合成'
2初始化

self.synthesizer = [[AVSpeechSynthesizer alloc] init]; //初始化语音合成者
self.synthesizer.delegate = self; //代理 //初始化语音表达类 设置语音文字
self.utterance = [AVSpeechUtterance speechUtteranceWithString:self.textField.text];
self.utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CH"];//设置语言
self.utterance.rate = 0.4; //设置语速
[self.synthesizer speakUtterance:self.utterance];//合成语音并表达
NSLog(@"%@", [AVSpeechSynthesisVoice speechVoices]);//获取语言类型
//3 暂停\继续

- (void)pauseSpeekingAction:(UIButton *)sender {
NSString *btnTitle = sender.titleLabel.text;
if ([btnTitle isEqualToString:@"暂停"]) {
if ([self.synthesizer isSpeaking]) {//是否正在合成之后的表达
[self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];//暂停
[sender setTitle:@"继续" forState:UIControlStateNormal];
}
} else {
//是否处于暂停状态
if ([self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate]) {
[self.synthesizer continueSpeaking];//继续表达
[sender setTitle:@"暂停" forState:UIControlStateNormal];
}
}
}
//4 停止
`''
- (void)stopSpeekingAction:(UIButton *)sender {
if ([self.synthesizer isSpeaking]) {//是否正在表达
[self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];//停止
}
}`''
