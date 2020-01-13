# EasyCustomButton

[![CI Status](https://img.shields.io/travis/xiaohualao/EasyCustomButton.svg?style=flat)](https://travis-ci.org/xiaohualao/EasyCustomButton)
[![Version](https://img.shields.io/cocoapods/v/EasyCustomButton.svg?style=flat)](https://cocoapods.org/pods/EasyCustomButton)
[![License](https://img.shields.io/cocoapods/l/EasyCustomButton.svg?style=flat)](https://cocoapods.org/pods/EasyCustomButton)
[![Platform](https://img.shields.io/cocoapods/p/EasyCustomButton.svg?style=flat)](https://cocoapods.org/pods/EasyCustomButton)

## Features
* [x] Quickly customize the relative position of the picture and text buttons
* [x] Quickly customize the basic information of color, picture and other basic buttons
* [x] Support for setting relative text and image spacing in xib

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

EasyCustomButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'EasyCustomButton' , '1.0.1'
end
```

Then, run the following command:
`$ pod install`

## Usage

1. Quickly customize a normal style button：


```
let button = EasyCustomButton.init(title: "测试", titleColor: .black, titleFont: UIFont.systemFont(ofSize: 20), image: UIImage(named: "haowu_home"), backgroundColor: .red)
view.addSubview(button)
```

Or：

```
let button = EasyCustomButton.init(titleColor: .black, titleFont: UIFont.systemFont(ofSize: 20), image: UIImage(named: "haowu_home"), backgroundColor: .red)    
button.setTitle("测试", for: .normal)      
view.addSubview(button)
```

2. Quickly customize the relative position of the picture and text buttons

```
let button = EasyCustomButton.init(imagePostionStyle: .left, midSpacing: 20, title: "测试", titleColor: .black, titleFont: UIFont.systemFont(ofSize: 20), image: UIImage(named: "haowu_home"), backgroundImage: nil, backgroundColor: .green)
button.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
view.addSubview(button)
```
 Or `setting relative text and image spacing in xib`

## Author

xiaohualao, zengjing@sdiread.com

## License

EasyCustomButton is available under the MIT license. See the LICENSE file for more info.
