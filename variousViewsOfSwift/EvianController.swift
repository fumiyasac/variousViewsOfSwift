//
//  EvianController.swift
//  variousViewsOfSwift
//
//  Created by 酒井文也 on 2015/04/25.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class EvianController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //テーブルビュー
    @IBOutlet var evianTableView: UITableView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 2

    //テーブルビューのセル数
    let cellCountOne: Int = 5
    let cellCountTwo: Int = 10
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let CellOneHeight: CGFloat = 180.0
    let CellTwoHeight: CGFloat = 70.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableViewデリゲート
        self.evianTableView.delegate = self
        self.evianTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        var nibOne:UINib = UINib(nibName: "EvianPetCell", bundle: nil)
        self.evianTableView.registerNib(nibOne, forCellReuseIdentifier: "EvianPetCell")
        var nibTwo:UINib = UINib(nibName: "EvianTownCell", bundle: nil)
        self.evianTableView.registerNib(nibTwo, forCellReuseIdentifier: "EvianTownCell")
    }

    //テーブルの要素数を設定する ※必須
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //要素数を返す
        return sectionCount
    }
    
    //テーブルの行数を設定する ※必須
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0) {
            
            //0番目のセクションのセル数
            return cellCountOne
            
        } else if (section == 1) {
            
            //1番目のセクションのセル数
            return cellCountTwo
        }
        return 0
    }
    
    //表示するセルの中身を設定する ※必須
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        if (indexPath.section == 0) {
            
            //Xibファイルを元にデータを作成する
            var cellOne = tableView.dequeueReusableCellWithIdentifier("EvianPetCell") as? EvianPetCell;
            
            //テキスト・画像等の表示
            cellOne!.petTitle?.text = "Evian 500ml Set"
            
            let petImagePath = UIImage(named: "evian1.jpg")
            cellOne!.petImage?.image = petImagePath
            
            cellOne!.petDetail?.text = "フランスが生んだ飲みやすくお茶やコーヒーにも最適な軟水です。セット販売は数量限定ですのでお早めにご予約ください！"
            cellOne!.petSub?.text = "※1セットからご注文可能です"
            
            //セルのアクセサリタイプ
            cellOne!.accessoryType = UITableViewCellAccessoryType.None;
            
            cell = cellOne!
            
        } else if (indexPath.section == 1) {
            
            //Xibファイルを元にデータを作成する
            var cellTwo = tableView.dequeueReusableCellWithIdentifier("EvianTownCell") as? EvianTownCell;
            
            //テキスト・画像等の表示
            let townImagePath = UIImage(named: "evian2.jpg")
            cellTwo!.townImage?.image = townImagePath
            
            cellTwo!.townDate?.text = "2015.05.09"
            cellTwo!.townTitle?.text = "※Evianの風景をお楽しみください"
            
            //セルのアクセサリタイプ
            cellTwo!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
            
            cell = cellTwo!
        }
        
        //セルタップ時の背景を変えない
        cell!.selectionStyle = UITableViewCellSelectionStyle.None;
        
        return cell
    }
    
    //セルの高さを返す ※任意
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        //セクションごとに高さが異なるので、それぞれの高さを返す
        if (indexPath.section == 0) {
            
            return CellOneHeight
            
        } else if (indexPath.section == 1) {
            
            return CellTwoHeight
        }
        return 0.0
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //println("テーブルビューがタップされました！")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
