class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    numberPerPage = 6
    if params[:search_text] != nil
      search = params[:search_text]
      @items = Item.where("LOWER(name) like ?", "%#{search.downcase}%")  
    else
      @items = Item.all
    end

    page = if params[:page].to_i > 0
      params[:page].to_i
    else
      1
    end
    
    @categories = Category.all
    @items = @items.paginate(:page => page, :per_page => numberPerPage)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @order_item = current_order.order_items.new
  end

  # GET /items/new
  def new
    @item = Item.new
    @categories = Category.all
  end

  # GET /items/1/edit
  def edit
    @categories = Category.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.published = Time.now

    edit_categories

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    edit_categories

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Edit the associated categories
    def edit_categories
      # Remove previous data
      @item.categories.delete_all

      # Retrieve checkbox ids
      if params[:category_ids]
        categories = Category.find(params[:category_ids])

        categories.each do |category|
          category.update_attributes(:item => @item)
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :author, :price, :description, 
        :preview_description, :published, :image, :category_ids)
    end

    # Check if the user is signed in before proceed
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path
      end
    end
end
