class Member::HomesController < ApplicationController

  def top
    @stores = Store.all
    @category_parent_array = Category.category_parent_array_create
  end

end
