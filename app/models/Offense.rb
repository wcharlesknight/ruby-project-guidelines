class Offense < ActiveRecord::Base
    belongs_to :perpetrator
    belongs_to :neighborhood
end