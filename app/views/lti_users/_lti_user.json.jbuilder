json.extract! lti_user, :id, :full_name, :given, :family, :username, :email, :created_at, :updated_at
json.url lti_user_url(lti_user, format: :json)
