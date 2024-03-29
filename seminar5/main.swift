//1. В рамках прошлого дз был создан класс пиццерии с переменной,
//   в которой хранится пицца, удалите ее. Необходимо создать
//   структуру картошки фри, в которой будет стоимость и размер
//   картошки и сделать так, чтобы в классе пиццерии была одна
//   переменная, в которую можно было бы класть и пиццу, и
//   картошку фри.
protocol FoodProtocol{
    var price: Double { get set }
}

struct Pizza: FoodProtocol {
    enum PizzaType{
        case pepperoni
        case cheese
        case veggie
        case bbqChicken
        case meatLovers
        case margherita
        case buffalo
        case hawaiian
        case supreme
        case theWorks
        case newYorkStyle
        case chicagoDeepDish
        case greekStyle
    }
    enum Additives{
        case cheeseMozzarella
        case cheeseProvolone
        case cheeseCheddar
        case cheeseParmesan
        case cheeseGouda
        case tomatoes
        case pepperoni
        case salmon
    }
    var price: Double
    var type: PizzaType
    var isThickDough: Bool
    var additives: [Additives]
}

struct FrenchFries: FoodProtocol{
    enum Size{
        case s
        case m
        case l
    }
    var price: Double
    var size: Size
}

class Pizzeria{
    private var foods: [FoodProtocol]
    init(foods: [FoodProtocol]){
        self.foods = foods
    }
    
//2. Добавьте в класс пиццерии функцию, которая будет добавлять
//   новую позицию в меню.
    func addFood(foods: FoodProtocol){
        self.foods.append(foods)
    }
    
    func getAllFood()-> [FoodProtocol]{
        foods
    }
}


var myPizzeria = Pizzeria(foods: [])

let pizzaHawaiian = Pizza(price: 399.99, type: .hawaiian, isThickDough: true, additives: [.pepperoni, .cheeseCheddar])
var pizzaPepperoni = Pizza(price: 500, type: .hawaiian, isThickDough: false, additives: [.cheeseGouda])
var pizzaCheese = Pizza(price: 250.50, type: .cheese, isThickDough: true, additives: [.tomatoes])
var pizzaChicagoDeepDish = Pizza(price: 400, type: .chicagoDeepDish, isThickDough: false, additives: [.salmon, .tomatoes])

let frenchFriesL = FrenchFries(price: 150, size: .l)
let frenchFriesM = FrenchFries(price: 110.5, size: .m)
let frenchFriesS = FrenchFries(price: 90.9, size: .s)

myPizzeria.addFood(foods: pizzaHawaiian)
myPizzeria.addFood(foods: pizzaPepperoni)
myPizzeria.addFood(foods: pizzaCheese)
myPizzeria.addFood(foods: pizzaChicagoDeepDish)
myPizzeria.addFood(foods: frenchFriesS)
myPizzeria.addFood(foods: frenchFriesM)
myPizzeria.addFood(foods: frenchFriesL)
print("-=<Task 1 and 2>=-")
for food in myPizzeria.getAllFood(){
    print(food)
}

//3. Создайте протокол, в котором будут содержаться функции
//   открытия и закрытия.
protocol OpenClose{
    func open()
    func close()
}


//4. Написать расширение для класса пиццерии, в котором будет
//   реализован протокол из пункта 3.
extension Pizzeria: OpenClose {

    func open(){
        print("Открыто.")
    }
    func close(){
        print("Закрыто!")
    }
}
print("\n-=<Task 3 and 4>=-")
myPizzeria.open()
myPizzeria.close()

//5. Написать функцию, в которой происходит вычитание одного числа
//   из другого. Функция должна работать и с Int, и с Double.Функция
//   должна возвращать результат вычитания.
print("\n-=<Task 5>=-")
func subtracting<T: Numeric>(a: T ,b: T ) -> T{
   return a - b
}
print(subtracting(a: 15.0, b: 10))
print(subtracting(a: 15, b: 10))

