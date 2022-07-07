class CreateAlunosTable < ActiveRecord::Migration[7.0]
  def change
    create_table :alunos do |t|
      t.string :nome, :null => false
      t.string :email, :null => false

      t.timestamps
    end
  end
end
