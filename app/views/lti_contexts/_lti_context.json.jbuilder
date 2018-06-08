json.extract! lti_context, :id, :lti_id, :label, :title, :created_at, :updated_at
json.url lti_context_url(lti_context, format: :json)
