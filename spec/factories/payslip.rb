FactoryBot.define do
  factory :payslip do
    from_date { Date.today }
    to_date { Date.today }
    month { "august" }
  end
end
