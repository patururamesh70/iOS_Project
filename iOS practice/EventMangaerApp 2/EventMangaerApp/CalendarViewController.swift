//
//  CalendarViewController.swift
//  EventMangaerApp
//
//  Created by patururamesh on 10/08/24.
//
import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    private let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    private var dates: [Int] = []
    private let monthsCollectionView = UICollectionView(frame: .zero, collectionViewLayout:        UICollectionViewFlowLayout())
    private let datesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let tableView = UITableView()
    private let addButton = UIButton()
    private let messageLabel = UILabel()
    private var selectedMonth: String?
    private var selectedDate: String?
    private var eventsByDate: [String: [(title: String, title1: String, startTime: String, endTime: String)]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        view.backgroundColor = .white
        setupMonthsCollectionView()
        setupDatesCollectionView()
        setupTableView()
        setupAddButton()
        setupMessageLabel()
    }
    private func setupMonthsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        monthsCollectionView.collectionViewLayout = layout
        monthsCollectionView.delegate = self
        monthsCollectionView.dataSource = self
        monthsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "monthCell")
        monthsCollectionView.backgroundColor = .white
        
        view.addSubview(monthsCollectionView)
        monthsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            monthsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            monthsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            monthsCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    private func setupDatesCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        datesCollectionView.collectionViewLayout = layout
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        datesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "dateCell")
        datesCollectionView.backgroundColor = .white
        
        view.addSubview(datesCollectionView)
        datesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datesCollectionView.topAnchor.constraint(equalTo: monthsCollectionView.bottomAnchor, constant: 10),
            datesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            datesCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "eventCell")
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: datesCollectionView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
    }
    private func setupAddButton() {
        addButton.setTitle("+", for: .normal)
        addButton.backgroundColor = .systemGreen
        addButton.layer.cornerRadius = 25
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.isHidden = true
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20), 
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupMessageLabel() {
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.textAlignment = .natural
        messageLabel.textColor = .red
        messageLabel.numberOfLines = 0
        
        view.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: datesCollectionView.bottomAnchor, constant: 0), // Adjust position as needed
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            messageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    @objc private func addButtonTapped() {
        guard let selectedDate = selectedDate else { return }

        let alert = UIAlertController(title: "Add Event for \(selectedDate)", message: nil, preferredStyle: .alert)
    
        alert.addTextField { textField in
            textField.placeholder = "Event Title"
        }
        alert.addTextField { textField in
            textField.placeholder = "Event message"
        }
        alert.addTextField { textField in
            textField.placeholder = "Start Time"
            textField.inputView = self.createDatePicker(tag: 1)
        }
        alert.addTextField { textField in
            textField.placeholder = "End Time"
            textField.inputView = self.createDatePicker(tag: 2)
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
        let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
            guard let title = alert.textFields?[0].text,
                  let title1 = alert.textFields?[1].text,
                  let startTime = alert.textFields?[2].text,
                  let endTime = alert.textFields?[3].text else { return }
            let event = (title: title, title1: title1, startTime: startTime, endTime: endTime)
            self.eventsByDate[self.selectedDate ?? "", default: []].append(event)
            self.tableView.reloadData()
        }
        doneAction.setValue(UIColor.systemGreen, forKey: "titleTextColor")
        alert.addAction(doneAction)
        present(alert, animated: true, completion: nil)
    }
    private func createDatePicker(tag: Int) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.tag = tag
        datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
        return datePicker
    }
    @objc private func datePickerChanged(_ sender: UIDatePicker) {
        guard let alert = presentedViewController as? UIAlertController else { return }
      
        let dateFormatter12Hour = DateFormatter()
        dateFormatter12Hour.dateFormat = "h:mm a"
        dateFormatter12Hour.timeZone = TimeZone.current
        
        if let textField = alert.textFields?.first(where: { $0.inputView == sender }) {
            textField.text = dateFormatter12Hour.string(from: sender.date)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == monthsCollectionView ? months.count : dates.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == monthsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthCell", for: indexPath)
            configureMonthCell(cell, indexPath: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath)
            configureDateCell(cell, indexPath: indexPath)
            return cell
        }
    }
    private func configureMonthCell(_ cell: UICollectionViewCell, indexPath: IndexPath) {
        let button = UIButton(frame: cell.contentView.bounds)
        button.setTitle(months[indexPath.item], for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(monthButtonTapped(_:)), for: .touchUpInside)
        
        cell.contentView.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
        ])
    }
    private func configureDateCell(_ cell: UICollectionViewCell, indexPath: IndexPath) {
        let button = UIButton(frame: cell.contentView.bounds)
        button.setTitle("\(dates[indexPath.item])", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(dateButtonTapped(_:)), for: .touchUpInside)
        cell.contentView.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
        ])
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == monthsCollectionView {
            return CGSize(width: 250, height: 50)
        } else {
            return CGSize(width: 40, height: 40)
        }
    }
    @objc private func monthButtonTapped(_ sender: UIButton) {
        guard let month = sender.title(for: .normal) else { return }
        selectedMonth = month
        
        updateDatesForSelectedMonth()
        datesCollectionView.reloadData()
        
        addButton.isHidden = true
        messageLabel.text = ""
    }
    private func updateDatesForSelectedMonth() {
        guard let month = selectedMonth else { return }
        guard let monthIndex = months.firstIndex(of: month) else { return }
        
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: calendar.component(.year, from: Date()), month: monthIndex + 1)
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        dates = Array(range)
    }
    @objc private func dateButtonTapped(_ sender: UIButton) {
        guard let date = sender.title(for: .normal),
              let month = selectedMonth else { return }

        selectedDate = "\(month) \(date)"
        tableView.reloadData()
        addButton.isHidden = false
        
        // Update the message label with the number of events
        let eventCount = eventsByDate[selectedDate ?? ""]?.count ?? 0
        messageLabel.text = "List of events for \(selectedDate!): \(eventCount) events"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let selectedDate = selectedDate else { return 0 }
        let eventCount = eventsByDate[selectedDate]?.count ?? 0
        messageLabel.text = "List of events for \(selectedDate): \(eventCount) events"
        return eventCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell else {
            return UITableViewCell()
        }
        guard let selectedDate = selectedDate,
              let events = eventsByDate[selectedDate] else { return cell }
        
        let event = events[indexPath.row]
        cell.configure(with: event)
        return cell
    }
}
