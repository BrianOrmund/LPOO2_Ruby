# Esta é a classe para o controller Contatos
#
# Cada método dessa classe implementa uma ação do CRUD
# (ou algum suporte a ela).
#
# - index: lista os contatos (R)
# - show: exibe um contato (R)
# - new: instancia um novo contato (C)
# - create: cria o contato instanciado no model (C)
# - edit: exibe o form para editar um contato (U)
# - update: atualiza o contato no model (U)
# - destroy: deleta um contato no model (D)

class ProfessoresController < ApplicationController

    def index
        @contatos = Contato.all
    end

    def show
        @contato = Contato.find(params[:id])
    end

    def new
        @contato = Contato.new
    end

    def create
        @contato = Contato.new(nome: params[:contato][:nome], telefone: params[:contato][:telefone])

        if @contato.save
            redirect_to @contato
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @contato = Contato.find(params[:id])
    end

    def update
        @contato = Contato.find(params[:id])

        if @contato.update(nome: params[:contato][:nome], telefone: params[:contato][:telefone])
            redirect_to @contato
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @contato = Contato.find(params[:id])
        @contato.destroy
    
        redirect_to root_path, status: :see_other
    end
end
