describe "Posts", type: :feature do
    let(:user) {FactoryBot.create(:user)}
    let(:post) {user.posts.build(content: 'this is a comment')}
  
  
  
    before do
      login_as(user, :scope => :user)
    end

  
    it "create a new comment" do
      visit post_comment_path(post)
  
      fill_in 'content', with: 'This is a comment'
      find("input[type='submit']").click
      expect(page).to have_content 'This is a comment'
    end
  end