//
//  ViewController.h
//  LoginView
//
//  Created by Htet Moe Phyu on 20/11/2021.
//

#import <UIKit/UIKit.h>
#import "MDCTextField.h"
#import "MDCTextInputControllerOutlined.h"
#import "MDCButton.h"

@interface LoginViewController : UIViewController

@property(nonatomic) UIScrollView *scrollView;

@property(nonatomic) MDCTextField *usernameTextField;
@property(nonatomic) MDCTextField *passwordTextField;

@property(nonatomic) MDCTextInputControllerOutlined *usernameTextFieldController;
@property(nonatomic) MDCTextInputControllerOutlined *passwordTextFieldController;

// Button Properties
@property(nonatomic) MDCButton *registerButton;
@property(nonatomic) MDCButton *loginButton;

@property(nonatomic) UILabel *titleLabel;
@property(nonatomic) UIImageView *logoImageView;
@property(nonatomic) UILabel *noAccountLabel;
@property(nonatomic) UIButton *forgotPasswordButton;

@end

