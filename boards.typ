////////////////
// PHO Boards //
////////////////

#let __default = "Brockton Bay"

#let __boards = state("pho_boards", (
  "Announcements": ("Announcements",),
  "Brockton Bay": ("Places", "America", [Brockton Bay Discussion (Public Board)]),
))

#let register(name, board) = {
  assert.eq(type(board), "array")

  context __boards.update(x => {
    x.insert(name, board)
    return x
  })
}

#let get() = {
  __boards.get()
}

#let resolve(board) = {
  if board == none {
    return get().at(__default)
  } else if type(board) == "string" {
    return get().at(board)
  }

  return board
}
