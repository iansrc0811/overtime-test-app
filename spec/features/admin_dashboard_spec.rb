require 'rails_helper'

describe 'admin dashboard' do
  it 'does not allow users to access without being signed in ' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path) #轉送到建立新的user的頁面
  end

  it 'cannot be reach by a non admin users' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit admin_root_path
    expect(current_path).to eq(root_path) #轉送到主頁
  end

  it 'can be reach by an admin users' do
    admin_user = FactoryGirl.create(:admin_user)
    login_as(admin_user, :scope => :user)

    visit admin_root_path
    expect(current_path).to eq(admin_root_path) #轉送到主頁
  end
end