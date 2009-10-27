require 'activerecord'
require 'activesupport'

ActiveRecord::Base.class_eval {
  Array.class_eval {
    def cache_key
      if self.empty?
        'empty'
      else
        update_timestamp = max {|a,b| a.updated_at <=> b.updated_at }.updated_at.to_i.to_s
        create_timestamp = max {|a,b| a.created_at <=> b.created_at }.created_at.to_i.to_s
        self.first.class.to_s.underscore+'/'+length.to_s+'-'+create_timestamp+'-'+update_timestamp
      end
    end
  }
}