class CreateBenefiteds < ActiveRecord::Migration[7.0]
  def change
    create_table :benefiteds do |t|
      t.string :name
      t.string :contact
      t.string :email

      t.timestamps
    end
  end
end
