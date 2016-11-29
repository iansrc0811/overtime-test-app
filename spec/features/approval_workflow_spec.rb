require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'has a status that can be edited on the form' do #測試 post status(radio bottum )
      visit edit_post_path(@post)

      choose('post_status_approved')
      click_on "Save"

      expect(@post.reload.status).to eq('approved') # database有存取要記得加上'reload'不然會一直錯誤
    end
  end
end
