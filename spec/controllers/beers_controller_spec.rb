require 'spec_helper'

describe BeersController do

  let(:valid_attributes) { { "name" => "Porter", "brewery_name" => "TappApp Brewery" } }

  describe "GET index" do
    it "assigns all beers as @beers" do
      beer = create(:beer)
      get :index, {}
      assigns(:beers).should eq([beer])
    end
  end

  describe "GET show" do
    it "assigns the requested beer as @beer" do
      beer = create(:beer)
      get :show, {:id => beer.to_param}
      assigns(:beer).should eq(beer)
    end
  end

  context "while authenticated" do
    before (:each) do
      @user = create(:user)
      sign_in @user
    end

    describe "GET search" do
      it "assigns found beers as @beers" do
        response = File.new("spec/request_stubs/beers_search.txt")
        stub_request(:get, "http://api.brewerydb.com/v2/search?key&q=Day%20Tripper&type=beer&withBreweries=Y").to_return(response)
        get :search, q: "Day Tripper", format: :json
        assigns(:beers).length.should eq(10)
      end
    end

    describe "GET new" do
      it "assigns a new beer as @beer" do
        get :new, {}
        assigns(:beer).should be_a_new(Beer)
      end
    end

    describe "GET edit" do
      it "assigns the requested beer as @beer" do
        beer = create(:beer)
        get :edit, {:id => beer.to_param}
        assigns(:beer).should eq(beer)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Beer" do
          @brewery = create(:brewery)
          expect {
            post :create, {:beer => valid_attributes}
          }.to change(Beer, :count).by(1)
        end

        it "assigns a newly created beer as @beer" do
          @brewery = create(:brewery)
          post :create, {:beer => valid_attributes}
          assigns(:beer).should be_a(Beer)
          assigns(:beer).should be_persisted
        end

        it "redirects to the created beer" do
          @brewery = create(:brewery)
          post :create, {:beer => valid_attributes}
          response.should redirect_to(Beer.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved beer as @beer" do
          # Trigger the behavior that occurs when invalid params are submitted
          Beer.any_instance.stub(:save).and_return(false)
          post :create, {:beer => { "name" => "invalid value" }}
          assigns(:beer).should be_a_new(Beer)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Beer.any_instance.stub(:save).and_return(false)
          post :create, {:beer => { "name" => "invalid value" }}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested beer" do
          beer = create(:beer)
          # Assuming there are no other beers in the database, this
          # specifies that the Beer created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Beer.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => beer.to_param, :beer => { "name" => "MyString" }}
        end

        it "assigns the requested beer as @beer" do
          beer = create(:beer)
          put :update, {:id => beer.to_param, :beer => valid_attributes}
          assigns(:beer).should eq(beer)
        end

        it "redirects to the beer" do
          beer = create(:beer)
          put :update, {:id => beer.to_param, :beer => valid_attributes}
          response.should redirect_to(beer)
        end
      end

      describe "with invalid params" do
        it "assigns the beer as @beer" do
          beer = create(:beer)
          # Trigger the behavior that occurs when invalid params are submitted
          Beer.any_instance.stub(:save).and_return(false)
          put :update, {:id => beer.to_param, :beer => { "name" => "invalid value" }}
          assigns(:beer).should eq(beer)
        end

        it "re-renders the 'edit' template" do
          beer = create(:beer)
          # Trigger the behavior that occurs when invalid params are submitted
          Beer.any_instance.stub(:save).and_return(false)
          put :update, {:id => beer.to_param, :beer => { "name" => "invalid value" }}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested beer" do
        beer = create(:beer)
        expect {
          delete :destroy, {:id => beer.to_param}
        }.to change(Beer, :count).by(-1)
      end

      it "redirects to the beers list" do
        beer = create(:beer)
        delete :destroy, {:id => beer.to_param}
        response.should redirect_to(beers_url)
      end
    end
  end
end
