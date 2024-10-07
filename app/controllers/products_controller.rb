class ProductsController < InheritedResources::Base
  before_action :set_commontable_thread_show, only: :show
  before_action :no_access, except: [ :index, :show ]
  before_action :set_published_products, only: :index
  before_action :set_published_featured_deal, only: :index

  private

    # def product_params
    #   params.require(:product).permit(:title, :description, :slug, :sku, :deal_active, :product_type, :regular_price, :sale_price)
    # end

    def set_commontable_thread_show
      @product = Product.find(params[:id])
      commontator_thread_show(@product)
    end

    def no_access
      flash[:alert] = "You do NOT have access to this!"
      redirect_to root_path
    end

    def set_published_products
      @products = Product.published.order(created_at: :desc)
    end

    def set_published_featured_deal
      @featured_deal = Product.published_deal[0]
    end
end
