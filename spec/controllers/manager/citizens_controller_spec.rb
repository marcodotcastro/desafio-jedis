require 'rails_helper'

RSpec.describe Manager::CitizensController,
               type: :controller do
  let(:citizen) { create(:citizen) }
  let(:valid_attributes) do
    { full_name: 'Gessica Dutra', cns: '854154873000008', cpf: '03997653283', email: 'gessica.dutra@gmail.com', date_birth: Date.today - 18.years, phone: '5568981278826' }
  end
  let(:invalid_attributes) do
    { full_name: '' }
  end

  describe 'GET #index' do
    it 'assigns all citizens as @citizens' do
      get :index
      expect(assigns(:citizens)).to eq([citizen])
    end
  end

  describe 'GET #index with search' do
    it 'returns the citizens searched correctly' do
      citizen1 = create(:citizen, full_name: 'Cidadão 1')
      citizen2 = create(:citizen, full_name: 'Cidadão 2')

      get :index,
          params: {
            q:
              {
                full_name_cont:
                  'Cidadão 1'
              }
          }

      expect(assigns(:citizens)).to include(citizen1)
      expect(assigns(:citizens)).to_not include(citizen2)
    end

    it 'excludes non-matching results' do
      create(:citizen, full_name: 'Cidadão 1')

      get :index,
          params: {
            q: {
              full_name_cont:
                'Cidadão 2'
            }
          }

      expect(assigns(:citizens)).to be_empty
    end

    it 'renders the index template' do
      get :index,
          params: {
            q: {
              full_name_cont:
                '1'
            }
          }

      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested citizen as @citizen' do
      get :show, params: { id: citizen.id }
      expect(assigns(:citizen)).to eq(citizen)
    end
  end

  describe 'GET #new' do
    it 'assigns a new citizen as @citizen' do
      get :new
      expect(assigns(:citizen)).to be_a_new(Citizen)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested citizen as @citizen' do
      get :edit, params: { id: citizen.id }
      expect(assigns(:citizen)).to eq(citizen)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Citizen' do
        expect do
          post :create,
               params: { citizen: valid_attributes }
        end.to change(Citizen, :count).by(1)
      end

      it 'redirects to the created citizen' do
        post :create,
             params: { citizen: valid_attributes }
        expect(response).to redirect_to(manager_citizen_path(Citizen.last))
      end
    end

    context 'with invalid params' do
      it 're-renders the "new" template' do
        post :create,
             params: { citizen: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested citizen' do
        put :update,
            params: { id: citizen.id,
                      citizen: valid_attributes }
        citizen.reload
        expect(citizen.full_name).to eq('Gessica Dutra')
      end

      it 'redirects to the citizen' do
        put :update,
            params: { id: citizen.id,
                      citizen: valid_attributes }
        expect(response).to redirect_to(manager_citizen_path(citizen))
      end
    end

    context 'with invalid params' do
      it 're-renders the "edit" template' do
        put :update,
            params: { id: citizen.id,
                      citizen: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

end
