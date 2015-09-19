//
//  ViewController.swift
//  variousViewsOfSwift
//
//  Created by 酒井文也 on 2015/04/25.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //メインのボタン
    @IBOutlet var evianButton: UIButton!
    @IBOutlet var volvicButton: UIButton!
    @IBOutlet var contrexButton: UIButton!
    
    //下敷きのビュー
    @IBOutlet var backgroundView: UIView!
    
    //コンテナビュー
    @IBOutlet var evianContainer: UIView!
    @IBOutlet var volvicContainer: UIView!
    @IBOutlet var contrexContainer: UIView!
    
    //現在ページ表示位置用のメンバ変数
    var currentDisplayViewNumber: Int!
    
    //画面の縦・横のメンバ変数
    var screenWidth: Int!
    var screenHeight: Int!
    
    override func viewWillAppear(animated: Bool) {
        
        //下敷きのビューのアルファを設定
        self.backgroundView.alpha = 0.6
        
        //現在起動中のデバイスを取得（スクリーンの幅・高さ）
        screenWidth  = DeviseSize.screenWidth()
        screenHeight = DeviseSize.screenHeight()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //メンバ変数初期値を設定
        self.currentDisplayViewNumber = 0
        switchingWholeContainer(0)
    }
    
    //各ボタンのアクション
    @IBAction func evianAction(sender: UIButton) {
        switchingWholeContainer(0)
    }
    
    @IBAction func volvicAction(sender: UIButton) {
        switchingWholeContainer(1)
    }
    
    @IBAction func contrexAction(sender: UIButton) {
        switchingWholeContainer(2)
    }
    
    //左スワイプジェスチャー検知時の切り替えの実装
    @IBAction func swipeLeftAction(sender: UISwipeGestureRecognizer) {
        
        //1を減算
        self.currentDisplayViewNumber = self.currentDisplayViewNumber - 1;
        
        if(self.currentDisplayViewNumber < 0){
            
            //0を下回る場合は0に変換（特に画面変化はない）
            self.currentDisplayViewNumber = 0;
            
        }else{
            
            //対応する番号のビューを表示する
            switchingWholeContainer(self.currentDisplayViewNumber)
        }
    }
    
    //右スワイプジェスチャー検知時の切り替えの実装
    @IBAction func swipeRightAction(sender: UISwipeGestureRecognizer) {
        
        //1を加算
        self.currentDisplayViewNumber = self.currentDisplayViewNumber + 1;
        
        if(self.currentDisplayViewNumber > 2){
            
            //2を超える場合は2に変換（特に画面変化はない）
            self.currentDisplayViewNumber = 2;
            
        }else{
            
            //対応する番号のビューを表示する
            switchingWholeContainer(self.currentDisplayViewNumber)
        }
    }
    
    //コンテンツ全体をスイッチするメソッド
    func switchingWholeContainer(displayNumber: Int) {
        
        //アニメーション位置を決める
        UIView.animateWithDuration(0.2, delay: 0, options: [], animations: {
            
            self.switchingEnabledButton(displayNumber)
            self.switchingDisplayContainer(displayNumber)
            self.switchingBtnBackground(displayNumber)
            
        }, completion: nil)
    }
    
    //現在押されたボタンを決定するメソッド
    func switchingEnabledButton(displayNumber: Int) {
        
        if(displayNumber == 0){
            
            self.evianButton.enabled = false;
            self.volvicButton.enabled = true;
            self.contrexButton.enabled = true;
            
        }else if(displayNumber == 1){

            self.evianButton.enabled = true;
            self.volvicButton.enabled = false;
            self.contrexButton.enabled = true;
            
        }else if(displayNumber == 2){
            
            self.evianButton.enabled = true;
            self.volvicButton.enabled = true;
            self.contrexButton.enabled = false;
        }
    }
    
    //表示するコンテナビューを決定するメソッド
    func switchingDisplayContainer(displayNumber: Int) {
        
        if(displayNumber == 0){
            
            self.evianContainer.alpha = 1;
            self.view.addSubview(self.evianContainer)
            
            self.volvicContainer.alpha = 0;
            self.volvicContainer.removeFromSuperview()
            
            self.contrexContainer.alpha = 0;
            self.contrexContainer.removeFromSuperview()
            
        }else if(displayNumber == 1){
            
            self.evianContainer.alpha = 0;
            self.evianContainer.removeFromSuperview()
            
            self.volvicContainer.alpha = 1;
            self.view.addSubview(self.volvicContainer)
            
            self.contrexContainer.alpha = 0;
            self.contrexContainer.removeFromSuperview()
            
        }else if(displayNumber == 2){
            
            self.evianContainer.alpha = 0;
            self.evianContainer.removeFromSuperview()
            
            self.volvicContainer.alpha = 0;
            self.volvicContainer.removeFromSuperview()
            
            self.contrexContainer.alpha = 1;
            self.view.addSubview(self.contrexContainer)
        }
    }
    
    //ボタン背景下敷きをアニメーションさせるメソッド
    func switchingBtnBackground(displayNumber: Int) {
        
        //ボタン背景下敷きの中心を所定位置へ移動
        if(displayNumber == 0){
            
            //X座標：左端から10pxずれた位置
            self.backgroundView.frame = CGRectMake((CGFloat)(10.0), 63.0, 60.0, 30.0)
                
        } else if (displayNumber == 1){
            
            //X座標：中心からボタン幅の半分ずれた位置
            self.backgroundView.frame = CGRectMake((CGFloat)((self.screenWidth / 2) - 30), 63.0, 60.0, 30.0)
                
        } else if (displayNumber == 2){
            
            //X座標：右端から10px+ボタン幅分ずれた位置
            self.backgroundView.frame = CGRectMake((CGFloat)(self.screenWidth - 70), 63.0, 60.0, 30.0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

