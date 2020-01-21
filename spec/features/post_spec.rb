describe "Posts", type: :feature do
  let(:user) {FactoryBot.create(:user)}



  before do
    login_as(user, :scope => :user)
  end

  it "create a new post" do
    visit new_post_path

    fill_in 'content', with: 'This is a small post'
    find("input[type='submit']").click
    expect(page).to have_content 'This is a small post'
  end
end