# Esta é a migration para criar a tabela contatos.
# Sempre que precisamos alterar o banco de dados com
# a criação de uma nova tabela ou alteração de campos,
# criamos uma migration que faz as alterações. Isso
# facilita quando fazemos o deploy em produção.

class CreateContatos < ActiveRecord::Migration[7.0]
  def change
    create_table :contatos do |t|
      t.string :nome, :null => false
      t.string :telefone, :null => false

      t.timestamps
    end
  end
end
