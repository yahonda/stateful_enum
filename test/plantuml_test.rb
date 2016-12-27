# frozen_string_literal: true

require 'test_helper'

class PlantumlTest < ActiveSupport::TestCase
  def test_plantuml
    FileUtils.rm_f Rails.root.join('Bug.puml')

    Dir.chdir Rails.root do
      `rails g stateful_enum:plantuml bug`
    end

    assert File.exist?(Rails.root.join('Bug.puml'))
  end

  def test_plantuml_to_a_relative_dest_dir
    FileUtils.rm_f Rails.root.join('tmp', 'Bug.puml')

    Dir.chdir Rails.root do
      `DEST_DIR=tmp rails g stateful_enum:plantuml bug`
    end

    assert File.exist?(Rails.root.join('tmp', 'Bug.puml'))
  end

  def test_plantuml_to_an_absolute_dest_dir
    FileUtils.rm_f Rails.root.join('doc', 'Bug.puml')

    Dir.chdir Rails.root do
      `DEST_DIR=#{Rails.root.join('doc')} rails g stateful_enum:plantuml bug`
    end

    assert File.exist?(Rails.root.join('doc', 'Bug.puml'))
  end
end
