class Member::MembersController < ApplicationController
  before_action :authenticate_member!, except: [:top, :guest_sign_in, :about]

  def show
    @member = current_member
  end

  def mystore
    @member = current_member
    @stores = current_member.stores
  end

  def edit
    @member = current_member
    @members = Member.all
  end

  def unsubscribe
    @member = current_member
  end

  def withdraw
    @member = current_member
    @member.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def update
    @member = current_member
    @member.update(member_params)
    flash[:notice] = "情報変更完了"
    redirect_to members_mypage_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :email)
  end

end

