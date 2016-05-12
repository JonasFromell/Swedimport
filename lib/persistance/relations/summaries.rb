module Persistance
  module Relations
    class Summaries < ROM::Relation[:mongo]
      register_as :summaries

      dataset :summaries
    end
  end
end
