//
//  ViewController.swift
//  MomoKatsu_Kadai-06
//
//  Created by モモカツ on 2023/04/30.
//  Part6 スライダーを指定された位置に移動させるゲームアプリ

import UIKit

class ViewController: UIViewController {

    // スライダーのパーツを設置
    @IBOutlet weak var mySlider: UISlider!

    // 結果表示用のラベルを設定
    @IBOutlet weak var sliderResultDispLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 結果表示用ラベルの初期化
        sliderResultDispLabel.text = "14"

        // 最小値・最大値の設定
        mySlider.minimumValue = 1.0
        mySlider.maximumValue = 100.0

        // デフォルト値の設定
        mySlider.setValue(50.0, animated: true) // アニメーション付きで値を変更する
    }

    // スライダーの値を判定ボタンのクリックにより、判定結果を表示する。
    @IBAction func resultJudgmentButton(_ sender: Any) {

        // スライダー位置の値を変数に設定
        let sliderResultData = Int( mySlider.value )
        print ( "\nスライダー実位置の値：", mySlider.value, "\nスライダー位置変換後の値：", sliderResultData, "\nスライダーを設定べき値：", sliderResultDispLabel.text! )

        let firstLine: String
        if sliderResultData == Int( sliderResultDispLabel.text!) {
            firstLine = "あたり！"
        } else {
            firstLine = "はずれ！"
        }

        // 結果タイトル、はずれ！とあなたの値：、再挑戦
        displayAlert ( mainTitle: "結果", subTitle: "\(firstLine)\nあなたの値：" + String(sliderResultData) )

        // 乱数発生とスライダー位置をデフォルト値設定
        resetGameState ()
    }

    // 乱数発生とスライダー位置をデフォルト値設定
    func resetGameState () {
        // 次の乱数発生しラベル表示
        let randomNum = randomNumberOccurrence ()
        sliderResultDispLabel.text = String( randomNum )
        // スライダー位置をデフォルト値に設定
        mySlider.setValue(50.0, animated: true)
    }

    // 乱数発生用関数
    func randomNumberOccurrence () -> Int {
        return Int.random(in: 1...100)
    }

    // 「タイトル」と「サブタイトル」の引数によりアラートダイアログを表示する
    func displayAlert ( mainTitle: String, subTitle: String ) {
        //アラートのタイトル
        let dialog = UIAlertController(title: mainTitle, message: subTitle, preferredStyle: .alert)
        //ボタンのタイトル
        dialog.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: nil))
        //実際に表示させる
        self.present(dialog, animated: true, completion: nil)
    }

}

