//
//  VolvicPickupCell.swift
//  variousViewsOfSwift
//
//  Created by 酒井文也 on 2015/05/05.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class VolvicPickupCell: UICollectionViewCell {

    @IBOutlet var volvicPetImage: UIImageView!
    @IBOutlet var volvicPetPrice: UILabel!
    @IBOutlet var volvicPetName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //※今回はAutoLayoutは使いません => Use Auto Layoutのチェックははずす
        //Identifierを"VolvicPickupCell"にすること
        
        //現在起動中のデバイスを取得（スクリーンの幅・高さ）
        let screenWidth  = DeviseSize.screenWidth()
        let screenHeight = DeviseSize.screenHeight()
        
        //表示用ラベル・画像・セルのサイズフィックスをする（CGRectMakeで要素サイズの再調整）
        //※この方法はAutoLayoutが困難な場合の最終手段
        self.frame = CGRectMake(0, 0, CGFloat(screenWidth), 120);
        self.volvicPetImage.frame = CGRectMake(0, 0, CGFloat(screenWidth/4), 80);
        self.volvicPetPrice.frame = CGRectMake(0, 80, CGFloat(screenWidth/4), 20);
        self.volvicPetName.frame = CGRectMake(0, 100, CGFloat(screenWidth/4), 20);
    }

}
