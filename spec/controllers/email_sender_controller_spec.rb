RSpec.describe Spree::EmailSenderController, type: :controller do
  let(:product) { create(:product) }

  before do
    allow(controller).to receive(:spree_current_user) { nil }
  end

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
