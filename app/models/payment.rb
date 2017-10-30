class Payment < ActiveRecord::Base
    belongs_to :cart
    belongs_to :user
    belongs_to :store

    private
      def shipping_cost
        self.shipping = 380
      end
end
