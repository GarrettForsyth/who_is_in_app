require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'with all attributes are valid' do
      it 'has a valid do' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
    context 'with invalid attributes' do
      it 'is invalid without a name' do
        user = FactoryBot.build(:user, name: '')
        expect(user).to_not be_valid
      end

      it 'is invalid with a blank name' do
        user = FactoryBot.build(:user, name: '    ')
        expect(user).to_not be_valid
      end

      it 'is invalid without an email' do
        user = FactoryBot.build(:user, email: '')
        expect(user).to_not be_valid
      end

      it 'is invalid with a blank email' do
        user = FactoryBot.build(:user, email: '    ')
        expect(user).to_not be_valid
      end

      it 'rejects invalid email addresses' do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                               foo@baz_baz.com foo@bar+baz.com foo@bar..com]
        invalid_addresses.each do |invalid_address| 
          user = FactoryBot.build(:user, email: invalid_address)
          expect(user).to_not be_valid
        end
      end

      it 'is invalid the email is not unique' do
        FactoryBot.create(:user, email: 'cool@email.com')
        user = FactoryBot.build(:user, email: 'cool@email.com')
        expect(user).to_not be_valid
      end

      it 'saves email in lowercase' do
        mixed_case_email = 'fOoBaR@ExAmPle.cOm'
        user = FactoryBot.create(:user, email: mixed_case_email)
        expect(user.email).to eq(mixed_case_email.downcase)
      end

      it 'is invalid with a blank password' do
        user = FactoryBot.build(:user, password: ' ' * 6)
        expect(user).to_not be_valid
      end

      it 'is invalid with a password under the minimum length' do
        user = FactoryBot.build(:user, password: 'a' * 5)
        expect(user).to_not be_valid
      end
    end
  end
end
