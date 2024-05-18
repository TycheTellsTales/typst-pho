/////////////
// Imports //
/////////////

#import "./private.typ"

///////////////////
// Main Function //
///////////////////

#let pho(
  user: "Tin Mother",
  poster: "",
  date: "April 10th 2011",
  startPage: 1,
  endPage: 1,
  lambda,
) = {
  if poster == "" {
    poster = user
  }

  private.header()

  let topic = private.topic;

  let ctx = (
    topic: private.topic.with(poster: poster, date: date),
    post: private.post.with(op: poster, date: date),
    link: private.link,
  )

  private.page(startPage, endPage)

  lambda(ctx)

  private.page(startPage, endPage)
  private.end()
}

/*
#pho(user: "Tin Mother", x => {
    (x.topic)(
      board: "announcements",
    )[
      Hello World!
    ]

    (x.post)(poster: "Tin Mother")[
      Reply 1
    ]

    (x.post)(poster: "Foo")[
      Reply 2
    ]
})
*/
