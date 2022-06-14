//
//  PokemonDetailsViewController.swift
//  TCGPokemonCards
//
//  Created by Yhan Nunes on 13/06/22.
//

import UIKit
import Charts
import TinyConstraints

class PokemonDetailsViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonPrice: UILabel!
    @IBOutlet weak var pokemonChartView: UIView!

    var card: Cards?
    
    lazy var lineChartView: LineChartView = {
       let chartView = LineChartView()
        chartView.backgroundColor = .black
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonChartView.isHidden = true
//        pokemonChartView.addSubview(lineChartView)
//        lineChartView.centerInSuperview()
//        lineChartView.width(300)
//        lineChartView.heightToWidth(of:view)
        pokemonName.text = card?.name
        AppPipes().downloadImage(from: URL(string: card?.images?.large ?? "")!, imageView: pokemonImage)
        if let price = card?.tcgplayer?.prices?.holofoil?.market {
            pokemonPrice.text = "$\(String(describing: price))"
        }
        
//        setData()
        // Do any additional setup after loading the view.
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
//    func setData(){
//
//        let yValues:[ChartDataEntry]=[
//            ChartDataEntry(x:(card?.tcgplayer?.prices?.reverseHolofoil?.low)!,y:(card?.tcgplayer?.prices?.holofoil?.low)!),
//            ChartDataEntry(x:(card?.tcgplayer?.prices?.reverseHolofoil?.mid)!,y:(card?.tcgplayer?.prices?.holofoil?.mid)!),
//            ChartDataEntry(x:(card?.tcgplayer?.prices?.reverseHolofoil?.high)!,y:(card?.tcgplayer?.prices?.holofoil?.high)!),
//            ChartDataEntry(x:(card?.tcgplayer?.prices?.reverseHolofoil?.market)!,y:(card?.tcgplayer?.prices?.holofoil?.market)!),
//        ]
//
//        let set1 = LineChartDataSet(entries:yValues,label:"Prices")
//        let data = LineChartData(dataSet:set1)
//        lineChartView.data=data
//    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
