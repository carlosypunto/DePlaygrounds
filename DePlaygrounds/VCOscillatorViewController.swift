//
//  ViewController.swift
//  DePlaygrounds
//
//  Created by Carlos García on 15/11/15.
//  Copyright © 2015 Carlos García. All rights reserved.
//

import UIKit
import AudioKit

class VCOscillatorViewController: UIViewController {
    
    let vcoInstrument = AKVCOscillatorInstrument(number: 1)
    let note = AKVCOscillatorNote()
    
    @IBOutlet weak var amplitudeSlider: AKPropertySlider!
    @IBOutlet weak var frecuencySlider: AKPropertySlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "VCO"
        
        AKOrchestra.addInstrument(vcoInstrument)
        
        let amp = AKAmplifier(input: vcoInstrument.output)
        AKOrchestra.addInstrument(amp)
        amp.start()
        amplitudeSlider.property = vcoInstrument.amplitude
        frecuencySlider.property = note.frequency
        
//        vcoInstrument.addProperty(vcoInstrument.amplitude)
//        note.addProperty(note.frequency)

//        vcoInstrument.amplitude = AKInstrumentProperty(value: 0.5)
        note.frequency = AKNoteProperty(value: 220)
        vcoInstrument.playNote(note)
    }
    
    @IBAction func playSquareWave(sender: AnyObject) {
        note.waveformType.value = AKVCOscillator.waveformTypeForSquare().value
        vcoInstrument.playNote(note)
    }
    
    @IBAction func playTriangleWave(sender: AnyObject) {
        note.waveformType.value = AKVCOscillator.waveformTypeForTriangle().value
        vcoInstrument.playNote(note)
    }
    
    @IBAction func playSawtoothWave(sender: AnyObject) {
        note.waveformType.value = AKVCOscillator.waveformTypeForSawtooth().value
        vcoInstrument.playNote(note)
    }
    
    @IBAction func playIntegrated(sender: AnyObject) {
        note.waveformType.value = AKVCOscillator.waveformTypeForIntegratedSawtooth().value
        vcoInstrument.playNote(note)
    }
    
    @IBAction func stop(sender: AnyObject) {
        vcoInstrument.stop()
    }

}

