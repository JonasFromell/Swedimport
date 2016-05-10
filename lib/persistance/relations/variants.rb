module Persistance
  module Relations
    class Variants < ROM::Relation[:mongo]
      register_as :variants

      dataset :variants
    end
  end
end
