/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer{
    var ram: Int
    var yearManufactured: Int
    
    init?(ram: Int,yearManufactured: Int){
        if ram < 0 || yearManufactured < 1970 || yearManufactured > 2020{
            return nil
        }else{
            self.ram = ram
            self.yearManufactured = yearManufactured
        }
    }
}


//:  Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
let c1: Computer? = Computer(ram: 16,yearManufactured: 2015)
let c2: Computer? = Computer(ram: -1,yearManufactured: 2024)

if let good = c1{
    print("good computer \(good.ram) and \(good.yearManufactured)")
}else{
    print("failed to create computer")
}
if let bad = c2{
    print("bad computer \(bad.ram) and \(bad.yearManufactured)")
}else{
    print("failed to create computer")
}

/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
 */
