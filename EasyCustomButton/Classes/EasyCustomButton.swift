//
//  CustomButton.swift
//  CustomButton
//
//  Created by ZengJing on 2019/12/6.
//  Copyright © 2019 ZengJing. All rights reserved.
//
import UIKit

@IBDesignable class EasyCustomButton: UIButton {

    enum CustomImagePosition: Int {
        case top, left, bottom, right
    }
    
    @IBInspectable public var midSpacing: CGFloat = 5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var imageSize: CGSize = .zero {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable public var imagePostion: Int = 0 {
        didSet {
            self.imagePostionStyle = CustomImagePosition.init(rawValue: imagePostion) ?? .left
        }
    }
    
    private var imagePostionStyle: CustomImagePosition = .left

    convenience init(imagePostionStyle: CustomImagePosition = .left,
                     midSpacing: CGFloat = 5,
                     title: String = "",
                     titleColor: UIColor = .black,
                     titleFont: UIFont = UIFont.systemFont(ofSize: 17),
                     image: UIImage? = nil,
                     backgroundImage: UIImage? = nil,
                     backgroundColor: UIColor = .white) {
        self.init(frame: .zero)
        self.midSpacing = midSpacing
        self.imagePostionStyle = imagePostionStyle
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        setImage(image, for: .normal)
        setBackgroundImage(backgroundImage, for: .normal)
        self.backgroundColor = backgroundColor
    }
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resetInset()
    }
    
    func resetInset() {
        
        if __CGSizeEqualToSize(.zero, imageSize) {
            imageView?.sizeToFit()
        } else {
            imageView?.frame = CGRect(x: imageView?.frame.origin.x ?? 0,
                                      y: imageView?.frame.origin.y ?? 0,
                                      width: imageSize.width,
                                      height: imageSize.height)
        }
        titleLabel?.sizeToFit()
        
        switch imagePostionStyle {
        case .top:
            layoutVertical(upView: imageView, downView: titleLabel)
        case .left:
            layoutHorizontal(leftView: imageView, rightView: titleLabel)
        case .bottom:
            layoutVertical(upView: titleLabel, downView: imageView)
        case .right:
            layoutHorizontal(leftView: titleLabel, rightView: imageView)
        }
    }
    
    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image, for: state)
        setNeedsLayout()
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        setNeedsLayout()
    }
    
    func layoutHorizontal(leftView: UIView?, rightView: UIView?) {
        var leftViewFrame: CGRect = leftView?.frame ?? .zero
        var rightViewFrame: CGRect = rightView?.frame ?? .zero
        let totalWidth: CGFloat = leftViewFrame.width + self.midSpacing + rightViewFrame.width
        leftViewFrame.origin.x = (self.frame.width - totalWidth)/2.0
        leftViewFrame.origin.y = (self.frame.height - leftViewFrame.height)/2.0
        leftView?.frame = leftViewFrame
        rightViewFrame.origin.x = leftViewFrame.maxX + self.midSpacing
        rightViewFrame.origin.y = (self.frame.height - rightViewFrame.height)/2.0
        rightView?.frame = rightViewFrame
    }
    
    func layoutVertical(upView: UIView?, downView: UIView?) {
        var upViewFrame: CGRect = upView?.frame ?? .zero
        var downViewFrame: CGRect = downView?.frame ?? .zero
        let totalHeight: CGFloat = upViewFrame.size.height + self.midSpacing + downViewFrame.size.height
        upViewFrame.origin.y = (self.frame.size.height - totalHeight)/2.0
        upViewFrame.origin.x = (self.frame.size.width - upViewFrame.size.width)/2.0
        upView?.frame = upViewFrame
        downViewFrame.origin.y = upViewFrame.maxY + self.midSpacing
        downViewFrame.origin.x = (self.frame.width - downViewFrame.width)/2.0
        downView?.frame = downViewFrame
    }
}

