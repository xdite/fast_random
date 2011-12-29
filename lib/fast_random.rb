# -*- encoding : utf-8 -*-
require 'active_support/concern'
module FastRandom
  extend ActiveSupport::Concern
  
  module ClassMethods
    def random
      joins("join (SELECT CEIL(RAND() * (SELECT MAX(id) FROM #{table_name})) AS gid) AS r2").where("#{table_name}.id > r2.gid")
    end
  end
  
  module InstanceMethods
  end
  
end