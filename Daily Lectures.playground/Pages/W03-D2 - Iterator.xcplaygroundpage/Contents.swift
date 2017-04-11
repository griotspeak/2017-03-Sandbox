
// IteratorProtocol
// A type that supplies the values of a sequence one at a time.


var arrayIterator = [1, 2, 3, 4, 5].makeIterator()

arrayIterator.next()
arrayIterator.next()
arrayIterator.next()
arrayIterator.next()
arrayIterator.next()
arrayIterator.next()

arrayIterator = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1].makeIterator()


var number: Int? = arrayIterator.next()
while number != nil {
    print(number!)
    number = arrayIterator.next()
}
