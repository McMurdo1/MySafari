//
//  ViewController.m
//  MySafari
//
//  Created by Matthew Graham on 1/9/14.
//  Copyright (c) 2014 Matthew Graham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>
{
    __weak IBOutlet UITextField *myURLTextField;
    __weak IBOutlet UIWebView *myWebView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSURL *userInputURL = [NSURL URLWithString:myURLTextField.text];
    NSURLRequest *userURLRequest = [NSURLRequest requestWithURL:userInputURL];
    [myWebView loadRequest:userURLRequest];
    return YES;
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
