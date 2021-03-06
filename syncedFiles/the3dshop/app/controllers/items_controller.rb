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
    elsif params[:search_by_category] != nil
      @items = Item.joins(:categories).where("categories.id = ?", params[:search_by_category])
    else
      @items = Item.all.order(created_at: :desc)
    end

    page = if params[:page].to_i > 0
      params[:page].to_i
    else
      1
    end
    
    load_categories

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
    load_categories
  end

  # GET /items/1/edit
  def edit
    load_categories
  end

  # POST /items
  # POST /items.json
  def create
    load_categories
    @item = Item.new(item_params)
    @item.user = current_user
    @item.published = Time.now
    @item.categories = Category.find(params[:category_ids]) if params[:category_ids]

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
    @item.categories = Category.find(params[:category_ids]) if params[:category_ids]

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
      format.html { redirect_to user_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def load_categories
      @categories = Category.all
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
