ActiveAdmin.register Order do
  permit_params :price, :status, :user

  index do
    id_column
    column :payment_id
    column :total_price
    column "Products" do |order|
      order.line_items.map { |li| li.product.title }.compact
    end
    actions
  end

  show do |order|
    attributes_table do
      row :id
      row :status
      row :price
      row :payment_id
      row :user
    end
    div do
      panel("Line Items") do
        table_for(order.line_items) do
          column :quantity
          column "Title" do |i|
            link_to(i.product.title, admin_product_path(i.product))
          end
          column "Price" do |i|
            i.total_price
          end
        end
      end
    end
    active_admin_comments # Add this line for comment block
  end
end
