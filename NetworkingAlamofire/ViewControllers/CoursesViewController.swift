//
//  CoursesViewController.swift
//  NetworkingAlamofire
//
//  Created by Vsevolod Lashin on 14.05.2023.
//

import UIKit
import Alamofire

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
        AF.request(Link.coursesURL.url)
            .validate()
            .responseJSON { [weak self] dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let coursesData = value as? [[String: Any]] else { return }
                    
                    for courseData in coursesData {
                        let course = Course(
                            name: courseData["name"] as? String ?? "",
                            imageUrl: courseData["imageUrl"] as? String ?? "",
                            numberOfLessons: courseData["number_of_lessons"] as? Int ?? 0,
                            numberOfTests: courseData["number_of_tests"] as? Int ?? 0
                        )
                        
                        self?.courses.append(course)
                    }
                    
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
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

        guard let cell = cell as? CourseCell else { return UITableViewCell() }
        let course = courses[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
}
