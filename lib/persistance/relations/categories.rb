module Persistance
  module Relations
    class Categories < ROM::Relation[:mongo]
      register_as :categories

      dataset :categories
    end
  end
end
