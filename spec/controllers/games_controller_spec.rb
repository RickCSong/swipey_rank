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
      },
      user: {
        username: 'ricksong',
        fullname: 'Rick Song',
      },
      # user.username.length * 3 + game.score * 42
      swipey: 4224
    }
  end

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect {
          post :create, valid_attributes, format: :json
        }.to change(User, :count).by(1)
      end

      it 'creates a new Game' do
        expect {
          post :create, valid_attributes, format: :json
        }.to change(Game, :count).by(1)
      end

      # it "assigns a newly created game as @game" do
      #   post :create, {:game => valid_attributes}, valid_session
      #   expect(assigns(:game)).to be_a(Game)
      #   expect(assigns(:game)).to be_persisted
      # end
      #
      # it "redirects to the created game" do
      #   post :create, {:game => valid_attributes}, valid_session
      #   expect(response).to redirect_to(Game.last)
      # end
    end

    # context 'with invalid params' do
    #   it 'assigns a newly created but unsaved game as @game' do
    #     post :create, {:game => invalid_attributes}, valid_session
    #     expect(assigns(:game)).to be_a_new(Game)
    #   end
    #
    #   it "re-renders the 'new' template" do
    #     post :create, {:game => invalid_attributes}, valid_session
    #     expect(response).to render_template("new")
    #   end
    # end
  end
end
