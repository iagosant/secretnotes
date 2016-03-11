require 'rails_helper'

feature 'Visiting Root' do
  it 'displays a sign in form' do
    visit root_path
    find_field('username')
    find_field('password')
  end

  it 'contains the text "Welcome"' do
    visit root_path
    expect(page).to have_content('Welcome')
  end

  it 'displays a "Register" link' do
    visit root_path
    find_link("Register")
  end

  it 'and clicking Register goes to registration path' do
    visit root_path
    find_link("Register").click
    expect(current_path).to eq(new_users_path)
  end

  it 'clicks the button create user and creates a user' do
    visit new_users_path
    fill_in('Username', :with => 'Juan')
    fill_in('Password', :with => '12345')
    fill_in('Password confirmation', :with => '12345')
    find_button('Create User').click
    expect(User.find_by(username: 'Juan')).to be_a(User)
  end
end

feature 'show user notes' do

  before do
    u = User.create(username: 'Jo')
    u.notes << Note.create(name: 'grocery list', body: 'buy this')
    request.session[:user] = u.id
    # some code to create a user
    # some code to sign in with that user
  end

  it 'displays a list of my notes' do
  end

end
