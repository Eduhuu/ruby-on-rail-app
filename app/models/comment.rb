class Comment < ApplicationRecord

    belongs_to :publication
    belongs_to :user, default: -> {Current.user}

end
