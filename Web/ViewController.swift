//
//  ViewController.swift
//  Web
//
//  Created by Nam on 2024/06/28.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    // 시작할 때 지정 웹페이지 보여주기
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myWebView.navigationDelegate = self // 웹 뷰가 로딩중인지 살펴보기 위한 델리게이트
        loadWebPage("http://2sam.net")
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating() // 웹 뷰가 로딩 중일 때 인디케이터 실행해서 화면 표출
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating() // 로딩이 완료되면 인디케이터 중지 & 숨김
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating() // 로딩 실패 시에도 중지 & 숨김
        myActivityIndicator.isHidden = true
    }

    @IBAction func btnGoUrl(_ sender: Any) {
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
    }
    
    
    
}

