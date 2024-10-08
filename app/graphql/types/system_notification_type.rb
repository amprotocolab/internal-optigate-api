module Types
  class SystemNotificationType < Types::BaseObject
    field :uuid, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :state, String, null: false  
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
