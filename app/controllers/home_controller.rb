class HomeController < ApplicationController
  def index
    @vari = ['test', 'testa', 'festa', 'aset']
    render 'home/index'
  end
end
