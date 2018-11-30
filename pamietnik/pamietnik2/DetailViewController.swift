//
//  DetailViewController.swift
//  pamietnik2
//
//  Created by Student on 05/11/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var detailMessageTextView: UITextView!
    
    @IBOutlet weak var detailTitle: UINavigationItem!
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = detailItem {
            detailTitle.title = detail.timestamp!.description;

            if let label = detailDescriptionLabel {
                label.text = detail.timestamp!.description
            }
            if let message = detailMessageTextView {
                message.text = detail.message?.description ?? "Wpisz notatke..."
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        detailItem?.message = textView.text;
        try! detailItem?.managedObjectContext?.save();
    }
    
}

