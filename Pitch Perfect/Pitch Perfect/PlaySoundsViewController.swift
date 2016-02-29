//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Joel on 1/18/16.
//  Copyright © 2016 Joel. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        audioPlayer = try!
            AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)

    }
    
    func stopAudio() {
        audioPlayer.stop()
        audioEngine.stop()
    
    }
    
    func playAudioSpeed(rate: Float, time: NSTimeInterval) {
        audioPlayer.play()
        audioPlayer.rate = rate
        audioPlayer.currentTime = time
        
        
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        //Play audio slowly
        stopAudio()
        playAudioSpeed(0.5, time: 0.0)

    }

    @IBAction func playFastAudio(sender: UIButton) {
        //Play audio fast
        stopAudio()
        playAudioSpeed(2.0, time: 0.0)
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        stopAudio()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    
    @IBAction func playDarthvaderaudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        stopAudio()
    }


}
