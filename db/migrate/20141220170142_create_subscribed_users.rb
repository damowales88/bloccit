class CreateSubscribedUsers < ActiveRecord::Migration
  def change
    create_table :subscribed_users do |t|
      t.string :email

      t.timestamps
    end
  end
end
