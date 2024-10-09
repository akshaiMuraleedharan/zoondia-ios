//
//  ViewController.swift
//  Friend Maker
//
//  Created by Subhosting's MacBook Pro on 09/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets and Properties
    @IBOutlet weak var personListTableView: UITableView!
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var listSegmentControl: UISegmentedControl!
    
    var users: [Person] = []
    var filteredUsers: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
        setupUI()
    }
    
    //MARK: - Functions
    func fetchUsers() {
        ApiServiceManager.shared.fetchFriends { [weak self] users, error in
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let users = users else { return }
            
            DispatchQueue.main.async {
                self.personListTableView.reloadData()
                self.users = users
                self.filteredUsers = users
            }
        }
    }

    func setupUI() {
        userProfilePic.layer.cornerRadius = userProfilePic.frame.height / 2
        userProfilePic.clipsToBounds = true
        userProfilePic.layer.borderWidth = 1
        userProfilePic.layer.borderColor = UIColor.gray.cgColor
    }
    
    func filterUsers(_ index: Int) {
        if index == 0 {
            filteredUsers = users
        } else if index == 1 {
            filteredUsers = users.filter(\.isLiked)
        } else if index == 2 {
            filteredUsers = users.filter(\.isLiked)
        } else  {
            filteredUsers = users.filter(\.isLiked)
        }
        personListTableView.reloadData()
    }
    
    //MARK: - Button Actions
    @IBAction func segmentControllerAction(_ sender: UISegmentedControl) {
        filterUsers(sender.selectedSegmentIndex)
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonTableViewCell
        
        let user = filteredUsers[indexPath.row]
        cell.configUser(user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}
