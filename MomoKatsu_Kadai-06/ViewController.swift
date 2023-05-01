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

    // スライダー値用変数の設定と初期化
    var sliderResultData: Int = 14

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 結果表示用ラベルの初期化
        sliderResultDispLabel.text = "14"

        // スライダーの値が変更された時に呼び出されるメソッドを設定
        mySlider.addTarget(self, action: #selector(self.onChange), for: .valueChanged)

        // 最小値・最大値の設定
        mySlider.minimumValue = 1.0
        mySlider.maximumValue = 100.0

        // デフォルト値の設定
        mySlider.setValue(50.0, animated: true) // アニメーション付きで値を変更する

        // スライダーバー（正式にはトラックと呼びます）の色を変更（フォルトは青）
        //mySlider.tintColor = UIColor.link//ghtblue //cyan //blue//red

    }

    // スライダーの値が変更された時の処理
    @objc func onChange(_ sender: UISlider) {
        print(sender.value)
    }

    // スライダーの値を判定ボタンのクリックにより、判定結果を表示する。
    @IBAction func resultJudgmentButton(_ sender: Any) {

        // スライダー位置の値を変数に設定
        sliderResultData = Int( mySlider.value )
        print ( "\nスライダー実位置の値：", mySlider.value, "\nスライダー位置変換後の値：", sliderResultData, "\nスライダーを設定べき値：", sliderResultDispLabel.text! )

        // スライダー位置変換後の値 と スライダーを設定べき値 を比較判定
        guard sliderResultData == Int( sliderResultDispLabel.text!) else {
            // 結果タイトル、はずれ！とあなたの値：、再挑戦
            disp_Alert ( mainTitle: "結果", subTitle: "はずれ！\nあなたの値：" + String(sliderResultData) )
            // 乱数発生とスライダー位置をデフォルト値設定
            int_Slider ()
            return
        }
        // 結果タイトル、あたり！とあなたの値：、再挑戦
        disp_Alert ( mainTitle: "結果", subTitle: "あたり！\nあなたの値：" + String(sliderResultData) )
        // 乱数発生とスライダー位置をデフォルト値設定
        int_Slider ()

    }

    // 乱数発生とスライダー位置をデフォルト値設定
    func int_Slider () {
        // 次の乱数発生しラベル表示
        let randomNum = randomNumberOccurrence ()
        sliderResultDispLabel.text = String( randomNum )
        // スライダー位置をデフォルト値に設定
        mySlider.setValue(50.0, animated: true)
    }

    // 乱数発生用関数
    func randomNumberOccurrence () -> Int {
        let randomNum = Int (arc4random_uniform( 99 ) ) + 1
        return (randomNum)
    }

    // 「タイトル」と「サブタイトル」の引数によりアラートダイアログを表示する
    func disp_Alert ( mainTitle: String, subTitle: String ) {
        //アラートのタイトル
        let dialog = UIAlertController(title: mainTitle, message: subTitle, preferredStyle: .alert)
        //ボタンのタイトル
        dialog.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: nil))
        //実際に表示させる
        self.present(dialog, animated: true, completion: nil)
    }

}

