require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user)}

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:name) }

end
