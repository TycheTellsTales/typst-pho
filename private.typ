#import emoji: suit
#import sym: triangle
#import "./boards.typ"
#import "./people.typ"

///////////////
// Variables //
///////////////

#let originalPoster = "Original Poster"

////////////////////
// PHO Formatting //
////////////////////

#let centerSquare() = {align(center)[■]}

#let header(username: "Tin Mother") = [
  #centerSquare()
  #strong[Welcome to the Parahumans Online message boards.] \
  You are currently logged in, #emph[#username] \
  You are viewing: \
  - Threads you have replied to
  - AND Threads that have new replies
  - OR private message conversations with new replies
  - Thread OP is displayed.
  - Ten posts per page
  - Last ten messages in private message history.
  - Threads and private messages are ordered chronologically. 
  #centerSquare()
]

#let formatTags(tags) = {
  for tag in tags [ (#tag) ]
}

#let topic(
  title: "",
  poster: "",
  tags: (),
  board: none,
  date: "January 1st 1970",
  body,
) = [
  #context [
    #set par(
      first-line-indent: 0em,
    )

    #let person = people.get(poster,
      default: (name: poster, tags: tags),
    )
    #let boardName = context (("Boards",) + boards.resolve(board)).join(" " + triangle.filled.r + " ")

    #strong[#suit.diamond Topic: #title] \
    #strong[In: #boardName] \
    #strong[#person.name] #formatTags((person.tags + tags).dedup()) \
    Posted On #date: \
    #body
  ]
]

#let __tenthPost(count) = {
  return calc.rem(count.get(), 10) == 0
}

#let __newStart(start, count) = {
  calc.floor(start + count.get() / 10)
}

#let __newEnd(start, end, count) = {
  let posts = count.final()
  let extra = calc.floor(posts / 10)
  return calc.max(end, start+extra)
}


#let pageStart(
  start,
  end,
  count
) = [
  #let current = __newStart(start, count)
  #let end = __newEnd(start, end, count)
  \
  #strong[(Showing page #current of #end)] \
  \
]

#let __formatPageNumber(x, current) = {
  if x == current {
    return str(x)
  }

  return underline(str(x))
}

#let pageEnd(
  start,
  end,
  count,
) = {
  let current = __newStart(start, count)
  let end = __newEnd(start, end, count)

  let tmp = ()
  // The beginning of the range:
  tmp += range(1, calc.min(4, end+1))

  // Surrounding the current:
  tmp += range(
    calc.max(current - 2, 4),
    calc.min(current+3, end+1)
  )

  // The end of the range:
  tmp += range(
    calc.max(current, end - 2),
    end+1,
  )

  tmp = tmp.dedup()

  let pages = ()
  let previous = 0
  for x in tmp {
    if x - previous > 1 {
      pages.push(" ... ")
    } else if previous != 0 {
      pages.push(", ")
    }

    previous = x
    pages.push(__formatPageNumber(x, current))
  }

  [#strong[End of Page.  #pages.join("")]]
}

#let post(
  poster: "",
  op: "",
  date: "January 1st 1970",
  tags: (),
  body
) = {
  let person = people.get(poster, default: (name: poster, tags: tags))
  if person.name == op {
    person.tags.insert(0, originalPoster)
  }
  set par(
    first-line-indent: 0em,
  )

  block(inset: 1em)[
    #strong[#triangle.filled.r#person.name] #formatTags((person.tags + tags).dedup()) \
    Replied On #date: \
    #body
  ]
}

#let paginator(start: 1, end: 1, op: "", date: "", count) = {
  return (
    poster,
    tags: (),
    date: date,
    body,
  ) => {
    context {
     if __tenthPost(count) {
        pageStart(start, end, count)
      }
    }

    post(op: op, date: date, poster: poster, tags: tags, body)
    context {
      [#count.update(x => x+1)]
    }

    context {
     if __tenthPost(count) {
       pageEnd(start, end, count)
     }
   }
  }
}

