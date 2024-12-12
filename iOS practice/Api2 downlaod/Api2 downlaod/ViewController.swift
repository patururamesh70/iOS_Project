//
//  ViewController.swift
//  Api2 downlaod
//
//  Created by patururamesh on 18/10/24.
//
import UIKit

// Model to store file download information
struct FileDownload {
    let fileName: String
    var progress: Float
}

class DownloadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, URLSessionDownloadDelegate {
    
    // Data source to store files and their progress
    var files: [FileDownload] = []
    
    // UITableView to display files and progress
    var tableView: UITableView!
    
    // URLSession
    var downloadTask: URLSessionDownloadTask?
    var session: URLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize URLSession with a delegate
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        // Setup TableView
        setupTableView()
        
        // Start downloading multiple files
        startDownloadingFiles()
    }
    
    // Setup TableView
    func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register a basic UITableViewCell for reuse
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fileCell")
        
        // Add the tableView to the view
        view.addSubview(tableView)
    }
    
    // Start downloading multiple files (example with URLs)
    func startDownloadingFiles() {
        // List of files to download
        let fileURLs = [
            "https://example.com/file1.zip",
            "https://example.com/file2.zip"
        ]
        
        // Add files to the data source
        for (index, url) in fileURLs.enumerated() {
            let fileName = "File \(index + 1)"
            let fileDownload = FileDownload(fileName: fileName, progress: 0.0)
            files.append(fileDownload)
            
            // Start download
            if let fileURL = URL(string: url) {
                downloadTask = session.downloadTask(with: fileURL)
                downloadTask?.resume()
            }
        }
        
        // Reload the table to show initial file names
        tableView.reloadData()
    }
    
    // MARK: - URLSessionDownloadDelegate
    
    // Progress reporting method
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // Calculate download progress
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        // Assuming we're downloading files in order
        if let index = downloadTask.taskIdentifier as Int? {
            files[index].progress = progress
            DispatchQueue.main.async {
                // Reload the specific row to update the progress
                self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
            }
        }
    }
    
    // Completion method for finished download
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Download complete for task \(downloadTask.taskIdentifier)")
    }
    
    // MARK: - UITableViewDataSource Methods
    
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }
    
    // Configure the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath)
        
        // Get the file information for this row
        let file = files[indexPath.row]
        
        // Configure the cell text with file name and progress
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(file.fileName)\nProgress: \(Int(file.progress * 100))%"
        
        return cell
    }
}
