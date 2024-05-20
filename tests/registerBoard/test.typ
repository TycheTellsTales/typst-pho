#import "../../lib.typ": boards

= Pre-Registration

#context boards.get()

#context boards.register("Test123", ("Test1", "Test2", "Test3"))

= Post-Registration

#context boards.get()
