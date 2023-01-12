class EventLink < ApplicationRecord
  belongs_to :person
  belongs_to :corp_event
end