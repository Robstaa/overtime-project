require 'rails_helper'

describe 'Posts' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user, run_callbacks: false)
  end

  describe 'navigate' do
    before do
        Post.create(date: Date.today, rationale: "Some rationale", user_id: @user.id)
        Post.create(date: Date.today, rationale: "Another rationale", user_id: @user.id)
        visit posts_path
    end

    describe 'index' do
      it 'can be reached successfully' do
        expect(page.status_code).to eq(200)
      end

      it 'has the static title \'Posts\'' do
        expect(page).to have_content(/Posts/)
      end

      it 'has a list of posts' do
        expect(page).to have_content(/Some rationale|Another rationale/)
      end

      describe 'scope' do
        before do
          scope_post = Post.create(date: Date.today, rationale: "Are you owner?", user_id: @user.id)
          visit posts_path
        end

        it 'has a scope so that post owners can see their own post' do
          expect(page).to have_content("Are you owner?")
        end

        it 'has a scope so that no regular user can see other people\'s posts' do
          other_user = FactoryBot.create(:non_authorized_user)
          other_post = Post.create(date: Date.today, rationale: "Second post", user_id: other_user.id)
          logout(:user)
          login_as(other_user, scope: :user)
          visit posts_path

          expect(page).to have_no_content("Are you owner?")
        end
      end
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be reached from the navbar' do
      visit root_path
      click_link("create_post_from_nav")

      expect(page.status_code).to eq(200)
    end

    it 'fills out the form' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Testing"

      expect(page).to have_field('post[rationale]', with: 'Testing')
    end

    # it 'redirects to the post page' do
    #   fill_in 'post[date]', with: Date.today
    #   fill_in 'post[rationale]', with: "redirection"

    #   find('#save-post-button').click

    #   expect(page).to have_content("Show page!")
    # end

    # it 'can be created from new form page' do
    #   fill_in 'post_date', with: Date.today
    #   fill_in 'post_rationale', with: "This is a test rationale"

    #   click_button("Save")

    #   expect(page).to have_content("This is a test rationale")
    # end

    # it 'will have a user associated with it' do
    #   fill_in 'post[date]', with: Date.today
    #   fill_in 'post[rationale]', with: "User Association"

    #   click_button "Save"

    #   expect(User.last.posts.last.rationale).to eq("User Association")
    # end
  end

  describe 'edit' do
    before do
      @edit_user = User.create(first_name: "edit", last_name: "user", email: "edit@user.com", password: "123456")
      login_as(@edit_user, scope: :user)
      @edit_post = Post.create(date: Date.today, rationale: "just text", user: @edit_user)
    end

    it 'has a page that can be reached through the index page' do
      visit posts_path
      click_link "edit_#{@edit_post.id}"
      expect(page.status_code).to eq(200)
    end

    # it 'can be edited' do
    #   fill_in 'post[date]', with: Date.today
    #   fill_in 'post[rationale]', with: "This is an updated rationale"

    #   click_on "Update"

    #   expect(page).to have_content("This is an updated rationale")
    # end

    it 'cannot be edited by different user than the post owner' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)

      visit edit_post_path(@edit_post)

      expect(current_path).to eq(posts_path)
    end
  end

  describe 'delete' do
    before do
      @post_to_delete = Post.create(date: Date.today, rationale: "This post is to test deletion", user: @user)
      visit posts_path
    end

    it "can be clicked on link 'delete' on the index page" do
      click_link "delete_#{@post_to_delete.id}"
    end

    it 'can be deleted from the index page' do
      click_link "delete_#{@post_to_delete.id}"
      expect(page).not_to have_content("This post is to test deletion")
    end
  end
end
