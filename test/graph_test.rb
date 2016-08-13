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

  def test_output_path
    FileUtils.rm_f Rails.root.join('doc', 'Bug.png')
    File.write(Rails.root.join('.smdconfig'), 'output_path: doc')

    Dir.chdir Rails.root do
      `rails g stateful_enum:graph bug`
    end

    assert File.exist?(Rails.root.join('doc', 'Bug.png'))
  end
end
