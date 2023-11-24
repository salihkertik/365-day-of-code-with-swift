import UIKit
    
    func favoriteAlbum(){
        print("My favorite is Fearless")
    }
    
    favoriteAlbum()
    
    func myFavorieAlbum(name: String) {
        print("My Favorite is \(name)")
    }
    
    myFavorieAlbum(name: "Fearless")
    
    func printAlbumRelease(name: String, year: Int) {
        print("\(name) was released in \(year)")
    }
    
    printAlbumRelease(name: "Fearless", year: 2008)
    printAlbumRelease(name: "Speak Now", year: 2010)
    printAlbumRelease(name: "Red", year: 2012)
    
    
    func countLettersInString(string: String) {
        print("The string \(string) has \(string.count) letters")
    }
    
    countLettersInString(string: "Hello")
    
    // You can also specify an underscore, _, as the external parameter name, which tells Swift that it shouldn’t have any external name at all. For example:
    func countLettersInString(_ str: String) {
        print("The String \(str) has \(str.count) letters")
    }
    countLettersInString("Salih")
    
    
    func albumIsTaylor(name: String) -> Bool {
        if name == "Taylor Swift" {return true}
        if name == "Fearles" {return true}
        if name == "Speak Now" {return true}
        if name == "Red" {return true}
        if name == "1989" {return true}
        
        return false
    }
    
    if albumIsTaylor(name: "Red") {
        print("That's one of hers!")
    }else {
        print("Who made that ?!")
    }
    
    if albumIsTaylor(name: "Blue"){
        print("That's one of hers!")
    }else{
        print("Who made that ?!")
    }
    
    //func getMeaningOfLife() -> Int {
    //    return 42
    //}
    
    func getMeaningOfLife() -> Int {
        42
    }
    
    getMeaningOfLife()

