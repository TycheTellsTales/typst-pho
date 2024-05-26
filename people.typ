////////////////
// PHO People //
////////////////

#let normalise_name(name) = {
  lower(name.replace(regex("\W"), "_"))
}

// Populate the initial data.
#let __initial_data() = {
  let data = (:)

  for (name, tags) in (
    "Bagrat": ([Veteran Member], [The Guy in the Know]),
    "AverageAlexandros": ([Cape Husband],),
    "Brilliger": ([Moderator: Protectorate Main],),
    "Brocktonite03": ([Veteran Member],),
    "Miss Mercury": ([Protectorate Employee],),
    "Tin Mother": ([Moderator],),
    "XxVoid_CowboyxX": (),
    "Procto the Unfortunate Tinker": ([Not a tinker],),
    "Reave": ([Verified PRT Agent],),
    "Whitecollar": ([Cape Wife],),
    "Valkyr": ([Wiki Warrior],),
    "Vista": ([Verified Cape], [Wards ENE]),
  ) {
    data.insert(normalise_name(name), (name: name, tags: tags))
  }
  return data
}

#let __people = state("pho_people", __initial_data())

#let register(person) = {
  assert.ne(person.name, none)
  assert.eq(type(person.tags), "array")

  context __people.update(x => {
    if x.len() == 0 {
      x = (normalise_name(person.name): person)
    } else {
      x.insert(normalise_name(person.name), person)
    }
    return x
  })
}

#let get(name, default: none) = {
  if default == none {
    default = (name: name, tags: ())
  }

  return __people.get().at(normalise_name(name), default: default)
}
