ActiveAdmin.register OrderProductLicense do

  permit_params :order_id, :user_id, :product_id, :license

end
