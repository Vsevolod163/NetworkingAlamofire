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
        // TODO: - fetch courses
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
        cell.configure(with: course{ ({ (if let <modeler>
                                         <id><#Unique identifier#></id>
                                         <title><#Unique title#></title>
                                         <purpose><#What this modeler does#></purpose>
                                         
                                         <production-system>
                                         <rule-path><#Relative path to the CLIPS file#></rule-path>
                                         </production-system>
                                         
                                         <output>
                                         <schema-ref><#Output schema identifier#></schema-ref>
                                         <required-input>
                                         <schema-ref><#Schema to use as an input#></schema-ref>
                                         </required-input>
                                         </output>
                                         </modeler> = <#optional#> {
            <#statements#>
        }) -> <#return type#> in
            <#statements#>
        }) -> <#return type#> in
            <#statements#>
        })
        
        return cell
    }
}
