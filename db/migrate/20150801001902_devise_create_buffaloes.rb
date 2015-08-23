class DeviseCreateBuffaloes < ActiveRecord::Migration
  def change
    create_table(:buffaloes) do |t|
      ## Database authenticatable
      t.string :buffalo_name, null: false, default: ""
      t.string :username, null: false, default: ""
      t.string :wow_auth, null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.string :slug


      t.timestamps
    end

    add_index :buffaloes, :email,                unique: true
    add_index :buffaloes, :reset_password_token, unique: true
    add_index :buffaloes, :confirmation_token,   unique: true
    add_index :buffaloes, :unlock_token,         unique: true
    add_index :buffaloes, :buffalo_name,         unique: true
    add_index :buffaloes, :username,         unique: true
    add_index :buffaloes, :wow_auth,         unique: true
    add_index :buffaloes, :slug,         unique: true
  end
end
