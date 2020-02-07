//
//  NotesViewController.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/3/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

//import UIKit
//
//class NotesViewController: UIViewController {
//
//    var medincineController: MedicineController?
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //create text view
//        let textView = UITextView()
//        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//        textView.backgroundColor = .lightGray
//        textView.text = "Please use this section to note anything you'd like to remember to tell your doctor at your next visit!"
//
//        view.addSubview(textView)
//        //use auto layout to set up constraints
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        [
//            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            textView.heightAnchor.constraint(equalToConstant: 50)
//
//            ].forEach{ $0.isActive = true}
//
//        textView.font = UIFont.preferredFont(forTextStyle: .headline)
//
//        textView.delegate = self
//        textView.isScrollEnabled = false
//
//        textViewDidChange(textView)
//
//    }
//
//}

//extension UIViewController: UITextViewDelegate {
//    public func textViewDidChange(_ textView: UITextView) {
//        //print(textView.text)
//        let size = CGSize(width: view.frame.width, height: .infinity)
//        let estimatedSize = textView.sizeThatFits(size)
//
//        textView.constraints.forEach { (constraint) in
//            if constraint.firstAttribute == .height {
//                constraint.constant = estimatedSize.height
//            }
//        }
//    }
//}
