class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @products = Product.all
    respond_to do |format|
      format.json { render @products }
      format.html
    end
  end

  def show
    respond_to do |format|
      format.json { render 'show.json', status: :created, location: @product }
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.json { render 'show.json', status: :created, location: @product }
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.json { render 'show.json', status: :ok, location: @product }
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
        flash[:notice] = 'Product was failed to update!!!'
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.json { render plain: { success:true }.to_json, status: 200, content_type: 'application/json'}
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  def import
    # ProductAddWorker.perform_async(params[:file], current_user)
    imported = Product.import(params[:file], current_user)
    if imported
      notice = 'Products Data Imported.'
    else
      notice = 'Something is wrong.'
    end
    redirect_to products_path, notice: notice
  end

  def download_csv
    send_file 'public/import.csv', type: 'application/csv', x_sendfile: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price).merge(user: current_user)
    end
end
