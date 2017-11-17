//
//  BangoTableViewController.swift
//  Resep Bango App iOS
//
//  Created by Jun  on 11/17/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var namaSelected:String?
var waktuSelected:String?
var orangSelected:String?
var hargaSelected:String?
var bahanSelected:String?
var caraSelected:String?

class BangoTableViewController: UITableViewController {

    var nampungId : String = ""
    var arrayResep = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("id + " + nampungId)
        print("id + " + nampungId)
        
        let params = ["id_kategori" : nampungId]
        
        let url = "http://localhost/Bango/index.php/api/getBango"

        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                //check response
                if response.result.isSuccess {
                    //kalau reponse sucsess kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get json array dari json diatas
                    self.arrayResep = json["data"].arrayObject as! [[String:String]]
                    //check di log
                    // print(self.arrayBerita)
                    
                    //check jumlah array
                    if(self.arrayResep.count > 0){
                        
                        //refresh tableView
                        self.tableView.reloadData()
                    }
                }
                else{
                    print("eror server")
                }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayResep.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BangoTableViewCell
        
        var serverid = arrayResep[indexPath.row]
        
        var id = serverid["id_siswa"]
        let nama = serverid["nama"]
        let harga = serverid["harga"]
        let waktu = serverid["lama"]
        let orang = serverid["orang"]
        //print(jdl)
        //var gambar = server["gambar"]
        
        //pindah
        cell.labelnama.text = nama
        cell.labelharga.text = harga
        cell.labelwaktu.text = waktu
        cell.labelorang.text = orang

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arrayResep[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = task["nama"]
        //  gambarSelcetd = task["gambar"] as! String
        waktuSelected = task["lama"]
        orangSelected = task["orang"]
        hargaSelected = task["harga"]
        bahanSelected = task["bahan"]
        caraSelected = task["membuat"]
        
        
        
        
        
        
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "PassData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "PassData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            //        let kirimData = segue.destination as! KontakViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                
                let value = arrayResep[indexPath.row]
                controller.passnama = value["nama"] as? String
                controller.passaharga = value["harga"] as? String
                controller.passorang = value["orang"] as? String
                controller.passwaktu = value["lama"] as? String
                controller.passbahan = value["bahan"] as? String
                controller.passcara = value["membuat"] as? String
                // controller.passgambar = value["gambar"] as? UIImage
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
