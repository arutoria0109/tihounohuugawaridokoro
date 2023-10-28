class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path, notice:"変更完了！"
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_path, notice:"削除完了！"
  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :is_valid)
  end

end
