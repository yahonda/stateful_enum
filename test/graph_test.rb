# frozen_string_literal: true

require 'test_helper'

class GraphTest < ActiveSupport::TestCase
  def test_graph
    FileUtils.rm_f Rails.root.join('Bug.png')
    FileUtils.rm_f Rails.root.join('.smdconfig')

    Dir.chdir Rails.root do
      `rails g stateful_enum:graph bug`
    end

    assert File.exist?(Rails.root.join('Bug.png'))
  end

  def test_graph_to_a_relative_dest_dir
    FileUtils.rm_f Rails.root.join('tmp', 'Bug.png')

    Dir.chdir Rails.root do
      `DEST_DIR=tmp rails g stateful_enum:graph bug`
    end

    assert File.exist?(Rails.root.join('tmp', 'Bug.png'))
  end

  def test_graph_to_an_absolute_dest_dir
    FileUtils.rm_f Rails.root.join('doc', 'Bug.png')

    Dir.chdir Rails.root do
      `DEST_DIR=#{Rails.root.join('doc')} rails g stateful_enum:graph bug`
    end

    assert File.exist?(Rails.root.join('doc', 'Bug.png'))
  end
end
