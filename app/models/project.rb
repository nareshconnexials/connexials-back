class Project < ApplicationRecord
    has_many :tasks
    has_many :clients
    # enum domain: [:fintech, :edutech]
    # enum project_type: [:short_term, :dedicated]
end
