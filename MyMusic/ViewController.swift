//
//  ViewController.swift
//  MyMusic
//
//  Created by 菅野魁斗 on 2020/03/10.
//  Copyright © 2020 kaito.sugano. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // シンバルの音源fファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    
    // シンバル用のプレイヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()
    
    // ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    
    // ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    
    // バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    // バックミュージック用のプレイヤーインスタンスを作成
    var backmusicPlayer = AVAudioPlayer()

    @IBAction func cymbal(_ sender: Any) {
        soundPlayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    
    
    @IBAction func guitar(_ sender: Any) {
        soundPlayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    
    
    @IBAction func play(_ sender: Any) {
        soundPlayer(player: &backmusicPlayer, path: backmusicPath, count: -1)
    }
    
    @IBAction func stop(_ sender: Any) {
        // バックミュージック停止
        backmusicPlayer.stop()
    }
    
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path: URL, count: Int) {
        
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    
    
}

