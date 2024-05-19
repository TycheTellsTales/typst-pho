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
  topic: "",
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

  #strong[#suit.diamond Topic: #topic] \
  #strong[In: #board.join(" " + triangle.filled.r + " ")] \
  #strong[#poster] #formatTags(tags) \
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

#let post(
  poster: "",
  op: "",
  date: "January 1st 1970",
  tags: (),
  body
) = [
  #if poster == op {
    tags.insert(0, "Original Poster")
  }

  #set par(
    first-line-indent: 0em,
  )

  #strong[#triangle.filled.r#poster] #formatTags(tags) \
  Replied On #date: \
  #body \
  \
]

#let page(startPage: 1, endPage: 1, op: "", date: "", codeblock) = {
  pageStart(startPage, endPage)

  codeblock(post.with(op: op, date: date))

  pageStart(startPage, endPage)
}


#let end() = [
  #align(center)[■]
]

