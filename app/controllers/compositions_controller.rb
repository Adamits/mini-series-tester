class CompositionsController < ApplicationController

  def index
    @compositions = Composition.all
  end
end
