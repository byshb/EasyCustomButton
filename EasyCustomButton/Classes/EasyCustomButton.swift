//
//  CustomButton.swift
//  CustomButton
//
//  Created by ZengJing on 2019/12/6.
//  Copyright © 2019 ZengJing. All rights reserved.
//
import UIKit

open class EasyCustomButton: UIButton {
    
    public enum CustomImagePosition {
        case top, left, bottom, right
    }
    
    public var midSpacing: CGFloat = 5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var imageSize: CGSize = .zero {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var imagePostion: CustomImagePosition = .left {
        didSet {
            setNeedsLayout()
        }
    }
    
    public convenience init(imagePostion: CustomImagePosition = .left,
                     midSpacing: CGFloat = 5,
                     title: String = "",
                     titleColor: UIColor = .black,
                     titleFont: UIFont = UIFont.systemFont(ofSize: 17),
                     image: UIImage? = nil,
                     backgroundImage: UIImage? = nil,
                     backgroundColor: UIColor = .white) {
        self.init(frame: .zero)
        self.midSpacing = midSpacing
        self.imagePostion = imagePostion
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
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        resetInset()
    }
    
    private func resetInset() {
        
        if __CGSizeEqualToSize(.zero, imageSize) {
            imageView?.sizeToFit()
        } else {
            imageView?.frame = CGRect(x: imageView?.frame.origin.x ?? 0,
                                      y: imageView?.frame.origin.y ?? 0,
                                      width: imageSize.width,
                                      height: imageSize.height)
        }
        titleLabel?.sizeToFit()
        
        switch imagePostion {
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
    
    override public func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image, for: state)
        setNeedsLayout()
    }
    
    override public func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        setNeedsLayout()
    }
    
    private func layoutHorizontal(leftView: UIView?, rightView: UIView?) {
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
    
    private func layoutVertical(upView: UIView?, downView: UIView?) {
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

