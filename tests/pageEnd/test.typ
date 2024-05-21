#import "../../private.typ": pageEnd
#let count = state("test", 0)

== 1-2
#context pageEnd(1, 2, count)

== 3-5
#context pageEnd(3, 5, count)

== 1-15
#context pageEnd(1, 15, count)

== 7-15
#context pageEnd(7, 15, count)
