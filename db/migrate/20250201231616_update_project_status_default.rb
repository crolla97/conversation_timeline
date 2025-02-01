class UpdateProjectStatusDefault < ActiveRecord::Migration[8.0]
  def up
    change_column :projects, :status, :integer, default: 0
  end

  def down
    change_column :projects, :status, :string, default: nil
  end
end
