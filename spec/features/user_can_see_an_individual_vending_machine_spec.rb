require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the names of all the snacks in that vending machine' do
     owner = Owner.create(name: "Sam's Snacks")
     machine1  = owner.machines.create(location: "Don's Mixed Drinks")

     snack1 = machine1.snacks.create(name: 'Cheetos')
     snack2 = machine1.snacks.create(name: 'Doritos')
     snack3 = machine1.snacks.create(name: 'Cheezits')

    visit machine_path(machine1)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack3.name)
  end
end
