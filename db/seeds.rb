# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User.delete_all
State.delete_all
Type.delete_all

#User.create!(name: admin, email: 'contato@ztc.com.br', password: '1234')

State.create!(id: 1, description: "Pendente")
State.create!(id: 2, description: "Concluído")
State.create!(id: 3, description: "Cancelado")

Type.create!(id: 1, description: "Gestão de Projetos")
Type.create!(id: 2, description: "Desenvolvimento")
Type.create!(id: 3, description: "Bugs")
Type.create!(id: 4, description: "Implantação")
Type.create!(id: 5, description: "Relatórios")
Type.create!(id: 6, description: "Documentação")