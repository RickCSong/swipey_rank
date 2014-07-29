require 'rails_helper'

describe GamesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Game. As you add validations to Game, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      game: {
        score: 100,
        duration: 9999,
        verification_token: 4224,
      },
      user: {
        username: 'ricksong',
        fullname: 'Rick Song',
      },
    }
  end

  describe 'POST create' do
    context 'with valid params' do
      subject { post :create, valid_attributes.merge(format: :json) }

      it 'creates a new User' do
        expect { subject }.to change(User, :count).by(1)
      end

      it 'creates a new Game' do
        expect { subject }.to change(Game, :count).by(1)
      end

      it 'should respond with success' do
        subject
        expect(response).to be_success
      end
    end

    context 'with invalid params' do
      subject { post :create, @attributes.merge(format: :json) }

      it 'should not create a game with an invalid verification token' do
        @attributes = valid_attributes
        @attributes[:game][:verification_token] = 4220
        expect { subject }.to_not change(Game, :count)
      end
    end

  end
end
