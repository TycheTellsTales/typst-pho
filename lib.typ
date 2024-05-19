/////////////
// Imports //
/////////////

#import "./private.typ"

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
    let key = "pho_post_0"
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
        let start = calc.floor((startPage + count.get() / 10))
        private.pageEnd(start, endPage)
      }

      // Wrap it up with a square.
      private.end()
    }
  }
}

#let link(body) = [
  #text(green)[[#body]]
]

// #let registerPerson() = {
// }
// 
// #let registerBoard() = {
// }

#pho(
  viewer: "Tin Mother",
  poster: "Tin Mother",
  date: "January 1st 1001",
  (topic, post) => {
    topic(
      title: "Hello World!",
      board: "Announcements",
    )[
      Hello World!\
      \
      This is a post\
      \
      #link[This is a link.jpg]
    ]

    post(poster: "Tin Mother")[
      Reply 1
    ]

    post(poster: "Foo")[
      Reply 2
    ]
})

#text(red)[#private.pageEnd(15, 30)]
