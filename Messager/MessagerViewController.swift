//
//  MessagerViewController.swift
//  Messager
//
//  Created by Vladimir Nevinniy on 19.03.17.
//  Copyright © 2017 Vladimir Nevinniy. All rights reserved.
//

import UIKit

class MessagerViewController: UIViewController {
    
    let avatarGet: UIImage = #imageLiteral(resourceName: "rabbit")
    let avatarSend: UIImage = #imageLiteral(resourceName: "wolf")
    
    @IBOutlet weak var textMessageTextView: UITextView!
    @IBOutlet weak var table: UITableView!
    
    struct Message {
        var text: String
        var isOwner: Bool
    }
    
    
    var messages: [Message] = [Message]()
    
    func scrollToBottom(animated: Bool = true) {
        let section = table.numberOfSections
        if section > 0 {
            let row = table.numberOfRows(inSection: section - 1)
            if row > 0 {
                table.scrollToRow(at: IndexPath(row: row - 1, section: 0), at: .bottom, animated: animated)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        messages.append(Message(text: "Test string sending", isOwner: true))
        messages.append(Message(text: "Test2 string sending", isOwner: true))
        messages.append(Message(text: "Test string geting", isOwner: false))
        
        scrollToBottom()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onClickGet(_ sender: Any) {
        let message = Message(text: textMessageTextView.text, isOwner: false)
        
        messages.append(message)
        
        table.reloadData()
        
        scrollToBottom()
    }
    
    @IBAction func onClickSend(_ sender: Any) {
        let message = Message(text: textMessageTextView.text, isOwner: true)
        
        messages.append(message)
        
        table.reloadData()
        
        scrollToBottom()
    }

}

extension MessagerViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        
        
        if message.isOwner {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellSend", for: indexPath) as! SendTableViewCell
            
            cell.avatar.image = avatarSend
            cell.message.text = message.text
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellGot", for: indexPath) as! GetTableViewCell
            
            cell.avatar.image = avatarGet
            cell.message.text = message.text
            return cell
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

