#import "../../lib.typ": people

= Pre-Registration

#context people.get("FooBar")

#people.register((name: "FooBar", tags: ([Tag1], [Tag2],)))

= Post-Registration

#context people.get("FooBar")
