enum Theme: String {
    case light =  "Light theme"
    case dark = "Dark theme"
    
    var description: String {
         switch(self) {
         case .light:
             return "barev"
         case .dark:
             return "hajogh"
         }
    }
}


let theme = Theme.dark
print(theme.rawValue)



switch(theme) {
    
case .light:
    print("barev")
    
case .dark:
    print("hajogh")
}

print(theme.description)


