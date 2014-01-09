//
//  ViewController.m
//  MySafari
//
//  Created by Matthew Graham on 1/9/14.
//  Copyright (c) 2014 Matthew Graham. All rights reserved.
//

#import "ViewController.h"
#include <math.h>

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIScrollViewDelegate>
{
    __weak IBOutlet UITextField *myURLTextField;
    __weak IBOutlet UIWebView *myWebView;
    __weak IBOutlet UIButton *myBackButton;
    
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UINavigationItem *myNavigationTitle;
    __weak IBOutlet UIButton *myReloadButton;
    __weak IBOutlet UIButton *myNewFeaturesButton;
    __weak IBOutlet UIButton *myStopButton;
    
    __weak IBOutlet UIButton *myForwardButton;
    
    __weak IBOutlet UIView *myButtonView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myWebView.scrollView.delegate = self;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *userInputURLString = myURLTextField.text;
    BOOL hasHTTP = [[userInputURLString lowercaseString] hasPrefix:@"http://"];
    
    if (hasHTTP == NO) {
       userInputURLString = [NSString stringWithFormat:@"http://%@", userInputURLString];
        
        
        
    }
    
    
    NSURL *userInputURL = [NSURL URLWithString:userInputURLString];
    NSURLRequest *userURLRequest = [NSURLRequest requestWithURL:userInputURL];
    [myWebView loadRequest:userURLRequest];
    [myURLTextField resignFirstResponder];
    return YES;
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    
    NSString *anyHTTP = myWebView.request.URL.absoluteString;
    myURLTextField.text = anyHTTP;


     NSString *pageTitle = [myWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
   titleLabel.text  = pageTitle;

}



- (IBAction)onBackButtonPressed:(id)sender {
    
    [myWebView goBack];
    
}

- (IBAction)onForwardButtonPressed:(id)sender {
    
    [myWebView goForward];
}

- (IBAction)onStopLoadingButtonPressed:(id)sender {
    
    [myWebView stopLoading];
    
}


- (IBAction)onReloadButtonPressed:(id)sender {
    
    [myWebView reload];
}

- (IBAction)onNewFeaturesButtonPressed:(id)sender {
    
    UIAlertView *newFeaturesAlert = [[UIAlertView alloc] initWithTitle:@"Coming Soon!" message:@"Check back to see our awesome new features" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [newFeaturesAlert show];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSString *scrollContentOffset = [NSString stringWithFormat:@"%f",scrollView.contentOffset.y ];
    NSLog(scrollContentOffset);
    if (scrollView.contentOffset.y > 0)
    {
        myURLTextField.alpha = 0;
        myBackButton.alpha = 0;
        myForwardButton.alpha = 0;
        myNewFeaturesButton.alpha = 0;
        myReloadButton.alpha = 0;
        myStopButton.alpha = 0;
        myButtonView.alpha = ( 1- (scrollView.contentOffset.y/100));
        
        
    }
    if (scrollView.contentOffset.y <= 0)
    {
        myURLTextField.alpha = 1;
        myBackButton.alpha = 1;
        myForwardButton.alpha = 1;
        myNewFeaturesButton.alpha = 1;
        myReloadButton.alpha = 1;
        myStopButton.alpha = 1;
        myButtonView.alpha = 1 ;
    }
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
