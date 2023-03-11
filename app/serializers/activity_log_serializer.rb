class ActivityLogSerializer < ActiveModel::Serializer
  attributes :id, :reciepents_email_addresses, :status_date
  has_many :tasks, serializer: TaskSerializer
end
