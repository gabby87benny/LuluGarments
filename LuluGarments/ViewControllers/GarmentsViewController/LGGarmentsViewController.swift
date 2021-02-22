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
    
    private var garmentsViewModel = LGGarmentsViewModel()
        
    init(viewModel: LGGarmentsViewModel = LGGarmentsViewModel()) {
        self.garmentsViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.garmentsViewModel = LGGarmentsViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.garmentsViewModel.retrieveGarments()
        self.garmentsTableView.register(UITableViewCell.self, forCellReuseIdentifier: LGGarmentsViewControllerConstants.garmentsTableViewIdentifier)
        self.garmentsTableView.tableFooterView = UIView()
        self.garmentsTableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! LGAddGarmentViewController
        destinationVC.delegate = self
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            garmentsViewModel.sortType = LGGarmentsSortType.LGGarmentsSortTypeAlhabetical
        }
        else{
            garmentsViewModel.sortType = LGGarmentsSortType.LGGarmentsSortTypeCreationDate
        }
        
        garmentsViewModel.sortGarments()
        garmentsTableView.reloadData()
    }
}

extension LGGarmentsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garmentsViewModel.garmentsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LGGarmentsViewControllerConstants.garmentsTableViewIdentifier, for: indexPath)
        let garment = garmentsViewModel.garment(at: indexPath)
        cell.textLabel?.text = garment?.garmentName
        cell.textLabel?.textColor = UIColor.black
        return cell
    }
}

extension LGGarmentsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension LGGarmentsViewController: LGAddGarment_Protocol {
    func addGarment(name: String) {
        garmentsViewModel.saveGarments(name: name) { (isSaved, error) in
            if isSaved == true {
                garmentsTableView.reloadData()
            }
        }
    }
}
