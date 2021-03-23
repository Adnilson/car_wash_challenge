# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


bmw = Maker.create(name: 'BMW')
bmw.models.create([
  { name: 'Series3' },
  { name: 'X1' }
])

toyota = Maker.create(name: 'Toyota')
toyota.models.create([
  { name: 'Yaris' },
  { name: 'RAV4' }
])

renault = Maker.create(name: 'Renault')
renault.models.create([
  { name: 'Clio' },
  { name: 'Megane' }
])
