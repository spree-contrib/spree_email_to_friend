require 'spec_helper'

describe Spree::EmailSenderController do

  it "should use EmailSenderController" do
    controller.should be_an_instance_of(Spree::EmailSenderController)
  end

end
