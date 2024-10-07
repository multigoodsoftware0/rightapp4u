ActiveAdmin.register Product do

  permit_params :name, :title, :description, :slug, :sku, :deal_active, :published, :product_type, :regular_price, :sale_price, :slogan, :snippet, :tldr, :benefits, :total_licenses_available, :logo, :image, images: []

  member_action :delete_product_image, method: :delete do
   @pic = ActiveStorage::Attachment.find(params[:id])
   @pic.purge_later
   redirect_back(fallback_location: edit_admin_product_path)
  end

  form title: '' do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Details" do
      f.input :name
      f.input :title
      f.input :slogan
      f.input :logo, as: :file
      f.input :image, as: :file
      f.input :images, as: :file, input_html: { multiple: true }
      if f.object.images.attached?
       f.object.images.each do |img|
         span do
            image_tag(img)
          end
           span do
             link_to "delete",delete_product_image_admin_product_path(img.id),method: :delete,data: { confirm: 'Are you sure?' }
           end
        end
      end
      f.input :description, as: :trix_editor
      f.input :snippet, as: :trix_editor
      f.input :tldr, as: :trix_editor
      f.input :benefits, as: :trix_editor
      f.input :published
      f.input :deal_active
      f.input :product_type
      f.input :sku
      f.input :slug
      f.input :regular_price
      f.input :sale_price
      f.input :total_licenses_available
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :title
      row :slogan
      row :snippet
      row :tldr
      row :logo do |product|
        image_tag(product.logo)
      end
      row :image do |product|
        image_tag(product.image)
      end
      row "images" do |product|
        product.images.each do |image|
          span do
            image_tag(image)
          end
        end
      end
      row :description
      row :benefits
      row :published
      row :deal_active
      row :product_type
      row :sku
      row :slug
      row :regular_price
      row :sale_price
      row :total_licenses_available
    end
  end

  index do
    id_column
    column :name
    column :title
    column :sale_price
    column :regular_price
    column :published
    column :deal_active
    column :total_licenses_available
    actions
  end
end
