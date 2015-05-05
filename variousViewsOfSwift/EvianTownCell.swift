//
//  EvianTownCell.swift
//  variousViewsOfSwift
//
//  Created by 酒井文也 on 2015/05/03.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class EvianTownCell: UITableViewCell {
    
    @IBOutlet var townImage: UIImageView!
    @IBOutlet var townDate: UILabel!
    @IBOutlet var townTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //※今回はAutoLayoutは使いません => Use Auto Layoutのチェックははずす
        
        //Identifierを"EvianTownCell"にすること
        let screenWidth  = DeviseSize.screenWidth()
        let screenHeight = DeviseSize.screenHeight()
        
        //表示用ラベル・画像・セルのサイズフィックスをする（CGRectMakeで要素サイズの再調整）
        self.frame = CGRectMake(0, 0, CGFloat(screenWidth), 70);
        self.townImage.frame = CGRectMake(0, 0, 100, 70);
        self.townDate.frame  = CGRectMake(110, 10, CGFloat(screenWidth - 120), 20);
        self.townTitle.frame = CGRectMake(110, 40, CGFloat(screenWidth - 120), 20);
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
