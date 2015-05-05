//
//  VolvicShopCell.swift
//  variousViewsOfSwift
//
//  Created by 酒井文也 on 2015/05/05.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class VolvicShopCell: UICollectionViewCell {
    
    @IBOutlet var volvicShopImage: UIImageView!
    @IBOutlet var volvicShopTitle: UILabel!
    @IBOutlet var volvicShopDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //※今回はAutoLayoutは使いません => Use Auto Layoutのチェックははずす
        //Identifierを"VolvicShopCell"にすること
        
        //現在起動中のデバイスを取得（スクリーンの幅・高さ）
        let screenWidth  = DeviseSize.screenWidth()
        let screenHeight = DeviseSize.screenHeight()
        
        //表示用ラベル・画像・セルのサイズフィックスをする（CGRectMakeで要素サイズの再調整）
        //※この方法はAutoLayoutが困難な場合の最終手段
        self.frame = CGRectMake(0, 0, CGFloat(screenWidth/2), 120);
        self.volvicShopImage.frame = CGRectMake(0, 0, CGFloat(screenWidth/2), 120);
        self.volvicShopTitle.frame = CGRectMake(0, 80, CGFloat(screenWidth/2), 20);
        self.volvicShopDescription.frame = CGRectMake(0, 100, CGFloat(screenWidth/2), 20);
    }

}
