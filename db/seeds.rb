# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

beaus_beers = [
  {name: 'Night-Marzen', srm: 16, ibus: 30, abv: 5.5, brewery: 'Beaus'},
  {name: 'Bog Water', srm: 25, ibus: 0, abv: 6.6, brewery: 'Beaus'},
  {name: 'Festivale', srm: 13, ibus: 45, abv: 4.7, brewery: 'Beaus'},
  {name: 'Beaver River', srm: 18, ibus: 60, abv: 5.6, brewery: 'Beaus'},
  {name: 'Lug-Tread', srm: 4, ibus: 21, abv: 5.2, brewery: 'Beaus'}
]

broadhead_beers = [
  {name: 'Underdog Pale', srm: 6.9, ibus: 41.2, abv: 5.2, brewery: 'Broadhead Beer'},
  {name: 'Backbone Standard', srm: 4.0, ibus: 15.0, abv: 5.0, brewery: 'Broadhead Beer'},
  {name: 'Long Shot White', srm: 5.3, ibus: 13.5, abv: 5.0, brewery: 'Broadhead Beer'},
  {name: 'Grindstone Amber', srm: 11.8, ibus: 25.7, abv: 4.8, brewery: 'Broadhead Beer'},
  {name: 'Dark Horse Stout', srm: 34.2, ibus: 25.5, abv: 5.5, brewery: 'Broadhead Beer'},
  {name: 'Wildcard Ale', srm: 5.2, ibus: 22.7, abv: 5.0, brewery: 'Broadhead Beer'}
]

kitchesippi = [
  {name: 'Kitchesippi Blonde', srm: 6.9, ibus: 41.2, abv: 5.2, brewery: 'Kitchesippi'},
  {name: 'Kitchesippi 1855', srm: 18.0, ibus: 30, abv: 5.2, brewery: 'Kitchesippi'},
]

kitchesippi_brewery = Manufacturer.create(
  name: "Kitchesippi Beer Co.", phone: "+16137287845", email: "sheena@kbeer.ca",
  address1: "866 Campbell Ave", city: "Ottawa"
)

beaus_brewery = Manufacturer.create(
  name: "Beaus All Natural Brewing Co.", phone: "+18665852337", email: "ohyeah@beaus.ca",
  address1: "10 Terry Fox Dr.", city: "Vankleek Hill"
)

broadhead_brewery = Manufacturer.create(
  name: "Broadhead Brewing Company", phone: "+16136959444", email: "greetings@broadheadbeer.com",
  address1: "81 Auriga Dr.", address2: "Unit 13", city: "Ottawa"
)

beaus_brewery.beers.create(beaus_beers)

kitchesippi_brewery.beers.create(kitchesippi)

broadhead_brewery.beers.create(broadhead_beers)

BeerTap.create([
  {name: "left"},
  {name: "right"}
])
