# This migration comes from mobile_app_manager (originally 20120319184328)
class CreateMobileAppManagerMobileapps < ActiveRecord::Migration
  def change
    create_table :mobile_app_manager_mobileapps do |t|
      t.string :name
      t.string :version
      t.string :platform
      t.string :install_url
      t.string :relnotes_url

      t.timestamps
    end
  end
end
