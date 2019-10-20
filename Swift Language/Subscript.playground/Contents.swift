import UIKit

struct Student {
    var name: String
    var number: Int
}

class School {
    
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudentGroup(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    // Subscript 1 : 전달된 index의 students 배열요소를 반환 만약 배열 초가과 났을때는 에러 핸들링을 위해 nil 반환 -> optional
    subscript(index: Int) -> Student? {
        get {
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        set {   // newValue 는 Student 형
            guard var newStudent: Student = newValue else {
                return
            }
            
            var number: Int = index
            
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    // Subscript 2 :
    subscript(name: String) -> Int? {
        get {
            return self.students.filter{ $0.name == name }.first?.number
        }
        set {
            guard var number: Int = newValue else {
                return
            }
            
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student = Student(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    // Subscript 3 : 매개변수로 name 과 number를
    subscript(name: String, number: Int) -> Student? {
        return self.students.filter{ $0.name == name && $0.number == number }.first
    }
}

let highSchool: School = School()
highSchool.addStudentGroup(names: "A","B","C","D","E","F")

let student1: Student? = highSchool[1]
print("\(student1?.name) \(student1?.number)")


print(highSchool["A"])
print(highSchool["B"])

highSchool[0] = Student(name: "newA", number: 0)
print(highSchool[0])
highSchool["G"] = 1

print(highSchool["B"])  // nil
print(highSchool["G"])  // 새롭게 index가 변경되었기 때문에 1 이 출력
print(highSchool["E", 4]!)   // Optional(__lldb_expr_9.Student(name: "E", number: 4)) 해당 index와 name이 모두 맞아야 Student 객체를 반환한다.
