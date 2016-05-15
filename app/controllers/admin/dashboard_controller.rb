class Admin::DashboardController < ApplicationController
  layout 'superman'

  authorize_resource :class => false

end