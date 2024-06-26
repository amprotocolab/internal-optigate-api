module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    include QueryFields::User
    include QueryFields::SystemNotificationQueryFields 
    include QueryFields::PriceQueryFields 
    include QueryFields::FormQueryFields 
    include QueryFields::FormTemplateQueryFields
  end
end
