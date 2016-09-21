//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }
    
    //: ### Are the values passed in to the **init** function and those set to the instance
    //: ### variables the same type? If not, why?
    
    
    //: They are. The bang(!) unwraps the optional to forcefully have a String type.
    
    
    //: ## Q2: Variable Types and Function Types
    static func arePalindromes(_ words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reversed())}
        let numElements = words.count
        
        for i in 0 ..< numElements {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
    //: ### Why does the compiler dislike the **for loop**? Fix it.
    //: ### What else is wrong with this function? You may have to refer to (but **not**
    //: ### change) the code at the very bottom. Debug the function.
    
    
    //: We are calling the method arePalindromes on the class Word when can only call an instance method with an instance of a class.
    
    
    //: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters : [Character : Int]  = [Character :Int]()//Line X
        var lenA = self.wordA.characters.count
        var lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
    //: ### What is the problem with declaring **countLetters** as we do in **Line X**,
    //: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
    //: ### What else is wrong with this function? You may have to refer to (but **not**
    //: ### change) the code at the very bottom. Debug the function.
    
    
    //: The way we are declaring the dictionary is not correct. At line Y we try to access a dictionary that was not  declared correctly. Another problem with the function is the expected return type was boolean but we were returning nil. Also, since isAnagram() was being called on an instance of class we have to convert it to an instance method by removing the class keyword.
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
