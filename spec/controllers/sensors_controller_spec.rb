require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SensorsController do

  let(:valid_attributes) { { "name" => "Flexiforce", "type" => "WeightSensor" } }

  before (:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "assigns all sensors as @sensors" do
      sensor = create(:weight_sensor)
      get :index, {}
      assigns(:sensors).should eq([sensor])
    end
  end

  describe "GET show" do
    it "assigns the requested sensor as @sensor" do
      sensor = create(:weight_sensor)
      get :show, {:id => sensor.to_param}
      assigns(:sensor).should eq(sensor)
    end
  end

  describe "GET new" do
    it "assigns a new sensor as @sensor" do
      get :new, {}
      assigns(:sensor).should be_a_new(Sensor)
    end
  end

  describe "GET edit" do
    it "assigns the requested sensor as @sensor" do
      sensor = create(:weight_sensor)
      get :edit, {:id => sensor.to_param}
      assigns(:sensor).should eq(sensor)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sensor" do
        expect {
          post :create, {:sensor => valid_attributes}
        }.to change(Sensor, :count).by(1)
      end

      it "assigns a newly created sensor as @sensor" do
        post :create, {:sensor => valid_attributes}
        assigns(:sensor).should be_a(Sensor)
        assigns(:sensor).should be_persisted
      end

      it "redirects to the created sensor" do
        post :create, {:sensor => valid_attributes}
        response.should redirect_to(sensor_path(Sensor.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sensor as @sensor" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sensor.any_instance.stub(:save).and_return(false)
        post :create, {:sensor => { "name" => "invalid value" }}
        assigns(:sensor).should be_a_new(Sensor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sensor.any_instance.stub(:save).and_return(false)
        post :create, {:sensor => { "name" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sensor" do
        sensor = create(:sensor)
        # Assuming there are no other sensors in the database, this
        # specifies that the Sensor created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sensor.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => sensor.to_param, :sensor => { "name" => "MyString" }}
      end

      it "assigns the requested sensor as @sensor" do
        sensor = create(:weight_sensor)
        put :update, {:id => sensor.to_param, :sensor => valid_attributes}
        assigns(:sensor).should eq(sensor)
      end

      it "redirects to the sensor" do
        sensor = create(:sensor)
        put :update, {:id => sensor.to_param, :sensor => valid_attributes}
        response.should redirect_to(sensor)
      end
    end

    describe "with invalid params" do
      it "assigns the sensor as @sensor" do
        sensor = create(:weight_sensor)
        # Trigger the behavior that occurs when invalid params are submitted
        Sensor.any_instance.stub(:save).and_return(false)
        put :update, {:id => sensor.to_param, :sensor => { "name" => "invalid value" }}
        assigns(:sensor).should eq(sensor)
      end

      it "re-renders the 'edit' template" do
        sensor = create(:sensor)
        # Trigger the behavior that occurs when invalid params are submitted
        Sensor.any_instance.stub(:save).and_return(false)
        put :update, {:id => sensor.to_param, :sensor => { "name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sensor" do
      sensor = create(:sensor)
      expect {
        delete :destroy, {:id => sensor.to_param}
      }.to change(Sensor, :count).by(-1)
    end

    it "redirects to the sensors list" do
      sensor = create(:sensor)
      delete :destroy, {:id => sensor.to_param}
      response.should redirect_to(sensors_url)
    end
  end

end
