//
//  ViewController.swift
//  WeatherAPi
//
//  Created by patururamesh on 09/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel = ChatViewModel()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        viewModel.fetchMessages(forConversationId: "conversation1")
    }
    
    private func setupBindings() {
        viewModel.onMessagesUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        guard let text = messageTextField.text, !text.isEmpty else { return }
        viewModel.sendMessage(text, from: "user1", to: "user2") { [weak self] success in
            if success {
                self?.messageTextField.text = ""
                self?.tableView.reloadData()
            } else {
                // Handle failure
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        let message = viewModel.messages[indexPath.row]
        cell.textLabel?.text = message.text
        return cell
    }
}
