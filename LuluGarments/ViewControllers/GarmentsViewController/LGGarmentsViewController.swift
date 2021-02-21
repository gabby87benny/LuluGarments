//
//  LGGarmentsViewController.swift
//  LuluGarments
//
//  Created by Gabriel on 2/18/21.
//

import UIKit

struct LGGarmentsViewControllerConstants {
    static let garmentsTableViewIdentifier = "GarmentsTableViewId"
}

class LGGarmentsViewController: UIViewController {

    @IBOutlet weak var garmentsTableView: UITableView!
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    
    var garmentsList: [LGGarment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garmentsTableView.register(UITableViewCell.self, forCellReuseIdentifier: LGGarmentsViewControllerConstants.garmentsTableViewIdentifier)
        garmentsList = garmentsList.sorted { $0.garmentName.lowercased() < $1.garmentName.lowercased() }
        garmentsTableView.tableFooterView = UIView()
        garmentsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
    }
}

extension LGGarmentsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garmentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LGGarmentsViewControllerConstants.garmentsTableViewIdentifier, for: indexPath)
        cell.textLabel?.text = garmentsList[indexPath.row].garmentName
        cell.textLabel?.textColor = UIColor.black
        return cell
    }
}

extension LGGarmentsViewController {
    
    
}
