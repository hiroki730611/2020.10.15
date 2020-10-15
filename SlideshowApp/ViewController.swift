//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村弘樹 on 2020/10/08.
//  Copyright © 2020 hiroki.nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var STBtn: UIButton!
    @IBOutlet weak var SBtn: UIButton!
    @IBOutlet weak var MBtn: UIButton!
    
    
    @IBAction func susumuBtn(_ sender: Any) {
        changeImgNo += 1
        if changeImgNo == 5 {
            changeImgNo = 0
        }
        imageView.image = imageArray[changeImgNo]
    }
    
    @IBAction func modoruBtn(_ sender: Any) {
        changeImgNo -= 1
        if changeImgNo < 0 {
            changeImgNo = 4

        }
        imageView.image = imageArray[changeImgNo]
    }
    
    var changeImgNo = 0
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
    var timer: Timer!

    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "01.png")!,
        UIImage(named: "02.jpg")!,
        UIImage(named: "03.jpg")!,
        UIImage(named: "04.png")!,
        UIImage(named: "05.jpg")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saiseiBtn(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            STBtn.setTitle("停止", for: .normal)
            
            //UIButtonを無効化
            SBtn.isEnabled = false
            MBtn.isEnabled = false

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            STBtn.setTitle("再生", for: .normal)
            
            //UIButtonを有効化
            SBtn.isEnabled = true
            MBtn.isEnabled = true
            
        }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        changeImgNo += 1

        // indexが表示予定の画像の数と同じ場合
        if (changeImgNo == imageArray.count) {
            // indexを一番最初の数字に戻す
            changeImgNo = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[changeImgNo]
    }
    
    @IBAction func tapAction(_ sender: Any) {
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    //遷移先に今の画像を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           let reslutViewController:RisultViewController = segue.destination as! RisultViewController
           reslutViewController.image = self.imageArray[changeImgNo]

       }

}

