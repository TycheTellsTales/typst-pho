/////////////
// Imports //
/////////////

#import "@preview/oxifmt:0.2.1": strfmt

#import "./private.typ" as __private
#import "./people.typ"
#import "./boards.typ"

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

    let pos = here().position()
    let key = strfmt("pho_post_{0}_{1}_{2}x{3}",
      poster,
      pos.page,
      calc.floor(pos.x.pt()),
      calc.floor(pos.y.pt()),
    )
    let count = state(key, 0)

    let topic = __private.topic.with(poster: poster, date: date)
    let post = __private.paginator(
      op:    poster,
      date:  date,
      start: startPage,
      end:   endPage,
      count,
    )

    __private.header(username: viewer)
    lambda(topic, post)

    context {
      // Check if there are insufficient posts for the end of page message to be
      // generated. If so post it.
      if not __private.__tenthPost(count) {
        __private.pageEnd(startPage, endPage, count)
      }

      // Wrap it up with a square.
      __private.centerSquare()
    }
  }
}

#let link(body) = [
  #text(green)[#body]
]
