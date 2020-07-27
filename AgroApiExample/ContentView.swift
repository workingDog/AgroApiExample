//
//  ContentView.swift
//  AgroApiExample
//
//  Created by Ringo Wathelet on 2020/07/22.
//

import SwiftUI
import Foundation
import Combine
import AgroAPI


struct ContentView: View {
    
    // this must be a strong reference, ie outside of loadData()
    let agroProvider = AgroProvider(apiKey: "your key")
    
    @State var uiImage: UIImage = UIImage()
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Testing Agro").padding()
            Image(uiImage: uiImage)
        }
        .onAppear { self.loadData() }
    }
    
    func loadData() {
        
        test1()
        test2()
//        test3()
//        test4()
   //     test5()
//        test6()
//        test7()
//        test8()
//        test9()
        
    }
    
    func test1() {
        agroProvider.getPolyList { response in
            print("\n---> test1 getPolyList response: \(response)")
        }
    }
    
    func test2() {
        agroProvider.getCurrentWeather(id: "5f15573c714b52665be0bb1e"){ response in
            print("\n---> test2 getCurrentWeather response: \(response)")
        }
    }
    
    func test3() {
        agroProvider.getPoly(id: "5f13ab46714b528c73e0bac5") { response in
            print("\n---> test3 getPoly response: \(response)")
        }
    }
    
    func test4() {
        let coords = [[[-121.395923,38.86528],[-121.380976,38.865356],[-121.380947,38.86105],[-121.395946,38.860992],[-121.395923,38.86528]]]
        
        let poly = AgroPolygon(name: "test1", coords: coords)
        
        print("\n--------> test4 poly.isValidPoly: \(poly.isValidPoly())")
        
        agroProvider.createPoly(poly: poly) { response in
            print("\n---> test4 loadData createPoly response: \(response)")
        }
        
//        agroProvider.getPoly(id: "5f13ab437c4b528273e0bac5") { response in
//            print("\n---> test4 getPoly response: \(response)")
//        }
    }
    
    func test5() {
        agroProvider.getForecastWeather(id: "5f13ab46714b528c73e0bac5"){ response in
            print("\n---> test5 getForecastWeather response: \(response)")
        }
    }

    func test6() {
        let options = AgroOptions(polygon_id: "5f13ab46714b528c73e0bac5",
                                  start: Date().addingTimeInterval(-60*60*24*10),
                                  end: Date())
        
        agroProvider.getHistoricalNDVI(options: options) { response in
            print("\n---> test6 getHistoricalNDVI response: \(response)")
        }
    }
    
    // need authorisation
    func test7() {
        let options = WeatherOptions(polygon_id: "5f15573c714b52665be0bb1e",
                                     start: Date().addingTimeInterval(-60*60*6),
                                     end: Date())
        
        agroProvider.getHistoricalWeather(options: options){ response in
            print("\n---> test7 getHistoricalWeather response: \(response)")
        }
    }
    
    func test8() {
        agroProvider.updatePoly(id: "5f13ab46714b528c73e0bac5", name: "test2") { response in
            print("\n---> test8 updatePoly response: \(response)")
        }
    }
    
    func test9() {
        let options = AgroOptions(polygon_id: "5f15573c714b52665be0bb1e",
                                     start: Date().addingTimeInterval(-60*60*24*30),
                                     end: Date())
        
        agroProvider.getImagery(options: options) { imagery in
            print("\n---> test9 getImagery imagery: \(imagery)")
            
            if let resp = imagery?.first {
                
                if let stats = resp.stats {
                    print("\n----> test9 stats: \(stats)")
                    if let ndviUrl = stats.evi {
                        self.agroProvider.getStatsInfo(urlString: ndviUrl) { statInfo in
                            print("\n----> test9 getStatsInfo: \(statInfo)")
                        }
                    }
                }
                
                // not yet working
//                if let tile = resp.tile {
//                    print("\n----> test9 tile: \(tile)")
//                    if let theTileUrl = tile.ndvi {
//                        self.agroProvider.getTile(urlString: theTileUrl) { data in
//                            print("\n----> test9 tile data: \(data)")
//                        }
//                    }
//                }
                
                if let img = resp.image {
                    print("\n----> test9 img: \(img)")
                    if let theUrl = img.ndvi {
                        self.agroProvider.getPngUIImage(urlString: theUrl, paletteid: 1, reponse: self.$uiImage)
                    }
                }
//
//                if let tiff = resp.data {
//                    print("\n----> test9 tiff: \(tiff)")
//                    if let theUrl = tiff.ndvi {
//                        self.agroProvider.getGeoTiffData(urlString: theUrl, paletteid: 1) { data in
//                            print("\n----> test9 getGeoTiffData data: \(data)")
//                            if let imgData = data, let uimg = UIImage(data: imgData) {
//                                self.uiImage = uimg
//                            }
//                        }
//                    }
//                }
//
//                if let tiff = resp.data {
//                    print("\n----> test9 tiff: \(tiff)")
//                    if let theUrl = tiff.ndvi {
//                        self.agroProvider.getGeoTiffUIImage(urlString: theUrl, paletteid: 1, reponse: self.$uiImage)
//                    }
//                }
                
            }
        }
    }
    
  
}

