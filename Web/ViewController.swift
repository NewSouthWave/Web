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
        let myUrl = URL(string: url)    // url 값으 받아 URL형으로 상수 선언
        let myRequest = URLRequest(url: myUrl!) // URLRequest형 상수 선언
        myWebView.load(myRequest)   // myWebView 클래스의 load 메서드 호출
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

    func checkUrl(_ url: String) -> String {
        var strUrl = url    // 입력받은 url 저장
        let flag = strUrl.hasPrefix("http://")  // 'http://' 를 가지고 있는지 확인한 값을 flag에 넣는다
        if !flag {  // http가 붙어있지 않다면 자동으로 추가
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGoUrl(_ sender: UIButton) {   // 텍스트 필드에 적힌 주소로 웹 뷰에 로딩
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://tension-code.tistory.com/")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://soundcloud.com/discover")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지 </p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"   // html문을 변수에 저장
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {    // html 파일이 웹뷰에 나타나도록 함
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() // 웹페이지 로딩 중지
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()  //웹페이지 재로딩
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()  //이전 웹페이지로 이동
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()   //다음 웹페이지로 이동
    }
    
    
    
}

