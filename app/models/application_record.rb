class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.search(area,keyword)
    where("address like?","%#{area}%").where("room_info like?" ,"%#{keyword}%")
  end
end
