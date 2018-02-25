require 'rails_helper'

describe 'Posts' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user, run_callbacks: false)
  end

  describe 'navigate' do
    before do
        Post.create(date: Date.today, rationale: "Some rationale", user_id: @user.id, overtime_request: 2.5)
        Post.create(date: Date.today, rationale: "Another rationale", user_id: @user.id, overtime_request: 2.5)
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
          scope_post = Post.create(date: Date.today, rationale: "Are you owner?", user_id: @user.id, overtime_request: 2.5)
          visit posts_path
        end

        it 'has a scope so that post owners can see their own post' do
          expect(page).to have_content("Are you owner?")
        end

        it 'has a scope so that no regular user can see other people\'s posts' do
          other_user = FactoryBot.create(:non_authorized_user)
          other_post = Post.create(date: Date.today, rationale: "Second post", user_id: other_user.id, overtime_request: 4)
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
      login_as(@user, scope: :user, run_callbacks: false)
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
    #   user =  User.create(first_name: "write", last_name: "user", email: "edit@user.com", password: "123456")
    #   login_as(user, scope: :user, run_callbacks: false)
    #   visit new_post_path
    #   fill_in 'post[date]', with: Date.today
    #   fill_in 'post[rationale]', with: "User Association"
    #   fill_in 'post[overtime_request]', with: 4.5

    #   expect {click_on "commit"}.to change(Post, :count).by(1)
    # end
  end

  describe 'edit' do
    before do
      @edit_user = Employee.create(first_name: "edit", last_name: "user", email: "edit@user.com", password: "123456", phone_number: "0123456789")
      login_as(@edit_user, scope: :user)
      @edit_post = Post.create(date: Date.today, rationale: "just text", user: @edit_user, overtime_request: 3)
    end

    it 'has a page that can be reached through the index page' do
      visit posts_path
      click_link "edit_#{@edit_post.id}"
      expect(page.status_code).to eq(200)
    end

    # it 'can be edited' do
    #   visit edit_post_path(@edit_post)
    #   # fill_in 'post[date]', with: Date.today
    #   fill_in 'post[rationale]', with: "This is an updated rationale"
    #   # fill_in 'post[overtime_request]', with: 4.5

    #   click_on "submit"

    #   expect(page).to have_content("This is an updated rationale")
    # end

    it 'cannot be edited by different user than the post owner' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)

      visit edit_post_path(@edit_post)

      expect(current_path).to eq(posts_path)
    end

    it 'cannot be edited after approval' do
      @edit_post.update(status: 'approved')

      visit edit_post_path(@edit_post)

      expect(current_path).to eq(posts_path)
    end

    it 'has no edit link when approved' do
      @edit_post.update(status: 'approved')

      visit posts_path
      expect(page).to have_no_link("edit_#{@edit_post.id}")
    end

    it 'cannot be edited after rejection' do
      @edit_post.update(status: 'rejected')

      visit edit_post_path(@edit_post)

      expect(current_path).to eq(posts_path)
    end

    it 'has no edit link when rejected' do
      @edit_post.update(status: 'rejected')

      visit posts_path
      expect(page).to have_no_link("edit_#{@edit_post.id}")
    end
  end

  describe 'delete' do
    before do
      @post_to_delete = Post.create(date: Date.today, rationale: "This post is to test deletion", user: @user, overtime_request: 2.5)
      visit posts_path
    end

    it 'can be deleted' do
      page.driver.submit(:delete, post_path(@post_to_delete),{})
      visit posts_path
      expect(page).not_to have_content("This post is to test deletion")
    end

    # it "can be clicked on link 'delete' on the index page" do
    #   click_link "delete_#{@post_to_delete.id}"
    # end

    # it 'can be deleted from the index page' do
    #   click_link "delete_#{@post_to_delete.id}"
    #   expect(page).not_to have_content("This post is to test deletion")
    # end
  end
end
