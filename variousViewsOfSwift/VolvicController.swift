//
//  VolvicController.swift
//  variousViewsOfSwift
//
//  Created by 酒井文也 on 2015/04/25.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class VolvicController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //コレクションビュー
    @IBOutlet var volvicCollectionView: UICollectionView!
    
    //コレクションビューの要素数
    let sectionCount: Int = 2
    
    //コレクションビューのセル数
    let cellCountOne: Int = 16
    let cellCountTwo: Int = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート
        self.volvicCollectionView.delegate = self;
        self.volvicCollectionView.dataSource = self;
        
        //Xibのクラスを読み込む宣言を行う
        var nibOne:UINib = UINib(nibName: "VolvicPickupCell", bundle: nil)
        self.volvicCollectionView.registerNib(nibOne, forCellWithReuseIdentifier: "VolvicPickupCell")
        var nibTwo:UINib = UINib(nibName: "VolvicShopCell", bundle: nil)
        self.volvicCollectionView.registerNib(nibTwo, forCellWithReuseIdentifier: "VolvicShopCell")
    }

    //コレクションビューの要素数を設定する ※必須
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        //コレクションビューの要素数
        return sectionCount
    }

    //コレクションビューの行数を設定する ※必須
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if (section == 0) {
        
            //0番目のセクションのセル数
            return cellCountOne
        
        } else if (section == 1) {
        
            //1番目のセクションのセル数
            return cellCountTwo
        }
        return 0
    }
    
    //コレクションビューのセルサイズを格納 ※任意（今回はおのおのの画像サイズを切り出すのでこんな感じの対応）
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize {
        
        //セクション0のセルサイズ
        if (indexPath.section == 0) {
            return CGSizeMake(CGFloat(DeviseSize.screenWidth()/4), 120);
        }
        //セクション1のセルサイズ
        else if (indexPath.section == 1) {
            return CGSizeMake(CGFloat(DeviseSize.screenWidth()/2), 120);
        }
        return CGSizeMake(0,0);
    }
    
    //表示するセルの中身を設定する ※必須
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell!
        
        if (indexPath.section == 0) {
            
            var cellOne = collectionView.dequeueReusableCellWithReuseIdentifier("VolvicPickupCell", forIndexPath: indexPath) as? VolvicPickupCell;
            
            //テキスト・画像等の表示
            let petImagePath = UIImage(named: "volvic1.jpg")
            cellOne!.volvicPetImage?.image = petImagePath
            
            cellOne!.volvicPetPrice?.text = "¥3000"
            cellOne!.volvicPetName?.text = "Volvic Lemon"
            
            cell = cellOne!
            
        } else if (indexPath.section == 1) {
            
            var cellTwo = collectionView.dequeueReusableCellWithReuseIdentifier("VolvicShopCell", forIndexPath: indexPath) as? VolvicShopCell;
            
            //テキスト・画像等の表示
            let shopImagePath = UIImage(named: "volvic2.jpg")
            cellTwo!.volvicShopImage?.image = shopImagePath
            
            cellTwo!.volvicShopTitle?.text = "Volvicの絶景旅行"
            cellTwo!.volvicShopDescription?.text = "抽選1名様：費用50万ドル"
            
            cell = cellTwo!
        }
        return cell!
    }

    //セルをタップした時に呼び出される
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //println("コレクションビューがタップされました！")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
