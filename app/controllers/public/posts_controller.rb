class Public::PostsController < ApplicationController
  before_action :authenticate_public!
end
