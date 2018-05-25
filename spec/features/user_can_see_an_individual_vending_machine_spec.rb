require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
     machine1  = owner.machines.create(location: "Don's Mixed Drinks")

     snack1 = machine1.snacks.create(name: 'Cheetos', price: 2)
     snack2 = machine1.snacks.create(name: 'Doritos', price: 3)
     snack3 = machine1.snacks.create(name: 'Cheezits', price: 1)

    visit machine_path(machine1)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the names of all the snacks in that vending machine' do
     owner = Owner.create(name: "Sam's Snacks")
     machine1  = owner.machines.create(location: "Don's Mixed Drinks")

     snack1 = machine1.snacks.create(name: 'Cheetos', price: 2)
     snack2 = machine1.snacks.create(name: 'Doritos', price: 3)
     snack3 = machine1.snacks.create(name: 'Cheezits', price: 1)

    visit machine_path(machine1)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack3.name)
  end

  scenario 'they see the average price of snacks in machine' do
     owner = Owner.create(name: "Sam's Snacks")
     machine1  = owner.machines.create(location: "Don's Mixed Drinks")

     snack1 = machine1.snacks.create(name: 'Cheetos', price: 2)
     snack2 = machine1.snacks.create(name: 'Doritos', price: 3)
     snack3 = machine1.snacks.create(name: 'Cheezits', price: 1)

    visit machine_path(machine1)

    expect(page).to have_content(machine1.average_snack_price)
  end
end
