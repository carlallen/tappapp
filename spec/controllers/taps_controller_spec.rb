require 'spec_helper'

describe TapsController do

  # This should return the minimal set of attributes required to create a valid
  # Tap. As you add validations to Tap, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "beer_name" => "Coffee Stout" } }

  describe "GET index" do
    it "assigns all taps as @taps" do
      tap = create(:tap)
      get :index, {}
      assigns(:taps).should eq([tap])
    end
  end

  context "while authenticated" do
    before (:each) do
      @user = create(:user)
      sign_in @user
    end

    describe "GET show" do
      it "assigns the requested tap as @tap" do
        tap = create(:tap)
        get :show, {:id => tap, format: :json}
        assigns(:tap).should eq(tap)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Tap" do
          expect {
            post :create, {:tap => valid_attributes}
          }.to change(Tap, :count).by(1)
        end

        it "assigns a newly created tap as @tap" do
          post :create, {:tap => valid_attributes}
          assigns(:tap).should be_a(Tap)
          assigns(:tap).should be_persisted
        end

        it "redirects to the tap list" do
          post :create, {:tap => valid_attributes}
          response.should redirect_to(taps_path)
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested tap" do
          tap = create(:tap)
          # Assuming there are no other taps in the database, this
          # specifies that the Tap created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Tap.any_instance.should_receive(:update_attributes).with({ "beer_name" => "IPA" })
          put :update, {:id => tap.to_param, :tap => { "beer_name" => "IPA" }, format: :json}
        end

        it "assigns the requested tap as @tap" do
          tap = create(:tap)
          put :update, {:id => tap.to_param, :tap => valid_attributes}
          assigns(:tap).should eq(tap)
        end

        it "redirects to the tap list" do
          tap = create(:tap)
          put :update, {:id => tap.to_param, :tap => valid_attributes}
          response.should redirect_to(taps_path)
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested tap" do
        tap = create(:tap)
        expect {
          delete :destroy, {:id => tap.to_param}
        }.to change(Tap, :count).by(-1)
      end

      it "redirects to the taps list" do
        tap = create(:tap)
        delete :destroy, {:id => tap.to_param}
        response.should redirect_to(taps_url)
      end
    end
  end

end
