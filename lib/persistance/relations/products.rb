module Persistance
  module Relations
    class Products < ROM::Relation[:mongo]
      register_as :products

      dataset :products
    end
  end
end
