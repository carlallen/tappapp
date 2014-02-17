require 'spec_helper'

describe BreweriesController do

  let(:valid_attributes) { { "name" => "Summit Brewery", "location" => "St. Paul, MN" } }

  describe "GET index" do
    it "assigns all breweries as @breweries" do
      brewery = create(:brewery)
      get :index, {}
      assigns(:breweries).should eq(Brewery.all)
    end
  end

  describe "GET show" do
    it "assigns the requested brewery as @brewery" do
      brewery = create(:brewery)
      get :show, {:id => brewery.to_param}
      assigns(:brewery).should eq(brewery)
    end
  end

  context "while authenticated" do
    before (:each) do
      @user = create(:user)
      sign_in @user
    end

    describe "GET new" do
      it "assigns a new brewery as @brewery" do
        get :new, {}
        assigns(:brewery).should be_a_new(Brewery)
      end
    end

    describe "GET edit" do
      it "assigns the requested brewery as @brewery" do
        brewery = create(:brewery)
        get :edit, {:id => brewery.to_param}
        assigns(:brewery).should eq(brewery)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Brewery" do
          expect {
            post :create, {:brewery => valid_attributes}
          }.to change(Brewery, :count).by(1)
        end

        it "assigns a newly created brewery as @brewery" do
          post :create, {:brewery => valid_attributes}
          assigns(:brewery).should be_a(Brewery)
          assigns(:brewery).should be_persisted
        end

        it "redirects to the created brewery" do
          post :create, {:brewery => valid_attributes}
          response.should redirect_to(Brewery.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved brewery as @brewery" do
          # Trigger the behavior that occurs when invalid params are submitted
          Brewery.any_instance.stub(:save).and_return(false)
          post :create, {:brewery => { "name" => "invalid value" }}
          assigns(:brewery).should be_a_new(Brewery)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Brewery.any_instance.stub(:save).and_return(false)
          post :create, {:brewery => { "name" => "invalid value" }}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested brewery" do
          brewery = create(:brewery)
          # Assuming there are no other breweries in the database, this
          # specifies that the Brewery created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Brewery.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => brewery.to_param, :brewery => { "name" => "MyString" }}
        end

        it "assigns the requested brewery as @brewery" do
          brewery = create(:brewery)
          put :update, {:id => brewery.to_param, :brewery => valid_attributes}
          assigns(:brewery).should eq(brewery)
        end

        it "redirects to the brewery" do
          brewery = create(:brewery)
          put :update, {:id => brewery.to_param, :brewery => valid_attributes}
          response.should redirect_to(brewery)
        end
      end

      describe "with invalid params" do
        it "assigns the brewery as @brewery" do
          brewery = create(:brewery)
          # Trigger the behavior that occurs when invalid params are submitted
          Brewery.any_instance.stub(:save).and_return(false)
          put :update, {:id => brewery.to_param, :brewery => { "name" => "invalid value" }}
          assigns(:brewery).should eq(brewery)
        end

        it "re-renders the 'edit' template" do
          brewery = create(:brewery)
          # Trigger the behavior that occurs when invalid params are submitted
          Brewery.any_instance.stub(:save).and_return(false)
          put :update, {:id => brewery.to_param, :brewery => { "name" => "invalid value" }}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested brewery" do
        brewery = create(:brewery)
        expect {
          delete :destroy, {:id => brewery.to_param}
        }.to change(Brewery, :count).by(-1)
      end

      it "redirects to the breweries list" do
        brewery = create(:brewery)
        delete :destroy, {:id => brewery.to_param}
        response.should redirect_to(breweries_url)
      end
    end
  end

end
