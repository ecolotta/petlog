class Api::ApplicationController < ApplicationController
  before_action :require_login
end
