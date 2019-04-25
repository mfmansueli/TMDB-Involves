//
//  ViewController.swift
//  IMDBInvolves
//
//  Created By Mateus on 04/11/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit
import RxSwift
import MBProgressHUD

class ViewController: UIViewController {
    
    var internalScrollView: UIScrollView?
    var buttonNextConstraintBottom: NSLayoutConstraint?
    let disposeBag = DisposeBag()
    let isLoading = Variable<Bool>(false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNavigationBar()
        prepare()
        bindViewModel()
    }
    
    func bindViewModel() {
        isLoading.asDriver()
            .drive(onNext: { [weak self] isLoading in
                if isLoading {
                    self?.showLoading()
                } else {
                    self?.hideLoading()
                }
            })
            .disposed(by: disposeBag)
    }
    func initializeNavigationBar() {}
    func prepare() {}
    
    func showLoading() {
        view.endEditing(true)
        let hud = MBProgressHUD.showAdded(to: findTopMostViewController().view, animated: true)
        hud.backgroundView.color = UIColor.black.withAlphaComponent(CGFloat(Constants.alphaLoading))
        hud.backgroundView.style = .solidColor
    }
    
    func hideLoading() {
        MBProgressHUD.hide(for: findTopMostViewController().view, animated: true)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private struct Constants {
        static let buttonFrameXY = 0
        static let buttonFrameWidthHeight = 0
        static let alphaLoading =  CGFloat(0.35)
    }
    
    func showAlert(title: String, message: String, buttonText: String,
                   alertAction: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
                alertAction()
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertTwoButtons(title: String, message: String, cancelButtonText: String, buttonText: String,
                             alertAction: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
                alertAction()
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }}))
        alert.addAction(UIAlertAction(title: cancelButtonText, style: .cancel, handler: { action in
            switch action.style {
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc
    func dismissKeyboard(_ gesture: UITapGestureRecognizer) {
        let viewGesture = gesture.view
        let loc = gesture.location(in: viewGesture)
        if let subview = viewGesture?.hitTest(loc, with: nil), subview.isKind(of: UIButton.self) {
            return
        }
        view.endEditing(true)
    }
    
    func push(to viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
//
//// MARK: - Keyboard Configuration
//extension ViewController: UIScrollViewDelegate {
//
//
//    func addButtonItem(image: UIImage?, selector: Selector) -> UIBarButtonItem {
//        let buttonFrame: CGRect = CGRect(x: Constants.buttonFrameXY,
//                                         y: Constants.buttonFrameXY,
//                                         width: Constants.buttonFrameWidthHeight,
//                                         height: Constants.buttonFrameWidthHeight)
//
//        let exitButton: UIButton = UIButton(type: .system)
//        exitButton.setImage(image, for: .normal)
//        exitButton.frame = buttonFrame
//        exitButton.addTarget(self, action: selector, for: .touchUpInside)
//        return UIBarButtonItem(customView: exitButton)
//    }
//
//    func keyboardDismissable() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
//        view.addGestureRecognizer(tap)
//        tap.cancelsTouchesInView = false
//    }
//
//    func observeKeyboardNotifications(with scrollView: UIScrollView?) {
//        internalScrollView = scrollView
//        internalScrollView?.delegate = self
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillShow),
//            name: NSNotification.Name.UIKeyboardWillShow,
//            object: nil
//        )
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillHide),
//            name: NSNotification.Name.UIKeyboardWillHide,
//            object: nil
//        )
//    }
//
//    @objc private func keyboardWillShow(_ notification: NSNotification) {
//        guard let info = notification.userInfo,
//            let keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
//            let animationDuration = (info[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
//            else { return }
//
//        if let constraint = buttonNextConstraintBottom {
//
//            UIView.animate(
//                withDuration: animationDuration,
//                delay: 0,
//                options: UIViewAnimationOptions.curveEaseIn,
//                animations: { () -> Void in
//                    constraint.constant = keyboardSize.height
//                    self.view.layoutIfNeeded()
//            })
//        }
//        keyboardWillAppear(with: keyboardSize.size, duration: animationDuration)
//    }
//
//    @objc private func keyboardWillHide(_ notification: NSNotification) {
//        guard let info = notification.userInfo,
//            let keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size,
//            let animationDuration = (info[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
//            else { return }
//
//        if let constraint = buttonNextConstraintBottom {
//            constraint.constant = 0
//            internalScrollView?.contentInset = UIEdgeInsets.zero
//            self.view.layoutIfNeeded()
//        }
//        keyboardWillDisappear(with: keyboardSize, duration: animationDuration)
//    }
//
//    func scrollToTopView(point: CGPoint) {
//        internalScrollView?.setContentOffset(point, animated: true)
//    }
//
//    func keyboardWillAppear(with size: CGSize, duration: TimeInterval) {
//        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
//        internalScrollView?.contentInset = contentInsets
//        internalScrollView?.scrollIndicatorInsets = contentInsets
//
//        var rect = view.frame
//        rect.size.height -= size.height
//        guard let activeTextFieldFrame = findActiveTextField(view.subviews) else { return }
//
//        if !rect.contains(activeTextFieldFrame.origin) {
//            internalScrollView?.scrollRectToVisible(activeTextFieldFrame, animated: true)
//        }
//    }
//
//    func keyboardWillDisappear(with size: CGSize, duration: TimeInterval) {
//        let contentInsets = UIEdgeInsets.zero
//        internalScrollView?.contentInset = contentInsets
//        internalScrollView?.scrollIndicatorInsets = contentInsets
//    }
//
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        //        view.endEditing(true)
//    }
//}
