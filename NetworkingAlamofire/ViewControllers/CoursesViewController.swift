//
//  CoursesViewController.swift
//  NetworkingAlamofire
//
//  Created by Vsevolod Lashin on 14.05.2023.
//

import UIKit

protocol NewCourseViewControllerDelegate: AnyObject {
    func sendPostRequest(with data: Course)
}

final class CoursesViewController: UITableViewController {
    
    private var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchCourses()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let newCourseVC = navigationVC.topViewController as? NewCourseViewController else { return }
        newCourseVC.delegate = self
    }
    
    private func fetchCourses() {
        
    }
}

// MARK: - NewCourseViewControllerDelegate
extension CoursesViewController: NewCourseViewControllerDelegate {
    func sendPostRequest(with data: Course) {
        print(data)
    }
}
   
// MARK: - TableViewDataSource
extension CoursesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "course", for: indexPath)

        return cell
    }
}
