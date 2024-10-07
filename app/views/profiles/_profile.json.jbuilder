json.extract! profile, :id, :address1, :address2, :city, :state, :pincode, :mobile, :company_name, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
