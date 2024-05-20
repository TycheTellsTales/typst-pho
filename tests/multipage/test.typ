#import "../../lib.typ": pho

#pho(
  viewer: "Tin Mother",
  poster: "Tin Mother",
  date: "January 1st 1001",
  endPage: 2,
  (topic, post) => {
    topic(
      title: "Hello World!",
      board: "Announcements",
    )[
      Hello World!\
      \
      This is a post\
    ]

    post("Tin Mother")[
      Reply 1
    ]

    post("Foo")[
      Reply 2
    ]

    post("Bar")[
      Reply 3
    ]

    post("Qaz")[
      Reply 4
    ]

    post("Baz")[
      Reply 5
    ]

    post("Tin Mother")[
      Reply 6
    ]

    post("Foo")[
      Reply 7
    ]

    post("Bar")[
      Reply 8
    ]

    post("Qaz")[
      Reply 9
    ]

    post("Baz")[
      Reply 10
    ]

    post("Tin Mother")[
      Reply 11
    ]

    post("Foo")[
      Reply 12
    ]

    post("Bar")[
      Reply 13
    ]

    post("Qaz")[
      Reply 14
    ]

    post("Baz")[
      Reply 15
    ]
})
