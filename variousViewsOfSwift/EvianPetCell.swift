//
//  EvianPetCell.swift
//  variousViewsOfSwift
//
//  Created by 酒井文也 on 2015/05/03.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class EvianPetCell: UITableViewCell {

    @IBOutlet var petTitle: UILabel!
    @IBOutlet var petImage: UIImageView!
    @IBOutlet var petDetail: UILabel!
    @IBOutlet var petSub: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //※今回はAutoLayoutは使いません => Use Auto Layoutのチェックははずす
        //Identifierを"EvianPetCell"にすること
        
        //現在起動中のデバイスを取得（スクリーンの幅・高さ）
        let screenWidth  = DeviseSize.screenWidth()
        let screenHeight = DeviseSize.screenHeight()
        
        var detailTextWidth: Int!
        
        //表示用ラベル・画像・セルのサイズフィックスをする（CGRectMakeで要素サイズの再調整）
        //※この方法はAutoLayoutが困難な場合の最終手段
        self.frame = CGRectMake(0, 0, CGFloat(screenWidth), 180);
        self.petTitle.frame = CGRectMake(10, 10, CGFloat(screenWidth - 20), 20);
        self.petImage.frame = CGRectMake(10, 40, 100, 100);
        self.petDetail.frame = CGRectMake(120, 40, CGFloat(screenWidth - 130), 100);
        self.petSub.frame = CGRectMake(10, 150, CGFloat(screenWidth - 20), 20);
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
