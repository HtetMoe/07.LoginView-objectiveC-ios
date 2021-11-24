//
//  ViewController.m
//  LoginView
//  Created by Htet Moe Phyu on 20/11/2021.

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()
@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    
    // hide nav bar
    //self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
#pragma mark - Init Views
    //scroll view init
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    //set margin
    self.scrollView.layoutMargins = UIEdgeInsetsMake(0, 20, 0, 20);
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height *2);
    [self.view addSubview:self.scrollView];
    
    //scrollView horizontal and vertical constraints
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:@{@"scrollView" : self.scrollView}]];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:@{@"scrollView" : self.scrollView}]];
    
    UITapGestureRecognizer *tapGestureRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDidTouch:)];
    [self.scrollView addGestureRecognizer:tapGestureRecognizer];

    //Logo Init
    UIImage *logoImage = [UIImage imageNamed:@"PNCLogo"];
    self.logoImageView  = [[UIImageView alloc]initWithImage:logoImage];
    self.logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.logoImageView];
    
    //[self.logoImageView.layer setBorderColor: [[UIColor blackColor] CGColor]];
    //[self.logoImageView.layer setBorderWidth:1];
    
    //Title Init
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = @"POSH & CONFORT";
    [self.scrollView addSubview:self.titleLabel];

    // Text Field Init
    self.usernameTextField = [[MDCTextField alloc] initWithFrame:CGRectZero];
    self.usernameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    //self.usernameTextField.delegate = self;
    self.usernameTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    [self.scrollView addSubview:self.usernameTextField];

    self.usernameTextFieldController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.usernameTextField];
    self.usernameTextFieldController.activeColor = UIColor.grayColor;
    self.usernameTextFieldController.floatingPlaceholderActiveColor = UIColor.blackColor;
    self.usernameTextFieldController.placeholderText = @"UserName";

    //pwTF Init
    self.passwordTextField = [[MDCTextField alloc] initWithFrame:CGRectZero];
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    //self.passwordTextField.delegate = self;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    self.passwordTextField.secureTextEntry = YES;
    [self.scrollView addSubview:self.passwordTextField];

    self.passwordTextFieldController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.passwordTextField];
    self.passwordTextFieldController.activeColor = UIColor.grayColor;
    self.passwordTextFieldController.floatingPlaceholderActiveColor = UIColor.blackColor;
    self.passwordTextFieldController.placeholderText = @"Password";

    //Btn Login Init
    self.loginButton = [[MDCButton alloc] initWithFrame:CGRectZero];
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(pressedLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.loginButton];
    
    //Btn forgotPw Init
    self.forgotPasswordButton = [[MDCButton alloc] initWithFrame:CGRectZero];
    self.forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.forgotPasswordButton setTitle:@" Forgot Password?" forState:UIControlStateNormal];
    [self.forgotPasswordButton addTarget:self action:@selector(pressedForgotPasswordButton:) forControlEvents:UIControlEventTouchUpInside];
    self.forgotPasswordButton.backgroundColor = UIColor.whiteColor;
    [self.forgotPasswordButton setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    [self.scrollView addSubview:self.forgotPasswordButton];
    
    //noAccountLbl Init
    self.noAccountLabel = [[UILabel alloc]init];
    self.noAccountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.noAccountLabel.text = @"If you don't have account?";
    [self.noAccountLabel setFont:[UIFont systemFontOfSize:14]];
    [self.scrollView addSubview:self.noAccountLabel];
    
    //registerString Init
    NSMutableAttributedString *strRegister = [[NSMutableAttributedString alloc] initWithString:@"REGISTER"];
    [strRegister addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [strRegister length])];
    
    //Btn Register Init
    self.registerButton = [[MDCButton alloc] init];
    self.registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.registerButton setAttributedTitle:strRegister forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(pressedRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
    self.registerButton.backgroundColor = UIColor.whiteColor;
    [self.registerButton setTitleColor:[UIColor colorWithRed: 0.55 green: 0.32 blue: 1.00 alpha: 1.00] forState:UIControlStateNormal];
    [self.scrollView addSubview:self.registerButton];
    
    
#pragma mark - Layout Constraints
    NSMutableArray<NSLayoutConstraint *> *constraints = [[NSMutableArray alloc]init];
    //logo
    NSLayoutConstraint *logoTopConstraint = [NSLayoutConstraint constraintWithItem:self.logoImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView.contentLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [constraints addObject:logoTopConstraint];

    //set logo center
    NSLayoutConstraint *centerLogoConstraint = [NSLayoutConstraint constraintWithItem:self.logoImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    [constraints addObject:centerLogoConstraint];

    //title
    NSLayoutConstraint *titleTopConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.logoImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:20];
    [constraints addObject:titleTopConstraint];

    //set title center
    NSLayoutConstraint *centerTitleConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    [constraints addObject:centerTitleConstraint];

    // Text Field Constraints
    NSLayoutConstraint *usernameTopConstraint = [NSLayoutConstraint constraintWithItem:self.usernameTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:18];
    [constraints addObject:usernameTopConstraint];

    //set userName center
    NSLayoutConstraint *centerUsernameConstraint = [NSLayoutConstraint constraintWithItem:self.usernameTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    [constraints addObject:centerUsernameConstraint];

    // userName h constraint
    NSArray<NSLayoutConstraint *> *horizontalUsernameConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[username]-|" options:0 metrics:nil views:@{@"username" :self.usernameTextField}];
    [constraints addObjectsFromArray:horizontalUsernameConstraints];

    //password
    NSLayoutConstraint *passwordTopConstraint = [NSLayoutConstraint constraintWithItem:self.passwordTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.usernameTextField attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [constraints addObject:passwordTopConstraint];

    //set pwTF center
    NSLayoutConstraint *centerPasswordConstraint = [NSLayoutConstraint constraintWithItem:self.passwordTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    [constraints addObject:centerPasswordConstraint];

    //pwTF h constraint
    NSArray<NSLayoutConstraint *> *horizontalPasswordConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[password]-|" options:0 metrics:nil views:@{@"password":self.passwordTextField}];
    [constraints addObjectsFromArray:horizontalPasswordConstraints];
    
    //loginBtn
    NSLayoutConstraint *loginButtonTopConstraint = [NSLayoutConstraint constraintWithItem:self.loginButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.passwordTextField attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [constraints addObject:loginButtonTopConstraint];
    
    //loginBtn h constraint
    NSArray<NSLayoutConstraint *> *horizontalLoginBtnConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[loginBtn]-|" options:0 metrics:nil views:@{@"loginBtn" :self.loginButton}];
    [constraints addObjectsFromArray:horizontalLoginBtnConstraints];
    
    //loginBtn height constraint
    NSArray<NSLayoutConstraint *> *loginBtnHeightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[loginBtn(==45)]" options:0 metrics:nil views:@{@"loginBtn" :self.loginButton}];
    [constraints addObjectsFromArray:loginBtnHeightConstraint];
    
    //btnForgotPw
    NSLayoutConstraint *forgotPasswordTopConstraint = [NSLayoutConstraint constraintWithItem:self.forgotPasswordButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.loginButton attribute:NSLayoutAttributeBottom multiplier:1 constant:3];
    [constraints addObject:forgotPasswordTopConstraint];
    
    //noAccountLbl
    NSLayoutConstraint *noAccountLblTopConstraint = [NSLayoutConstraint constraintWithItem:self.noAccountLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.forgotPasswordButton attribute:NSLayoutAttributeBottom multiplier:1 constant:24];
    [constraints addObject:noAccountLblTopConstraint];

    //set noAccountLbl center
    NSLayoutConstraint *centerNoAccountLblConstraint = [NSLayoutConstraint constraintWithItem:self.noAccountLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    [constraints addObject:centerNoAccountLblConstraint];
    
    //registerBtn
    NSLayoutConstraint *registerBtnTopConstraint = [NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.noAccountLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [constraints addObject:registerBtnTopConstraint];
    
    //set registerBtn center
    NSLayoutConstraint *centerRegisterBtnConstraint = [NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    [constraints addObject:centerRegisterBtnConstraint];
    
    //bottom constraint
    NSLayoutConstraint *registerBtnBottomConstraint = [NSLayoutConstraint constraintWithItem:self.registerButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView.contentLayoutGuide attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:-20];
    [constraints addObject:registerBtnBottomConstraint];
    
    [NSLayoutConstraint activateConstraints:constraints];
}

#pragma mark - Gesture Handling
- (void)tapDidTouch:(UIGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

#pragma mark - Action Handling
- (void)pressedLoginButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//Register VC
- (void)pressedRegisterButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
    RegisterViewController *registerVC=[[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:registerVC animated:nil];
}

//ForgotPw VC
- (void)pressedForgotPasswordButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
