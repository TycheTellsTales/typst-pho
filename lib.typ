/////////////
// Imports //
/////////////

#import "./private.typ"

///////////////////
// Main Function //
///////////////////

#let pho(
  viewer: "Tin Mother",
  poster: "",
  date: "April 10th 2011",
  startPage: 1,
  endPage: 1,
  lambda,
) = {
  if poster == "" {
    poster = viewer
  }

  let topic = private.topic.with(poster: poster, date: date)
  let page = private.page.with(
    startPage: startPage, endPage: endPage,
    op: poster, date: date,
  )

  private.header()
  lambda(topic, page)
  private.end()
}

#let link(body) = [
  #text(green)[[#body]]
]

#pho(
  viewer: "Tin Mother",
  poster: "Tin Mother",
  date: "January 1st 1001",
  (topic, page) => {
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

    page(post => {
      post(poster: "Tin Mother")[
        Reply 1
      ]

      post(poster: "Foo")[
        Reply 2
      ]
    })
})
