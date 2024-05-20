#import "../../lib.typ": pho

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
    ]

    post(poster: "Tin Mother")[
      Reply 1
    ]

    post(poster: "Foo")[
      Reply 2
    ]

    post(poster: "Bar")[
      Reply 3
    ]

    post(poster: "Qaz")[
      Reply 4
    ]

    post(poster: "Baz")[
      Reply 5
    ]

    post(poster: "Tin Mother")[
      Reply 6
    ]

    post(poster: "Foo")[
      Reply 7
    ]

    post(poster: "Bar")[
      Reply 8
    ]

    post(poster: "Qaz")[
      Reply 9
    ]

    post(poster: "Baz")[
      Reply 10
    ]

    post(poster: "Tin Mother")[
      Reply 11
    ]

    post(poster: "Foo")[
      Reply 12
    ]

    post(poster: "Bar")[
      Reply 13
    ]

    post(poster: "Qaz")[
      Reply 14
    ]

    post(poster: "Baz")[
      Reply 15
    ]
})
