//
//  TableViewCell.swift
//  Shopping_Mall
//
//  Created by User on 04.06.21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var loadedSport = GetSportElements()
    
    private var info: [(String, String)] = [] // by Artur
    
    static var number = ""
    
    
//        cell 1
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var vipLabel: UILabel! {
        didSet {
            labelDesign(vipLabel)
        }
    }
    @IBOutlet weak var urgentLabel: UILabel! {
        didSet {
            labelDesign(urgentLabel)
        }
    }
    
//        cell 2
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var aimLabel: UILabel!
    
//        cell 3
    @IBOutlet weak var firmaModelYearLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
//        cell 4
    @IBOutlet weak var contactData: UILabel!
    @IBOutlet weak var phoneNumber: UIButton!
    
//    cell 5
    @IBOutlet weak var countryRegionCityLabel: UILabel!
    
//     cell 6
    @IBOutlet weak var tableView: UITableView!
    
//        cell 7
    @IBOutlet weak var descriptionLabel: UILabel!
    
//     cell 8
    @IBOutlet weak var profileButton: UIButton!
    {
        didSet {
            profileButton.layer.cornerRadius = 10
            profileButton.backgroundColor = .orange
            profileButton.setTitleColor(.white, for: .normal)
            
        }
    }
    
    @IBOutlet weak var heightSize: NSLayoutConstraint!
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                img.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                img.addConstraint(aspectConstraint!)
            }
        }
    }
    

    
    




      override func awakeFromNib() {
          super.awakeFromNib()
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.separatorColor = .clear

          // Initialization code
//          setUpTable()
      }



      override func layoutSubviews() {
          super.layoutSubviews()

      }

    override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)
          // Configure the view for the selected state
      }
  
    
    override func prepareForReuse() {
        super.prepareForReuse()
        aspectConstraint = nil
        
        TableViewCell.number = phoneNumber.title(for: .normal) ?? ""

        
    }
    
    @IBAction func contactNumber(_ sender: UIButton) {
        
        if let url = URL(string: "tel://\(loadedSport[0].contact)"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    func labelDesign(_ label: UILabel) {
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
    }
    
    func setPostedImage(image : UIImage) {
        
        let aspect = 1.5
        print("aspect = \(aspect)")
        
        aspectConstraint = NSLayoutConstraint(item: img!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: img, attribute: NSLayoutConstraint.Attribute.height, multiplier: CGFloat(aspect), constant: 0.0)
        
        img.image = image
    }
    
    func setInfo(_ info: [(String, String)]) { //by Artur
        self.info = info
        info.map {$0.1}
        info.map {$0.0}
        
        
        self.tableView?.reloadData()
        
        //tableView height constraint
        
        heightSize?.constant = CGFloat(info.count * 30)

        
    }
    
}

extension TableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell_Inside
        cell.label1.text = info[indexPath.row].0 //"index\(indexPath.row + 1)"
        cell.label2.text = info[indexPath.row].1 //"barev"
        cell.selectionStyle = .none
        
        return cell
    }
    

}
