#import emoji: suit
#import sym: triangle
#import "./data.typ": people, boards

///////////////
// Variables //
///////////////

#let __date = ""
#let __op = ""

#let __resetVariables(
  date: "January 1st 1970",
  op: "",

) = {
  __date = date
  __op = op
}

////////////////////
// PHO Formatting //
////////////////////

#let header(username: "Tin Mother") = [
  \
  #align(center)[■]
  \
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
  #align(center)[■]
  \
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
  #set par(
    first-line-indent: 0em,
  )
  #if board == none {
    board = boards.brockton
  }
  #if type(board) == "string" {
    board = boards.at(board)
  }
  #let person = people.at(poster, default: (name: poster, tags: tags))

  #strong[#suit.diamond Topic: #title] \
  #strong[In: #board.join(" " + triangle.filled.r + " ")] \
  #strong[#person.name] #formatTags(person.tags) \
  Posted On #date: \
  #body
]

#let pageStart(
  current,
  end,
) = [
  \
  #strong[(Showing page #current of #end)] \
  \
]

#let pageEnd(
  current,
  end,
) = {
  // [/indent] [b]End of Page.   1, [u]2[/u], [u]3[/u] ... [u]13[/u], [u]14[/u], [u]15[/u][/b] [indent]
  [#strong[End of Page.  #current]]
}

#let post(
  poster: "",
  op: "",
  date: "January 1st 1970",
  tags: (),
  body
) = [
  #let person = people.at(poster, default: (name: poster, tags: tags))
  #if person.name == op {
    person.tags.insert(0, "Original Poster")
  }

  #set par(
    first-line-indent: 0em,
  )

  #strong[#triangle.filled.r#person.name] #formatTags(person.tags) \
  Replied On #date: \
  #body \
  \
]

#let paginator(startPage: 1, endPage: 1, op: "", date: "", count) = {
  return (
    poster: "",
    tags: (),
    date: date,
    body,
  ) => {
    context {
      if calc.rem(count.get(), 10) == 0 {
        let start = startPage + count.get() / 10
        pageStart(start, endPage)
      }
    }

    post(op: op, date: date, poster: poster, tags: tags, body)
    context {
      [#count.update(x => x+1)]
    }

    context {
     if calc.rem(count.get(), 10) == 0 {
       let start = (startPage + count.get() / 10) - 1
       pageEnd(start, endPage)
     }
   }
  }
}


#let end() = [
  #align(center)[■]
]

