require 'test_helper'

class Widget < ActiveRecord::Base
  def self.columns
    []
  end
  attr_accessor :now
  def updated_at
    @now ||= Time.now
  end
  def created_at
    @now ||= Time.now
  end
  def id
    object_id
  end
  def self.empty_find
    []
  end
  def self.find
    [self.new, self.new]
  end
end

class GroupCacheKeyTest < Test::Unit::TestCase
  def test_empty_collection_should_return_unique_string_representation
    @widgets = Widget.empty_find
    assert_equal("empty/#{@widgets.object_id}", @widgets.cache_key)
  end
  def test_collection_should_return_unique_string_with_count_hash_and_timestamps
    @widgets = Widget.find
    hash = Digest::MD5.hexdigest(@widgets.collect{|w| w.id}.to_s)
    created = @widgets.first.created_at.to_i.to_s
    updated = @widgets.first.updated_at.to_i.to_s
    assert_equal("widgets/#{@widgets.length}-#{hash}-#{created}-#{updated}", @widgets.cache_key)
  end
end
