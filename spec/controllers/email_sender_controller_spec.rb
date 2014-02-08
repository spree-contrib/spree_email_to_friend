require 'spec_helper'

describe Spree::EmailSenderController do
  let(:product) { create(:product) }

  before { controller.stub spree_current_user: nil }

  it 'use EmailSenderController' do
    expect(controller).to be_an_instance_of(Spree::EmailSenderController)
  end

  context '#send_mail' do
    # can be different types but no clue what they can be except from product
    specify do
      spree_get :send_mail, { type: 'product', id: product.id }
      expect(response).to be_success
    end
  end
end
