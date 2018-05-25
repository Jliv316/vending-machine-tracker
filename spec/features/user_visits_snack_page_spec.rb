require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see the snack name' do
    owner = Owner.create(name: "Sam's Snacks")
    machine1  = owner.machines.create(location: "Don's Mixed Drinks")
    machine2  = owner.machines.create(location: "Turing")
    machine3  = owner.machines.create(location: "Space")

    snack = machine1.snacks.create(name: 'Cheetos', price: 2)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
  end

  scenario 'they see the snack price' do
    owner = Owner.create(name: "Sam's Snacks")
    machine1  = owner.machines.create(location: "Don's Mixed Drinks")
    machine2  = owner.machines.create(location: "Turing")
    machine3  = owner.machines.create(location: "Space")

    snack = machine1.snacks.create(name: 'Cheetos', price: 2)

    visit snack_path(snack)

    expect(page).to have_content(snack.price)
  end

  scenario 'they see the snack locations' do
    owner = Owner.create(name: "Sam's Snacks")

    snack = Snack.create(name: "Cheetos", price: 2)
    machine1 = snack.machines.create(location: "Don's Mixed Drinks", owner_id:owner.id)
    machine2 = snack.machines.create(location: "Turing", owner_id: owner.id)
    machine3 = snack.machines.create(location: "Space", owner_id: owner.id)

    visit snack_path(snack)

    expect(page).to have_content(machine1.location)
    expect(page).to have_content(machine2.location)
    expect(page).to have_content(machine3.location)
  end
end