class Professor < ApplicationRecord

    # Aqui temos duas regras no model para validar os dados.
    # Nestas regras, os campos nome e telefone são obrigarórios.
    validates :nome, presence: true
    validates :email, presence: true

end
