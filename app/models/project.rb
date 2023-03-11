class Project < ApplicationRecord
    has_many :tasks
    # enum domain: [:fintech, :edutech]
    # enum project_type: [:short_term, :dedicated]
end
