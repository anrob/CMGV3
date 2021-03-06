class Actcode < ApplicationRecord
   belongs_to :management

   enum status: [:notactive, :active]

      scope :getallbycompany, lambda { |acts| where("management_id = ?", acts.management_id).includes(:management)} #|| lambda {|acts| where("management_id = ?", acts.roles_mask )}
      #scope :getallbycompany, lambda { |acts| where("management_id = ?", acts.roles_mask)}

      scope :mainacts,  -> { where(:management_id => [1,2,3,4,5,8,16,13])}
end
