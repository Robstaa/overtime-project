require 'rails_helper'

describe 'Posts' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'navigate' do
    before do
        post1 = FactoryBot.create(:post)
        post2 = FactoryBot.create(:second_post)
        visit posts_path
    end

    describe 'index' do
      it 'can be reached successfully' do
        expect(page.status_code).to eq(200)
      end

      it 'has the title \'Posts\'' do
        expect(page).to have_content(/Posts/)
      end

      it 'has a list of posts' do
        expect(page).to have_content(/Some rationale|Another rationale/)
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

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "This is a test rationale"

      click_on "Save"

      expect(page).to have_content("This is a test rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
      visit posts_path
      click_link("edit_#{@post.id}")
    end

    it 'has a page that can be reached through the index page' do
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "This is an updated rationale"

      click_on "Update"

      expect(page).to have_content("This is an updated rationale")
    end
  end

  describe 'delete' do
    before do
      @post = FactoryBot.create(:post, rationale: "This post is to test deletion")
      visit posts_path
    end

    it "can be clicked on link 'delete' on the index page" do
      click_link "delete_#{@post.id}"
      # expect(page.status_code).to eq(200)
    end

    it 'can be deleted from the index page' do
      click_link "delete_#{@post.id}"
      expect(page).not_to have_content("This post is to test deletion")
    end
  end
end
