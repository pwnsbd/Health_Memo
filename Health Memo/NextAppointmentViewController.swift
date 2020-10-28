//
//  NextAppointmentViewController.swift
//  Health Memo
//
//  Created by Pawan on 10/27/20.
//

import UIKit
import Speech

class NextAppointmentViewController: UIViewController, SFSpeechRecognizerDelegate {

    
    
    @IBOutlet weak var firstInputText: UITextField!
    var boxClicked : Bool = false
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
     
    var request: SFSpeechAudioBufferRecognitionRequest?
    var task: SFSpeechRecognitionTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SFSpeechRecognizer.requestAuthorization { (status) in
            OperationQueue.main.addOperation {
                // Your code goes here
                switch status {
                 
                case .authorized: self.firstInputText.isEnabled = true
                    print( "Tap the button to begin dictation...")
                 
                default: self.firstInputText.isEnabled = false
                    print ("Dictation not authorized...")
                     
                }
            }
        }
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTouched(_ sender: Any) {
        
        boxClicked = !boxClicked
        
        if audioEngine.isRunning {
            request?.endAudio()
            audioEngine.stop()
        } else {
             
            startRecording()
        }
        
        
    }
    
    func startRecording()
    {
        task?.cancel()
        task = nil
        
        request = SFSpeechAudioBufferRecognitionRequest()
        let audioSession = AVAudioSession.sharedInstance()
        
        let inputNode = audioEngine.inputNode
        guard let request = request else { return }
        request.shouldReportPartialResults = true
        try? audioSession.setCategory(AVAudioSession.Category.record)
        try? audioSession.setMode(AVAudioSession.Mode.measurement)
        try? audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        
        task = speechRecognizer.recognitionTask(with: request, resultHandler: { (result, error) in
             
            guard let result = result else { return }
            self.firstInputText.text = result.bestTranscription.formattedString
             
            if error != nil || result.isFinal {
                self.audioEngine.stop()
                self.request = nil
                self.task = nil
                 
                inputNode.removeTap(onBus: 0)
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.request?.append(buffer)
        }
        
        audioEngine.prepare()
        try? audioEngine.start()
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            firstInputText.isEnabled = true
        } else {
            firstInputText.isEnabled = false
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
