class Member::MembersController < ApplicationController

  def show
    @member = current_member
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
    redirect_to members_mypage_path
  end

  private
    def member_params
      params.require(:member).permit(:name, :email)
    end

end

