class EventLinkSerializer
  include JSONAPI::Serializer
  belongs_to :corp_event
  belongs_to :person 
end
