import Combine

Just("Hello, Combine!").sink { value in
    print(value)
}
