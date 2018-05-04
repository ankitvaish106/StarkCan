//
//  HomeViewController.swift
//  Starkcan
//
//  Created by NTGMM-01 on 30/04/18.
//  Copyright © 2018 Starkcan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let images:[UIImage] = [#imageLiteral(resourceName: "slider-1"),#imageLiteral(resourceName: "slider-2"),#imageLiteral(resourceName: "slider-3")]
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
        addNavBar()
        FadeViews()
        
       // self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "DoSomething",style: .plain,target: nil,action:nil)
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(HomeViewController.FadeViews), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    var counter: Int = 0
    @objc func FadeViews()
    {
        print("I am called")
        UIView.transition(with: self.imageView,
                          duration:1.0,
                          options: .transitionCrossDissolve,
                          animations: { self.imageView.image = self.images[self.counter] },
                          completion: nil)
        counter += 1
      
        if counter == 3
        {
         counter = 0
        }
       // FadeViews()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
       //self.navigationController?.navigationBar.backgroundColor = UIColor(red:47/255, green: 18/255, blue:16/255, alpha:1)
      // self.navigationController?.navigationBar.barTintColor = UIColor(red:47/255, green: 18/255, blue:16/255, alpha:1)
       self.navigationController?.navigationBar.tintColor = UIColor.white//UIColor(red:45/255, green: 20/255, blue:16/255, alpha:1)
    }
    
    func addNavBar()
    {
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "logo")
        let imageView = UIImageView(image: image)
        
       // let bannerWidth = navController.navigationBar.frame.size.width
        //let bannerHeight = navController.navigationBar.frame.size.height
        
       // let coorX = (bannerWidth / 2) - (image.size.width / 2)
       // let coorY = bannerHeight / 2 - image.size.height / 2
        
       // imageView.frame = CGRect(x: 0,y: 0,width: bannerWidth,height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus()
    {
        
        if revealViewController() == nil
        {
            
        }
        else
        {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
      /*  if let value = revealViewController() as? SWRevealViewController
        {
            menuButton.target = value
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            value.rearViewRevealWidth = 275
            value.rightViewRevealWidth = 160

            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }*/
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
