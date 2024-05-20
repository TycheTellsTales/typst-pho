#import "../../lib.typ": registerBoard
#import "../../data.typ": boards

= Pre-Registration

#context boards.get()

#registerBoard("Test123", ("Test1", "Test2", "Test3"))

= Post-Registration

#context boards.get()
