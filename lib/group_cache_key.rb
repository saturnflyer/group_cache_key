require 'activerecord'
require 'activesupport'
require 'digest/md5'

ActiveRecord::Base.class_eval {
  Array.class_eval {
    def cache_key
      if self.empty?
        'empty'
      else
        ids_hash = Digest::MD5.hexdigest(self.collect{|item| item.id }.to_s)
        update_timestamp = max {|a,b| a.updated_at <=> b.updated_at }.updated_at.to_i.to_s
        create_timestamp = max {|a,b| a.created_at <=> b.created_at }.created_at.to_i.to_s
        self.first.class.to_s.tableize+'/'+length.to_s+'-'+ids_hash+'-'+create_timestamp+'-'+update_timestamp
      end
    end
  }
}