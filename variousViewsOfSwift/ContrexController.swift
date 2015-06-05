//
//  ContrexController.swift
//  variousViewsOfSwift
//
//  Created by 酒井文也 on 2015/04/25.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class ContrexController: UIViewController, UIScrollViewDelegate {
    
    //ページ数
    let pageNumber = 2;
    
    //スクロールビューにはめる画像の縦サイズ
    var deviceImageHeight: CGFloat!
    
    //スクロールビューにはめる画像の横サイズ
    var deviceImageWidth: CGFloat!
    
    //スクロールビューにセットする画像
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    //スクロールビューのインスタンス
    @IBOutlet var imageScrollView: UIScrollView!
    //ページコントロールのインスタンス
    @IBOutlet var imagePageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //セットする画像の決定
        self.setImagePathOfDevice()
        
        //対象画像の縦・横サイズを決定
        deviceImageHeight = self.view.frame.size.height - 110
        deviceImageWidth = self.view.frame.size.width
        
        //スクロールビューの設定
        self.imageScrollView.contentSize = CGSizeMake(
            self.view.frame.size.width,
            deviceImageHeight * CGFloat(pageNumber + 1)
        )

        // ページコントロールの初期値設定
        self.imagePageControl.currentPage = 0
        
        // ページするオプションを有効にするための設定（今回は縦にスクロール）
        self.imageScrollView.delegate = self
        self.imageScrollView.pagingEnabled = true
        self.imageScrollView.scrollEnabled = true
        self.imageScrollView.directionalLockEnabled = true
        self.imageScrollView.showsHorizontalScrollIndicator = false
        self.imageScrollView.showsVerticalScrollIndicator = true
        self.imageScrollView.bounces = true
        self.imageScrollView.scrollsToTop = false
        
        //UIImageViewを3つ作成してScrollViewへ追加
        var firstImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: deviceImageWidth, height: deviceImageHeight))
        firstImageView.image = image1
        self.imageScrollView.addSubview(firstImageView)
        
        var secondImageView = UIImageView(frame: CGRect(x: 0, y: deviceImageHeight, width: deviceImageWidth, height: deviceImageHeight))
        secondImageView.image = image2
        self.imageScrollView.addSubview(secondImageView)
        
        var thirdImageView = UIImageView(frame: CGRect(x: 0, y: deviceImageHeight * 2, width: deviceImageWidth, height: deviceImageHeight))
        thirdImageView.image = image3
        self.imageScrollView.addSubview(thirdImageView)
    }
    
    //デバイスごとの画像をメンバ変数へセットする
    func setImagePathOfDevice() {
        
        //現在起動中のデバイスを取得（スクリーンの幅・高さ）
        let screenWidth  = DeviseSize.screenWidth()
        let screenHeight = DeviseSize.screenHeight()
        
        //iPhone4s
        if(screenWidth == 320 && screenHeight == 480){
            
            self.image1 = UIImage(named: "iphone4s_1.jpg")
            self.image2 = UIImage(named: "iphone4s_2.jpg")
            self.image3 = UIImage(named: "iphone4s_3.jpg")
            
        //iPhone5またはiPhone5s
        }else if (screenWidth == 320 && screenHeight == 568){
            
            self.image1 = UIImage(named: "iphone5_1.jpg")
            self.image2 = UIImage(named: "iphone5_2.jpg")
            self.image3 = UIImage(named: "iphone5_3.jpg")
            
        //iPhone6
        }else if (screenWidth == 375 && screenHeight == 667){
            
            self.image1 = UIImage(named: "iphone6_1.jpg")
            self.image2 = UIImage(named: "iphone6_2.jpg")
            self.image3 = UIImage(named: "iphone6_3.jpg")
            
        //iPhone6 plus
        }else if (screenWidth == 414 && screenHeight == 736){
            
            self.image1 = UIImage(named: "iphone6plus_1.jpg")
            self.image2 = UIImage(named: "iphone6plus_2.jpg")
            self.image3 = UIImage(named: "iphone6plus_3.jpg")
        }
    }
    
    //スクロールを検知した際に行われる処理
    func scrollViewDidScroll(scrollview: UIScrollView) {
        
        //画像の位置から画像の番号を判別する
        var pageHeight : CGFloat = self.imageScrollView.frame.size.height
        var fractionalPage : Double = Double(self.imageScrollView.contentOffset.y / pageHeight)
        var page : NSInteger = lround(fractionalPage)
        self.imagePageControl.currentPage = page;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
