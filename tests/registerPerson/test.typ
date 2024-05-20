#import "../../lib.typ": registerPerson
#import "../../data.typ": people

= Pre-Registration

#context people.get()

#registerPerson((name: "FooBar", tags: ([Tag1], [Tag2],)))

= Post-Registration

#context people.get()
