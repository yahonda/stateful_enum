module StatefulEnum
  class ConfigFile
    def self.load
      new.load
    end

    def load
      load_file(File.expand_path('.smdconfig', Dir.pwd))
    end

    def load_file(filename)
      content = {}
      YAML.load(File.read(filename)).each do |key, value|
        if ['output_path'].include?(key)
          content[key] = value
        end
      end
      content
    rescue
      {}
    end
  end
end
