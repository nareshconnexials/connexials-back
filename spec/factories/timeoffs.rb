FactoryBot.define do
  factory :timeoff do
    from_date { Date.today }
    to_date { Date.today }
    from_session { "from session" }
    to_session { "to session" }
    days { 2 }
    mail_to { "test@example.com" }
    reason { "Any Reason" }
  end
end
