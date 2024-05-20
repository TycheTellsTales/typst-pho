////////////////
// PHO People //
////////////////

#let __people = state("pho_people", (
  "Bagrat": (name: "Bagrat", tags: ([Veteran Member], [The Guy in the Know])),
  "AverageAlexandros": (name: "AverageAlexandros", tags: ([Cape Husband],)),
  "Brilliger": (name: "Brilliger", tags: ([Moderator: Protectorate Main],)),
  "Brocktonite03": (name: "Brocktonite03", tags: ([Veteran Member],)),
  "Miss Mercury": (name: "Miss Mercury", tags: ([Protectorate Employee],)),
  "Tin Mother": (name: "Tin Mother", tags: ([Moderator],)),
  "XxVoid_CowboyxX": (name: "XxVoid_CowboyxX", tags:()),
  "Procto the Unfortunate Tinker": (name: "Procto the Unfortunate Tinker", tags: ([Not a tinker],)),
  "Reave": (name: "Reave", tags: ([Verified PRT Agent],)),
  "Whitecollar": (name: "Whitecollar", tags: ([Cape Wife],)),
  "Valkyr": (name: "Valkyr", tags: ([Wiki Warrior],)),
  "Vista": (name: "Vista", tags: ([Verified Cape], [Wards ENE])),
))

#let register(person) = {
  assert.ne(person.name, none)
  assert.eq(type(person.tags), "array")

  context __people.update(x => {
    x.insert(person.name, person)
    return x
  })
}

#let get() = {
  context __people.get()
}