/****************************************************************************
 Copyright (c) 2013      cocos2d-x.org
 Copyright (c) 2013-2016 Chukong Technologies Inc.
 Copyright (c) 2017-2018 Xiamen Yaji Software Co., Ltd.

 http://www.cocos2d-x.org

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#import "RootViewControllerShuPing.h"
#import "cocos2d.h"
#import "platform/ios/CCEAGLView-ios.h"
#import <WebKit/WebKit.h>
#import "AppController.h"


@implementation RootViewControllerShuPing

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    // Initialize the CCEAGLView
//    CCEAGLView *eaglView = [CCEAGLView viewWithFrame: [UIScreen mainScreen].bounds
//                                         pixelFormat: (__bridge NSString *)cocos2d::GLViewImpl::_pixelFormat
//                                         depthFormat: cocos2d::GLViewImpl::_depthFormat
//                                  preserveBackbuffer: NO
//                                          sharegroup: nil
//                                       multiSampling: NO
//                                     numberOfSamples: 0 ];
//
//    // Enable or disable multiple touches
//    [eaglView setMultipleTouchEnabled:NO];
//
//    // Set EAGLView as view of RootViewController
//    self.view = eaglView;
    
    
    self._webview = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self._webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://fromchat444.com/chat/chatClient/chatbox.jsp?companyID=287&configID=18&jid=&&s=1"]]];
////    [self.view addSubview:self._webview];
    self.view = self._webview;
    

}

-(void)openWebView:(NSString*)urlstr{
//    self._webview = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self._webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://fromchat444.com/chat/chatClient/chatbox.jsp?companyID=287&configID=18&jid=&&s=1"]]];
//    [self.view addSubview:self._webview];
//    self.view = self._webview;
    if(![urlstr isEqualToString:openURl]){
        openURl = urlstr;
//        [self._webview release];
        [self._webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]]];
    }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


// For ios6, use supportedInterfaceOrientations & shouldAutorotate instead
- (NSUInteger) supportedInterfaceOrientations{
#ifdef __IPHONE_6_0
//    return UIInterfaceOrientationMaskLandscape;
    return UIInterfaceOrientationMaskPortrait;
}
#endif


- (BOOL) shouldAutorotate {
    return NO;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];

    [self resetGLView];
}

-(void)resetGLView{
    auto glview = cocos2d::Director::getInstance()->getOpenGLView();

    if (glview)
    {
        CCEAGLView *eaglview = (__bridge CCEAGLView *)glview->getEAGLView();

        if (eaglview)
        {
            CGSize s = CGSizeMake([eaglview getWidth], [eaglview getHeight]);
            cocos2d::Application::getInstance()->applicationScreenSizeChanged((int) s.width, (int) s.height);
        }
    }
}

//fix not hide status on ios7
- (BOOL)prefersStatusBarHidden {
    return YES;
}

// Controls the application's preferred home indicator auto-hiding when this view controller is shown.
// (better use preferredScreenEdgesDeferringSystemGestures for controlling the home indicator)
- (BOOL)prefersHomeIndicatorAutoHidden {
    return NO;
}

// HOME Indicator need to be tapped twice
-(UIRectEdge)preferredScreenEdgesDeferringSystemGestures
{
    return UIRectEdgeBottom;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}


@end
