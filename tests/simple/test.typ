#import "../../lib.typ": pho, link

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