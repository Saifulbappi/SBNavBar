## Synopsis

SBNavBar is a UIView which has been designed for a flexible  Navigation Bar with enormous customizing capabilities.
[Sample1](Sample1.png)
[Sample2](Sample2.png)

## Code Example

A Sample NavigationBar with a back button and a title.

``` objective-c

SBNavBarView * fakeNav = [[SBNavBarView alloc] init];
[self.view addSubview:fakeNav];
[fakeNav attachConstraints];
[fakeNav standardNavTitle:@"Sweet NavBar" withBackBtnSeletor:@selector(firstBtnClicked) forViewController:self];

```
More Setup examples are given in ViewDidLoad method of ViewController Class in Sample Project.
Check those out for more understanding the customizing capabilities.



## Motivation

UINavigationBar does not spare us the ability to fully customize naviagation bar as we want. Moreover with major version updates, its layout structure changes sometimes- which becomes a bit pain in the ass for existing projects. SBNavBar is a fake navBar ,which gives enormous customizing ability and stability for navigationBar controls.

## Installation
 Just Copy the NavBar folder in your project.





