require 'rails_helper'

RSpec.describe '/pokemons', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Listing. As you add validations to Listing, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      number: 46,
      name: 'test-pokemon',
      type1: 'Bug',
      total: 45,
      hp: 20,
      attack: 2,
      defense: 3,
      sp_attack: 6,
      sp_defence: 6,
      speed: 10,
      generation: 3,
      legendary: true,
    }
  end

  let(:invalid_attributes) { { name: 'incomplete' } }

  let(:valid_pokemon) { Pokemon.create!(valid_attributes) }

  describe 'GET /index' do
    before { valid_pokemon }

    it 'renders a successful response' do
      get(pokemons_url, as: :json)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).first['id']).to eq valid_pokemon.id
    end
  end

  describe 'GET /show' do
    before { valid_pokemon }

    it 'renders a successful response' do
      get(pokemon_url(valid_pokemon), as: :json)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['id']).to eq valid_pokemon.id
    end
  end

  describe 'POST /create' do
    let(:request) do
      post(
        pokemons_url,
        params: attributes,
        as: :json
      )
    end

    context 'with valid parameters' do
      let(:attributes) { valid_attributes }

      it 'creates a new Pokemon' do
        expect { request }.to change(Pokemon, :count).by(1)
      end

      it 'renders a JSON response with the new Pokemon' do
        request
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(JSON.parse(response.body)['name']).to eq 'test-pokemon'
      end
    end

    context 'with invalid parameters' do
      let(:attributes) { invalid_attributes }

      it 'does not create a new Pokemon' do
        expect { request }.not_to change(Pokemon, :count)
      end

      it 'renders a JSON response with errors for the new Pokemon' do
        request
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    let(:request) do
      patch(
        pokemon_url(valid_pokemon),
        params: new_attributes,
        as: :json
      )
    end

    before { valid_pokemon }

    context 'with valid parameters' do
      let(:new_attributes) do
        { attack: 36 }
      end

      it 'updates the requested listing' do
        expect do
          request
          valid_pokemon.reload
        end.to change(valid_pokemon, :attack).from(2).to(36)
      end

      it 'renders a JSON response with the listing' do
        request
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(JSON.parse(response.body)['id']).to eq valid_pokemon.id
      end
    end

    context 'with invalid parameters' do
      let(:new_attributes) do
        { type2: 'invalid' }
      end

      it 'renders a JSON response with errors for the listing' do
        request
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    let(:request) do
      delete(pokemon_url(valid_pokemon.id), as: :json)
    end

    before { valid_pokemon }

    it 'destroys the requested listing' do
      expect { request }.to change(Pokemon, :count).by(-1)
      expect { valid_pokemon.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
