protocol Shape {
    func area() -> Double
    func perimeter() -> Double
}


class Circle: Shape {
    
    init(radius: Double) {
        self.radius = radius
    }
    
    let radius: Double
    
    func area() -> Double {
        return radius * radius * Double.pi
    }
    
    func perimeter() -> Double {
        return radius * 2 * Double.pi
    }
}


class Rectangle: Shape {
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    let width: Double
    let height: Double
    
    func area() -> Double {
        return width * height
    }
    
    func perimeter() -> Double {
        return 2 * (height + width)
    }
    
}

func generateShape() -> some Shape{
    return Circle(radius: 5)
}

func calculateShapeDetails(_ shape: Shape) -> ( Double, Double ) {
    return (shape.area(), shape.perimeter())
}

