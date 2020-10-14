class Admin::DashboardController < ApplicationController
  def show
    @product = Product.count
    @category = Category.count
  end
end
