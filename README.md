# Worm PHO

Based on [Myrddin](https://ujamer.github.io/myrddin/)

## Example

```typst
#import "pho": pho, link

#pho(
  viewer: "Tin Mother",
  poster: "Tin Mother",
  date: "January 1st 1001",
  startPage: 5,
  endPage: 5,
  (topic, page) => {
    topic(
      title: "Hello World!",
      board: "Announcements",
    )[
      Hello World!\
      \
      This is a post\
      \
      #link[[This is a link.jpg]]
      #link[BLAMO]
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
```
