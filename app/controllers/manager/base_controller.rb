class Manager::BaseController < ApplicationController
  before_action :authenticate_user!

  layout 'manager/application'
end
