ActiveAdmin.register Profile do
  permit_params :address1, :address2, :city, :state, :pincode, :mobile, :company_name, :user_id
end
