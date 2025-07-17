/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var collection: [Any] = [2.0,4,"pen",true]
print(collection)

//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in collection{
    if let intValue = item as? Int{
        print(intValue)
    }
    else if let stringValue = item as? String{
        print(stringValue)
    }
    else if let booleanValue = item as? Bool{
        print(booleanValue)
    }
    else if let doubleValue = item as? Double{
        print(doubleValue)
    }
    else{
        print("unknown value")
    }
}
//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var dict: [String: Any] = ["name": "mahika","height":5.4,"age":20,"hasAccess": true]
for(key, value) in dict{
    print("\(key) and \(value)")
}
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total:Double = 0
for (item,value) in dict{
    if let intValue = value as? Int{
       total += Double(intValue)
    }else if let doubleValue = value as? Double{
        total += doubleValue
    }else if let stringValue = value as? String{
        total += 1
    }else if let booleanValue = value as? Bool{
        if booleanValue == true{
            total += 2
        }else{
            total += 3
        }
    }
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for item in collection{
    if let intValue = item as? Int{
        total2 += Double(intValue)
    }else if let doubleValue = item as? Double{
        total2 += doubleValue
    }else if let stringValue = item as? String{
        if let number = Double(stringValue){
            total2 += number
        }
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
