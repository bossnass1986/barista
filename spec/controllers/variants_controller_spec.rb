require 'rails_helper'

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

RSpec.describe VariantsController, type: :controller do

  # This should return the minimal set of properties required to create a valid
  # Variant. As you add validations to Variant, be sure to
  # adjust the properties here as well.
  let(:valid_attributes) {
    skip("Add a hash of properties valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of properties invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VariantsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #terms" do
    it "assigns all variants as @variants" do
      variant = Variant.create! valid_attributes
      get :terms, {}, valid_session
      expect(assigns(:variants)).to eq([variant])
    end
  end

  describe "GET #terms" do
    it "assigns the requested variant as @variant" do
      variant = Variant.create! valid_attributes
      get :terms, {:id => variant.to_param}, valid_session
      expect(assigns(:variant)).to eq(variant)
    end
  end

  describe "GET #new" do
    it "assigns a new variant as @variant" do
      get :new, {}, valid_session
      expect(assigns(:variant)).to be_a_new(Variant)
    end
  end

  describe "GET #edit" do
    it "assigns the requested variant as @variant" do
      variant = Variant.create! valid_attributes
      get :edit, {:id => variant.to_param}, valid_session
      expect(assigns(:variant)).to eq(variant)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Variant" do
        expect {
          post :create, {:variant => valid_attributes}, valid_session
        }.to change(Variant, :count).by(1)
      end

      it "assigns a newly created variant as @variant" do
        post :create, {:variant => valid_attributes}, valid_session
        expect(assigns(:variant)).to be_a(Variant)
        expect(assigns(:variant)).to be_persisted
      end

      it "redirects to the created variant" do
        post :create, {:variant => valid_attributes}, valid_session
        expect(response).to redirect_to(Variant.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved variant as @variant" do
        post :create, {:variant => invalid_attributes}, valid_session
        expect(assigns(:variant)).to be_a_new(Variant)
      end

      it "re-renders the 'new' templates" do
        post :create, {:variant => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of properties valid for your model")
      }

      it "updates the requested variant" do
        variant = Variant.create! valid_attributes
        put :update, {:id => variant.to_param, :variant => new_attributes}, valid_session
        variant.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested variant as @variant" do
        variant = Variant.create! valid_attributes
        put :update, {:id => variant.to_param, :variant => valid_attributes}, valid_session
        expect(assigns(:variant)).to eq(variant)
      end

      it "redirects to the variant" do
        variant = Variant.create! valid_attributes
        put :update, {:id => variant.to_param, :variant => valid_attributes}, valid_session
        expect(response).to redirect_to(variant)
      end
    end

    context "with invalid params" do
      it "assigns the variant as @variant" do
        variant = Variant.create! valid_attributes
        put :update, {:id => variant.to_param, :variant => invalid_attributes}, valid_session
        expect(assigns(:variant)).to eq(variant)
      end

      it "re-renders the 'edit' templates" do
        variant = Variant.create! valid_attributes
        put :update, {:id => variant.to_param, :variant => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested variant" do
      variant = Variant.create! valid_attributes
      expect {
        delete :destroy, {:id => variant.to_param}, valid_session
      }.to change(Variant, :count).by(-1)
    end

    it "redirects to the variants list" do
      variant = Variant.create! valid_attributes
      delete :destroy, {:id => variant.to_param}, valid_session
      expect(response).to redirect_to(variants_url)
    end
  end

end
