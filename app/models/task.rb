class Task < ApplicationRecord
    belongs_to :project, optional: true
    belongs_to :activity_log
    # enum status: [:to_do, :in_progress, :rev  iew, :testing, :done]
end
