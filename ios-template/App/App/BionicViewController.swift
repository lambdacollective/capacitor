//
//  BionicViewController.swift
//  App
//
//  Created by Jun Ho Hong on 2/14/20.
//

import Foundation
import Capacitor
import SafariServices

class BionicViewController: CAPBridgeViewController {
    
    lazy var containerView: UIView = self.createContainerView()
    lazy var loadingView: LoadingView = self.createLoadingView()
    lazy var topView: UIView = self.createTopView()
    
    lazy var backArrow = self.createBackArrow()
    lazy var forwardArrow = self.createForwardArrow()
    lazy var refreshButon = self.createRefreshButton()
    
    var currentOffset = CGPoint.zero
    
    let initialUrlString = "www.twitter.com"
//    let initialUrlString = "Juns-MacBook-Pro.local:3000"
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        load(with: initialUrlString)
        
        getWebView().scrollView.delegate = self
        getWebView().allowsBackForwardNavigationGestures = true
        getWebView().addObserver(self, forKeyPath: #keyPath(WKWebView.url), options: .new, context: nil)
        getWebView().addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    override func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            let vc = SFSafariViewController(url: navigationAction.request.url!)
            self.present(vc, animated: true, completion: nil)
        }
        return nil
    }
    override func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        super.webView(webView, didFail: navigation, withError: error)
        self.presentAlert(withMessage: error.localizedDescription)
        self.loadingView.hide()
    }
    override func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        super.webView(webView, didFailProvisionalNavigation: navigation, withError: error)
        self.presentAlert(withMessage: error.localizedDescription)
        self.loadingView.hide()
    }
    override func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        super.webView(webView, didFinish: navigation)
        print("did finish navigation")
        loadingView.hide()
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else { return }
        print(keyPath)
        backArrow.alpha = getWebView().canGoBack ? 1 : 0.5
        forwardArrow.alpha = getWebView().canGoForward ? 1: 0.5
        if keyPath == "estimatedProgress" {
            print(getWebView().estimatedProgress)
            if getWebView().estimatedProgress == 1 {
                print("100% loaded")
                self.loadingView.hide()
                return
            }
            if !self.loadingView.isLoading {
                self.loadingView.show()
                return
            }
        }
        
    }
    func hideTopView() {
        //        topView.snp.updateConstraints { (make) in
        //            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin).inset(-48)
        //        }
        
        topView.snp.updateConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).inset(0)
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.backArrow.alpha = 0
            self.forwardArrow.alpha = 0
            self.refreshButon.alpha = 0
            self.view.layoutIfNeeded()
        })
    }
    func showTopView() {
        //        topView.snp.updateConstraints { (make) in
        //            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin).inset(48)
        //        }
        //        UIView.animate(withDuration: 0.25, animations: {
        //            self.view.layoutIfNeeded()
        //        })
        topView.snp.updateConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).inset(43)
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.backArrow.alpha = self.getWebView().canGoBack ? 1 : 0.5
            self.forwardArrow.alpha = self.getWebView().canGoForward ? 1: 0.5
            self.refreshButon.alpha = 1
            self.view.layoutIfNeeded()
        })
    }
    func load(with urlString: String) {
        let fullUrlString = "http://\(urlString)"
        loadWebView(urlString: fullUrlString)
//        let myURL = URL(string: "https://\(urlString)")
//        let myRequest = URLRequest(url: myURL!)
//        self.getWebView().load(myRequest)
                loadingView.show()
    }
    func backPressed() {
        getWebView().goBack()
    }
    func forwardPressed() {
        getWebView().goForward()
    }
    func refreshPressed() {
        getWebView().reload()
    }
}

extension BionicViewController {
    func layout() {
        self.view.backgroundColor = Colors.white
        layoutTop()
        layoutContainer()
        layoutWebView()
        layoutLoading()
        self.view.bringSubviewToFront(topView)
    }
    func layoutContainer() {
        self.view.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    func layoutWebView() {
        self.containerView.addSubview(getWebView())
        getWebView().snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    func layoutLoading() {
        self.containerView.addSubview(loadingView)
        loadingView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    func layoutTop() {
        self.view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).inset(43)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}

extension BionicViewController {
    func createContainerView() -> UIView {
        let parentView = UIView()
        //        parentView.layer.shadowOpacity = 0.13
        //        parentView.layer.shadowRadius = 25
        //        parentView.layer.masksToBounds = false
        parentView.backgroundColor = Colors.white
        let view = UIView()
        view.backgroundColor = Colors.white
        view.layer.cornerRadius = 100
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        
        parentView.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return parentView
    }
    
    func createLoadingView() -> LoadingView {
        let view = LoadingView()
        return view
    }
    
    func createTopView() -> UIView {
        let container = UIView()
        container.backgroundColor = Colors.clear
        let inner = UIView()
        if traitCollection.userInterfaceStyle == .dark {
            inner.backgroundColor = Colors.black
            
        } else {
            inner.backgroundColor = Colors.white
        }
        //        container.layer.shadowColor = Colors.black.cgColor
        //        container.layer.shadowOpacity = 0.05
        //        container.layer.shadowRadius = 10
        container.layer.masksToBounds = false
        //        inner.layer.cornerRadius = 10
        inner.layer.masksToBounds = true
        inner.layer.borderColor = Colors.black.withAlphaComponent(0.3).cgColor
        inner.layer.borderWidth = 0
        container.addSubview(inner)
        inner.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        backArrow.isUserInteractionEnabled = true
        backArrow.selectBlock = {[weak self] in
            self?.backPressed()
        }
        inner.addSubview(backArrow)
        backArrow.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().inset(12)
            make.width.equalTo(10)
            make.height.equalTo(17.14)
        }
        forwardArrow.isUserInteractionEnabled = true
        forwardArrow.selectBlock = {[weak self] in
            self?.forwardPressed()
        }
        inner.addSubview(forwardArrow)
        forwardArrow.snp.makeConstraints { (make) in
            make.left.equalTo(backArrow.snp.right).offset(47)
            make.bottom.equalTo(backArrow)
            make.width.equalTo(10)
            make.height.equalTo(17.14)
        }
        refreshButon.isUserInteractionEnabled = true
        refreshButon.contentMode = .scaleAspectFit
        refreshButon.selectBlock = {[weak self] in
            self?.refreshPressed()
        }
        inner.addSubview(refreshButon)
        refreshButon.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(25)
            make.centerY.equalTo(backArrow)
            make.width.equalTo(23)
            make.height.equalTo(23)
        }
        return container
    }
    
    func createBackArrow() -> TouchableOpacityImageView {
        if traitCollection.userInterfaceStyle == .dark {
            return TouchableOpacityImageView(image: UIImage(named: "backArrow-1"))
            
        } else {
            return TouchableOpacityImageView(image: UIImage(named: "backArrow"))
        }
    }
    func createForwardArrow() -> TouchableOpacityImageView {
        if traitCollection.userInterfaceStyle == .dark {
            return TouchableOpacityImageView(image: UIImage(named: "forwardArrow-1"))
            
        } else {
            return TouchableOpacityImageView(image: UIImage(named: "forwardArrow"))
        }
    }
    func createRefreshButton() -> TouchableOpacityImageView {
        if traitCollection.userInterfaceStyle == .dark {
            return TouchableOpacityImageView(image: UIImage(named: "refreshButton-1"))
            
        } else {
            return TouchableOpacityImageView(image: UIImage(named: "refreshButton"))
        }
    }
}

extension BionicViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newOffset = scrollView.contentOffset
        //        if max(newOffset.y, 0) > max(currentOffset.y, 0) {
        //            hideTopView()
        //        } else {
        //            showTopView()
        //        }
//        return
        if newOffset.y <= 0 {
            showTopView()
        } else {
            hideTopView()
        }
        currentOffset = newOffset
    }
}

extension BionicViewController {
    
}
