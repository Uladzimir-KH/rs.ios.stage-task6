import Foundation

class CoronaClass {
 
     var seats = [Int]()
    var row: Array<Int>
    var s = 0, f = 0
    var maxDifference = 0
    var chair = 0

     init(n: Int) {
        row = Array(repeating: 0, count: n)
     }
     
     func seat() -> Int {
        if row.first == 0 {
            chair = 0
        } else if row.last == 0 {
            chair = row.count - 1
        } else if row.count > 2 {
            row.enumerated().forEach { i, v in
                if v == 1 {
                    f = i
                    if maxDifference == 0 {
                        if f - s >= 2 {
                            maxDifference = f - s
                            chair = s + (maxDifference)/2
                        }
                    } else
                    if f - s >= maxDifference + 2 || maxDifference + 1 == f - s && (maxDifference - 1) % 2 == 0
                    {
                        maxDifference = f - s
                        chair = s + (maxDifference)/2
                    }
                    s = i
                }
            }
        }
        maxDifference = 0
        s = 0
        row[chair] = 1
        seats.append(chair)
        seats.sort { $0 < $1 }
        print(seats)
        return chair
     }
     
     func leave(_ p: Int) {
        let i = seats.firstIndex(of: p)
        seats.remove(at: i!)
        row[p] = 0
     }
}
