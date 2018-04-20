# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create(name:'Aberta')
Status.create(name:'Iniciada')
Status.create(name:'Pausada')
Status.create(name:'Encerrada')

@company = Company.create(name: 'Tasks')
@company.save!
@client = Client.create(name: 'Interno', company_id: @company.id)
@client.save!
Project.create(name:'Tasks - Eduardo', client_id: @client.id)

# Category.create(name: 'Simples', hour_value: 40.0)
# Category.create(name: 'Média', hour_value: 80.0)
# Category.create(name: 'Complexa', hour_value: 120.0)
