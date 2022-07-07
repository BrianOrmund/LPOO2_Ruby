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
        @professores = Professor.all
    end

    def show
        @professor = Professor.find(params[:id])
    end

    def new
        @professor = Professor.new
    end

    def create
        @professor = Professor.new(nome: params[:contato][:nome], telefone: params[:contato][:telefone])

        if @professor.save
            redirect_to @professor
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @professor = Professor.find(params[:id])
    end

    def update
        @professor = Professor.find(params[:id])

        if @professor.update(nome: params[:professor][:nome], email: params[:professor][:email])
            redirect_to @professor
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @professor = Professor.find(params[:id])
        @professor.destroy
    
        redirect_to root_path, status: :see_other
    end
end
