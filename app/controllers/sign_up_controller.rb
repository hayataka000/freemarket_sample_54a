class SignUpController < ApplicationController
  include Wicked::Wizard
  steps

  def show
   render_wizard
  end
end
