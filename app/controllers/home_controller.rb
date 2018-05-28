class HomeController < ApplicationController
  before_action :authenticate_admin!, except: [:main]

  def main

  end

  def dashboard

  end

  def test_oauth

  end

end