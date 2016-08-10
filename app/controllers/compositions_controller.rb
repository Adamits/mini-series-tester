class CompositionsController < ApplicationController

  def index
    @compositions = Composition.published
  end
end
