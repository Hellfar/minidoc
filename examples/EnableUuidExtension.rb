class EnableUuidExtension < ActiveRecord::Migration[5.0]
  def self.up
    enable_extension "uuid-ossp" unless extension_enabled?('uuid-ossp')
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  end

  def self.down
    disable_extension "uuid-ossp" if extension_enabled?('uuid-ossp')
    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
