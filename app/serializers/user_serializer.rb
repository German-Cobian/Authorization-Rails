class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :created_at, :is_enabled, :role
end
