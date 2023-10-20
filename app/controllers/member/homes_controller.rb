class Member::HomesController < ApplicationController

  def top
    @stores = Store.all
    @category_parent_array = Category.category_parent_array_create
  end

  def guest_sign_in
    member = Member.find_or_create_by!(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
  end
  sign_in member
  redirect_to stores_path, notice: 'ゲストログインとしてログインしました。'
  end
end
