//
//  MCWebViewController.m
//  Miracast
//
//  Created by Kun Wang on 2018/7/17.
//  Copyright © 2018年 Kun Wang. All rights reserved.
//

#import "MCBrowserViewController.h"
#import <MiracastSDK/Miracast.h>
#import "NJKWebViewProgress.h"

@interface MCBrowserViewController ()<UISearchBarDelegate, NJKWebViewProgressDelegate, UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *collectButton;
@property (nonatomic, strong) NJKWebViewProgress *progress;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic, strong) NSURL *homeURL;
@end

@implementation MCBrowserViewController

- (instancetype)initWithURL:(NSString *)urlString
{
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        if (![urlString hasPrefix:@"http://"]) {
            urlString = [@"http://" stringByAppendingString:urlString];
        }
        urlString = [urlString stringByReplacingOccurrencesOfString:@"/m." withString:@"/www."];
        if ([urlString hasSuffix:@"/"]) {
            urlString = [urlString substringToIndex:urlString.length - 1];
        }
        NSURL *url = [NSURL URLWithString:urlString];
        _homeURL = url;
    }
    return self;
}

- (void)dealloc
{
    [MCRenderManager sharedManager].renderURLString = nil;
    [MCRenderManager sharedManager].renderTitle = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    UITextField *searchField = [self.searchBar valueForKey:@"searchField"];
    if (searchField) {
        [searchField setBackgroundColor:[UIColor grayColor]];
        searchField.layer.cornerRadius = 0;
        searchField.layer.borderColor = [UIColor whiteColor].CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
        searchField.textColor = [UIColor whiteColor];
    }
    _searchBar.tintColor = [UIColor whiteColor];
    _searchBar.text = _homeURL.absoluteString;
    _progress = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _progress;
    _progress.webViewProxyDelegate = self;
    _progress.progressDelegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:_homeURL]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
    [self.webView goForward];
}

- (IBAction)forward:(id)sender {
    [self.webView goBack];
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    self.progressView.progress = progress;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.progressView.hidden = NO;
    self.progressView.progress = 0;
    self.backButton.enabled = webView.canGoBack;
    self.nextButton.enabled = webView.canGoForward;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    self.backButton.enabled = webView.canGoBack;
    self.nextButton.enabled = webView.canGoForward;
    if ([request.URL.absoluteString isEqualToString:self.searchBar.text]) {
        return NO;
    }
    [MCRenderManager sharedManager].renderTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.progressView.hidden = YES;
    self.backButton.enabled = webView.canGoBack;
    self.nextButton.enabled = webView.canGoForward;
    [MCRenderManager sharedManager].renderTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.searchBar.text = webView.request.URL.absoluteString;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    self.progressView.hidden = YES;
    self.backButton.enabled = webView.canGoBack;
    self.nextButton.enabled = webView.canGoForward;
    [MCRenderManager sharedManager].renderTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
    NSString *content = searchBar.text;
    if (![content hasPrefix:@"http"]) {
        content = [@"http://" stringByAppendingString:content];
    }
    NSURL *url = [NSURL URLWithString:content];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (IBAction)onCollectButtonClicked:(id)sender {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:self.webView.request.URL.absoluteString message:nil preferredStyle:UIAlertControllerStyleAlert];
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    [controller addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Add", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
