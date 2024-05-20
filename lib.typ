/////////////
// Imports //
/////////////

#import "./private.typ"
#import "./data.typ"

////////////////////
// Main Functions //
////////////////////

#let pho(
  viewer: "Tin Mother",
  poster: "",
  date: "April 10th 2011",
  startPage: 1,
  endPage: 1,
  lambda,
) = {
  context {
    if poster == "" {
      poster = viewer
    }

    let topic = private.topic.with(poster: poster, date: date)
    let key = "pho_post_" + str(query(selector(heading).before(here())).len())
    let count = state(key, 0)

    let post = private.paginator(
      op: poster,
      date: date,
      startPage: startPage,
      endPage: endPage,
      count,
    )

    private.header()
    lambda(topic, post)

    context {
      // Check if there are insufficient posts for the end of page post. If so
      // post it.
      if calc.rem(count.get(), 10) != 0 {
        let current = calc.floor((startPage + count.get() / 10))
        private.pageEnd(current, calc.max(current, endPage))
      }

      // Wrap it up with a square.
      private.end()
    }
  }
}

#let link(body) = [
  #text(green)[[#body]]
]

#let registerPerson(person) = {
  assert.ne(person.name, none)
  assert.eq(type(person.tags), "array")

  context data.people.update(x => {
    x.insert(person.name, person)
    return x
  })
}

// #let registerBoard() = {
// }
