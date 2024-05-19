#import "../../lib.typ": pho

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
