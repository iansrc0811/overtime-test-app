require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
      visit edit_post_path(@post)
    end

    it 'has a status that can be edited on the form by an adim' do #測試 post status(radio bottum )
      choose('post_status_approved') #id of button (got from chrome dev tool)
      click_on "Save"

      expect(@post.reload.status).to eq('approved') # database有存取要記得加上'reload'不然會一直錯誤
    end

    it 'can not be edited by a non admin' do
      logout(:user)
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
      visit edit_post_path(@post)
      expect(page).to_not have_content('Approved') # 頁面不要出現'Approved' (radio bottun的labe之一 ，) 也就是不要產生radio bottun就對了
    end

    it 'should not be editable by the post  creator if status is approved' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)

      @post.update(user_id: user.id, status: 'approved')
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end
end
