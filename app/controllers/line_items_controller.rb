class LineItemsController < InheritedResources::Base
  include CurrentCart
  layout nil
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :no_access, only: [ :index, :show ]

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.json { render :show,
          status: :created,
          location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Item successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end

    def no_access
      flash[:alert] = "You do NOT have access to this!"
      redirect_to root_path
    end

end
